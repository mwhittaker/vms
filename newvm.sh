#! /usr/bin/env bash

set -euo pipefail

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

    config.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true
    config.vm.network "forwarded_port", guest: 8001, host: 8001, auto_correct: true
    config.vm.network "forwarded_port", guest: 8002, host: 8002, auto_correct: true
    config.vm.network "forwarded_port", guest: 8003, host: 8003, auto_correct: true
    config.vm.network "forwarded_port", guest: 8004, host: 8004, auto_correct: true
    config.vm.network "forwarded_port", guest: 8005, host: 8005, auto_correct: true
    config.vm.network "forwarded_port", guest: 8006, host: 8006, auto_correct: true
    config.vm.network "forwarded_port", guest: 8007, host: 8007, auto_correct: true
    config.vm.network "forwarded_port", guest: 8008, host: 8008, auto_correct: true
    config.vm.network "forwarded_port", guest: 8009, host: 8009, auto_correct: true

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
    (cd "$vmname" && ln -s ../root_setup.sh .)
}

main "$@"
