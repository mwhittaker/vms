# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box            = "ubuntu/trusty64"
    config.vm.hostname       = "vm"
    config.ssh.forward_x11   = true
    config.ssh.forward_agent = true

    config.vm.provider "virtualbox" do |v|
        v.gui = true
        v.memory = 2048
        v.name = "cs186-2017fa"

        # By default, the download speed in the VM can be really slow. This
        # line speeds up the download speed considerably [1].
        #
        # [1] https://superuser.com/a/850389
        v.customize ["modifyvm", :id, "--nictype1", "virtio"]
    end

    config.vm.provision :shell, :path => "root_setup.sh"
    config.vm.provision :shell, privileged: false, :path => "user_setup.sh"
    config.vm.provision :shell, privileged: false, :path => "install_java8.sh"
    config.vm.provision :shell, privileged: false, :path => "install_postgres.sh"
end
