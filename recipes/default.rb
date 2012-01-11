elasticsearch = "elasticsearch-#{node.elasticsearch[:version]}"

# Create user and group
#
user node.elasticsearch[:user] do
  comment "ElasticSearch User"
  home    "#{node.elasticsearch[:dir]}/#{elasticsearch}"
  shell   "/bin/bash"
  action  :create
end
group node.elasticsearch[:user] do
  ( m = [] ) << node.elasticsearch[:user]
  m << 'ec2-user' if node.recipes.include?('elasticsearch::plugin_aws')
  members m
  action :create
end

# Create ES directories
#
%w| conf_path data_path log_path pid_path |.each do |path|
  directory node.elasticsearch[path.to_sym] do
    owner node.elasticsearch[:user] and group node.elasticsearch[:user] and mode 0755
    recursive true
    action :create
  end
end

# Create service
#
template "/etc/init.d/elasticsearch" do
  source "elasticsearch.init.erb"
  owner 'root' and mode 0755
end
service "elasticsearch" do
  supports :status => true, :restart => true
  action [ :enable ]
end

# Increase open file limits
#
bash "increase ulimit for elasticsearch user" do
  user 'root'
  
  code <<-END.gsub(/^    /, '')
    echo '#{node.elasticsearch.fetch(:user, "elasticsearch")}     -    nofile    #{node.elasticsearch[:limits][:nofile]}'  >> /etc/security/limits.conf
    echo '#{node.elasticsearch.fetch(:user, "elasticsearch")}     -    memlock   #{node.elasticsearch[:limits][:memlock]}' >> /etc/security/limits.conf
    echo 'session    required   pam_limits.so'                                       >> /etc/pam.d/su
  END
end

# Download ES
#

remote_file "/tmp/elasticsearch-#{node.elasticsearch[:version]}.tar.gz" do
  source "https://github.com/downloads/elasticsearch/elasticsearch/#{elasticsearch}.tar.gz"
end

# Move to ES dir
#
bash "Move elasticsearch to #{node.elasticsearch[:dir]}/#{elasticsearch}" do
  user "root"
  cwd  "/tmp"

  code <<-EOS
    rm -rf #{node.elasticsearch[:dir]}/#{elasticsearch}
    tar xfz /tmp/#{elasticsearch}.tar.gz
    mv --force /tmp/#{elasticsearch} #{node.elasticsearch[:dir]}
  EOS

  creates "#{node.elasticsearch[:dir]}/#{elasticsearch}/lib/#{elasticsearch}.jar"
  creates "#{node.elasticsearch[:dir]}/#{elasticsearch}/bin/elasticsearch"
end

# Ensure proper permissions
#
bash "Ensure proper permissions for #{node.elasticsearch[:dir]}/#{elasticsearch}" do
  user    "root"
  code    <<-EOS
    chown -R #{node.elasticsearch[:user]}:#{node.elasticsearch[:user]} #{node.elasticsearch[:dir]}/#{elasticsearch}
    chmod -R 775 #{node.elasticsearch[:dir]}/#{elasticsearch}
  EOS
end

# Symlink binaries
#
%w| elasticsearch plugin |.each do |f|
    link "/usr/local/bin/#{f}" do
      owner node.elasticsearch[:user] and group node.elasticsearch[:user]
      to    "#{node.elasticsearch[:dir]}/#{elasticsearch}/bin/#{f}"
    end
end

# Create file with ES environment variables
#
template "elasticsearch-env.sh" do
  path   "#{node.elasticsearch[:conf_path]}/elasticsearch-env.sh"
  source "elasticsearch-env.sh.erb"
  owner node.elasticsearch[:user] and group node.elasticsearch[:user] and mode 0755

  notifies :restart, resources(:service => 'elasticsearch')
end

# Create ES config file
#
template "elasticsearch.yml" do
  path   "#{node.elasticsearch[:conf_path]}/elasticsearch.yml"
  source "elasticsearch.yml.erb"
  owner node.elasticsearch[:user] and group node.elasticsearch[:user] and mode 0755

  notifies :restart, resources(:service => 'elasticsearch')
end

# Add Monit configuration file
#
monitrc("elasticsearch", :pidfile => "#{node.elasticsearch[:pid_path]}/#{node.elasticsearch[:node_name].to_s.gsub(/\W/, '_')}.pid") \
  if node.recipes.include?('monit')
