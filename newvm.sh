#! /usr/bin/env bash

usage() {
    echo "Usage: newvm.sh <vm_name>"
}

main() {
    if [[ "$#" -ne 1 ]]; then
        usage
        exit 1
    fi
    local -r vmname="$1"

    if [[ -e "$vmname" ]]; then
        echo "VM '$vmname' already exists."
        exit 1
    fi

    mkdir "$vmname"
cat > "$vmname/Vagrantfile" <<vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box            = "ubuntu/trusty64"
    config.vm.hostname       = "$vmname"
    config.ssh.forward_x11   = true
    config.ssh.forward_agent = true
    config.vm.network "forwarded_port", guest: 8000, host: 8000

    config.vm.provider "virtualbox" do |v|
        v.cpus = 1
        v.memory = 1024
        v.name = "$vmname"
    end

    config.vm.provision :shell, :path => "root_setup.sh"
end
vagrantfile
cat > "$vmname/README.md" <<readme
# $vmname
\`\`\`bash
bash /vagrant/install_dotfiles.sh
\`\`\`
readme
    cp install_dotfiles.sh "$vmname"
    cp root_setup.sh "$vmname"
}

main "$@"
