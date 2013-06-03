node.elasticsearch[:data][:devices].each do |device, params|
  # Format volume if format command is provided and volume is unformatted
  #
  bash "Format device: #{device}" do
    __command  = "#{params[:format_command]} #{device}"
    __fs_check = params[:fs_check_command] || 'dumpe2fs'

    code __command

    only_if { params[:format_command] }
    not_if  "#{__fs_check} #{device}"
  end

  # Create directory with proper permissions
  #
  directory params[:mount_path] do
    owner node.elasticsearch[:user]
    group node.elasticsearch[:user]
    mode 0755
    recursive true
  end

  # Mount device to elasticsearch data path
  #
  mount "#{device}-to-#{params[:mount_path]}" do
    mount_point params[:mount_path]
    device  device
    fstype  params[:file_system]
    options params[:mount_options]
    action  [:mount, :enable]

    only_if { File.exists?(device) }
    if node.elasticsearch[:path][:data].include?(params[:mount_path])
      Chef::Log.debug "Schedule Elasticsearch service restart..."
      notifies :restart, 'service[elasticsearch]'
    end
  end

  # Ensure proper permissions
  #
  # TODO Add options to data bag for setting mount permissions "mode=755"
  directory params[:mount_path] do
    owner node.elasticsearch[:user]
    group node.elasticsearch[:user]
    mode 0755
    recursive true
  end
end
