# vagrant init hashicorp/precise64

domain = 'slalom.vm'

puppet_nodes = [
  {
    :hostname => 'spring',
    :ip => '172.16.32.12',
    :box => 'puppetlabs/ubuntu-14.04-64-puppet',
    :manifest => 'spring.pp',
    :fwdguest => 9010,
    :fwdhost => 9010,
    :ram => 512
  },
]

Vagrant.configure("2") do |config|
  puppet_nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      # Basic box setup
      node_config.vm.box = node[:box]
      node_config.vm.hostname = node[:hostname] + '.' + domain
      node_config.vm.network :private_network, ip: node[:ip]

      # Port forwarders
      if node[:fwdhost]
        node_config.vm.network :forwarded_port, guest: node[:fwdguest], host: node[:fwdhost]
      end

      # Memory
      memory = node[:ram] ? node[:ram] : 256;

      # Puppet library setup
      node_config.librarian_puppet.puppetfile_dir = "puppet"
      node_config.librarian_puppet.placeholder_filename = ".MYPLACEHOLDER"
      node_config.librarian_puppet.use_v1_api = '1'
      node_config.librarian_puppet.destructive = false

      # Setup provider with params from node
      node_config.vm.provider :vmware_fusion do |vb|
        vb.customize [
          'modifyvm', :id,
          '--name', node[:hostname],
          '--memory', memory.to_s
        ]
      end

      # Puppet configs
      node_config.vm.provision :puppet do |puppet|
  	    puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = node[:manifest]
        puppet.options = "--verbose"
  	    puppet.module_path = "puppet/modules"
      end
    end
  end
end
