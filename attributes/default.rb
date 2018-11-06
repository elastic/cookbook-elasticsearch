# empty settings (populate these for the elasticsearch::default recipe)
# see the resources or README.md to see what you can pass here.
default['elasticsearch']['user'] = {}
default['elasticsearch']['install'] = {}
default['elasticsearch']['configure'] = {}
default['elasticsearch']['service'] = {}
default['elasticsearch']['plugin'] = {}

# platform_family keyed download URLs
default['elasticsearch']['download_urls'] = {
  'debian' => 'https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-%s.deb',
  'rhel' => 'https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-%s.rpm',
  'tarball' => 'https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-%s.tar.gz',
}

default['elasticsearch']['package_base_name'] = 'elasticsearch'

# platform_family keyed download sha256 checksums
default['elasticsearch']['checksums']['6.0.0']['debian'] = '28f38779156387c1db274d8d733429e574b54b4f518da6f0741f6276f8229939'
default['elasticsearch']['checksums']['6.0.0']['rhel'] = '823fa8aa24e9948dea30f0a468f0403b34a62180e02ed752443d5964334c29a1'
default['elasticsearch']['checksums']['6.0.0']['tarball'] = '0420e877a8b986485244f603770737e9e4e47186fdfa1093768a11e391e3d9f4'

default['elasticsearch']['checksums']['6.0.1']['debian'] = 'ebe6c14638a4909155fe409fb46a7f52bcd3ad2151bfd2f400ab6f8f61c45b3e'
default['elasticsearch']['checksums']['6.0.1']['rhel'] = '25e7a8b152ea85886688398f48bc995d47cd2a12a7d98487748c6166f0732b85'
default['elasticsearch']['checksums']['6.0.1']['tarball'] = 'efaf32aba41e1b7fd086639c0f062c39e1f28b360a78d5c2b8deed797a4c5c57'

default['elasticsearch']['checksums']['6.1.0']['debian'] = '102be4439b1df7f7606003b3c839dbf69d3827c3e996563c98c0d54560b4fc16'
default['elasticsearch']['checksums']['6.1.0']['rhel'] = 'ebac1b4e1fc8ae3f7266cba93ef113510cba13435ada2c92480506d16cf6b865'
default['elasticsearch']['checksums']['6.1.0']['tarball'] = 'c879fe2698635a2f132db4a02d84f657bc0ccdb5c5f68dda5102f9b2afa508d7'

default['elasticsearch']['checksums']['6.1.1']['debian'] = '8b6e65dce742c733aa61da24f9c8c0d4d4b7f53ae11d7f4168e98b5a0ed58b45'
default['elasticsearch']['checksums']['6.1.1']['rhel'] = '9820555c72b61b54686bcf0697cdabace28b02315bb5a156999495a16b103d5a'
default['elasticsearch']['checksums']['6.1.1']['tarball'] = '0cadc90c2ab1bd941e3965eef96fbc2c08b12b832ae81f5882e81505333b74b6'

default['elasticsearch']['checksums']['6.1.2']['debian'] = '64d8bd2bd895904bb91daff656764b10da93531f2011c94d7c779124e53dd5f5'
default['elasticsearch']['checksums']['6.1.2']['rhel'] = 'bfa6809ac94bda92a4ec1bf601c8266f82a4c7842a7702da4dede8f7d5c6a2ec'
default['elasticsearch']['checksums']['6.1.2']['tarball'] = '9c0eae0bdab78c59dac0ba3a9c054e6785dc0f5ce4666e284f42010a326abc0f'

default['elasticsearch']['checksums']['6.2.0']['debian'] = 'eeb974247ea4360e37798888a5f49227d5ea33e11665a060c9b01b25140f9554'
default['elasticsearch']['checksums']['6.2.0']['rhel'] = '869b6506a35aad6b6d82fe987130402cef9b40c33ff7d98eeaa186eb2a628964'
default['elasticsearch']['checksums']['6.2.0']['tarball'] = '7be4a6580aca7d17b2fe1a1e589aa0a005b6240ef5dce6a5288a56f68021f8f6'

default['elasticsearch']['checksums']['6.2.1']['debian'] = '2b145aa11bccd2fe99256b9715ff665fe091b62fc699bc77cd07c528dcbf2391'
default['elasticsearch']['checksums']['6.2.1']['rhel'] = '47b97342821cbd1805826a18a7559a59bd045b9aef66e45c3b293b02aeaaeba8'
default['elasticsearch']['checksums']['6.2.1']['tarball'] = '0ccd13c53d23dcb2aea5c0f71dcbe81283e1e31d6ae5d40dec03656852cb468b'

default['elasticsearch']['checksums']['6.2.2']['debian'] = 'e0a694dcbbac993a4039978ca60e6c05b0bd78ec7eef20a1e95b98979579a47a'
default['elasticsearch']['checksums']['6.2.2']['rhel'] = 'a31277bb89b93da510bf40261882f710a448178ec5430c7a78ac77e91f733cf9'
default['elasticsearch']['checksums']['6.2.2']['tarball'] = 'b26e3546784b39ce3eacc10411e68ada427c5764bcda3064e9bb284eca907983'

default['elasticsearch']['checksums']['6.2.3']['debian'] = 'b54a1b685656a1424d4956e48daed923752fc268b79bb1b8616cc91f6a78e3bb'
default['elasticsearch']['checksums']['6.2.3']['rhel'] = 'd513a6f82436914c35e774529686e5fdfed1af77264e39228e5d64eee22c78ce'
default['elasticsearch']['checksums']['6.2.3']['tarball'] = '01dd8dec5f0acf04336721e404bf4d075675a3acae9f2a9fdcdbb5ca11baca76'

default['elasticsearch']['checksums']['6.2.4']['debian'] = 'f9c889bf1e2e897a881f624dab6a4aa3be5ec1f9d65b6d115021095496351969'
default['elasticsearch']['checksums']['6.2.4']['rhel'] = '9c13e0fb8bc90b7bd6e09c8ba922c2d89c2183bb6161047ec6549c0cbcccee72'
default['elasticsearch']['checksums']['6.2.4']['tarball'] = '91e6f1ea1e1dd39011e7a703d2751ca46ee374665b08b0bfe17e0c0c27000e8e'

default['elasticsearch']['checksums']['6.3.0']['debian'] = '659c3f9a90ae5fe4568d5103de3bbd37e8a03143447118ee61fe72d514b8f4d6'
default['elasticsearch']['checksums']['6.3.0']['rhel'] = 'b6d7951b8ad72c06e7a23263227e1b90b8aa6e5d5ee798a6c849934516121109'
default['elasticsearch']['checksums']['6.3.0']['tarball'] = '0464127140820d82b24bd2830232131ea85bcd49267a8bc7365e4fa391dee2a3'

default['elasticsearch']['checksums']['6.3.1']['debian'] = '350cc95201814ec39b1c80bbb8329faf1dae20a3386b28b626144c6f67ced333'
default['elasticsearch']['checksums']['6.3.1']['rhel'] = '073e2bc52a82bc099cca1534391a057c6506dbcb06e849e24ff4d60187ade4b3'
default['elasticsearch']['checksums']['6.3.1']['tarball'] = '0b4d1c3c66894c9bf54284b53c1448d0e6def89a09c9fe4446e7167e51b8040e'

default['elasticsearch']['checksums']['6.4.0']['debian'] = 'dc7b4b5583ad4689f57369fb8bf8c9b708cfc278701c895762378b010460f658'
default['elasticsearch']['checksums']['6.4.0']['rhel'] = 'b7b8e6265ec4a3aec509fe1e3fb054e6c64256ce7f4ab64d1d5b1629b24883c2'
default['elasticsearch']['checksums']['6.4.0']['tarball'] = 'e9786efb5cecd12adee2807c7640ba9a1ab3b484d2e87497bb8d0b6df0e24f01'

default['elasticsearch']['checksums']['6.4.1']['debian'] = 'ba71dbe16bfb6111dbe7d49ffd447ed1092a754636b30214067d31ff3059e100'
default['elasticsearch']['checksums']['6.4.1']['rhel'] = '2d63f9814ff67edc5c8a8e247ed359a8ef7e23cfbe3a438041a72b44b0be09b2'
default['elasticsearch']['checksums']['6.4.1']['tarball'] = '6fce529465975b2cd2f5aef09b459006636e4b903e623fd6361ae9feeebf1542'

default['elasticsearch']['checksums']['6.4.2']['debian'] = '4ca2cc982db8e46743a98e2c3d678e60c24331b28f79ea424bb8a323e611f678'
default['elasticsearch']['checksums']['6.4.2']['rhel'] = '8987285d92d0d94f0e842e51ba8ed04fb9ad5e078cc68f63ef2ff8ca1986ad08'
default['elasticsearch']['checksums']['6.4.2']['tarball'] = '32a9c0305faed1cbd4e22c85a8c333ca2b6704f1d0006e92709fada10cec3f45'
