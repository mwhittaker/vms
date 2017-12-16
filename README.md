# Virtual Machines

## Overview
Installing and configuring a piece of software is hard. Installing and
configuring a bunch of potentially conflicting pieces of software with
varying versions is even harder. And when things go wrong, it's not always
obvious how to fix them. By developing in a virtual machine (VM), installation
and configuration can be tamed, and if anything goes wrong, you can throw away
the VM and try again! This directory contains a set of VMs managed by vagrant.

## Getting Started
Install [vagrant](https://www.vagrantup.com/downloads.html) and
[VirtualBox](https://www.virtualbox.org/wiki/Downloads). Navigate into a VM's
directory, start the VM, and ssh into it. For example,

```bash
cd prolog
vagrant up
vagrant ssh
```

Once you've sshed into a VM, run any installation scripts in the `/vagrant`
directory.

```bash
bash /vagrant/install_dotfiles.sh
bash /vagrant/install_prolog.sh
```

## Creating New VMs
You can create new VMs using the [`newvm.sh`](newvm.sh) script. For example,

```bash
# Make a new VM for typescript.
./newvm.sh typescript
cd typescript && vagrant up && vagrant ssh
```

## Misc
- If you'd like to change the timezone within the VM, run [`sudo
  dpkg-reconfigure tzdata`][tzdata_command] or [`sudo timedatectl set-timezone
  America/Los_Angeles`][timedatectl_command]. If the time starts to drift, run
  [`sudo ntpdate time.nist.gov`][ntpdate_command].
- If you're using a GUI, you can change caps lock to control using the
  instructions [here](https://askubuntu.com/a/604949).

[tzdata_command]: http://askubuntu.com/a/3385
[timedatectl_command]: https://askubuntu.com/questions/3375/how-to-change-time-zone-settings-from-the-command-line
[ntpdate_command]: https://askubuntu.com/a/81485

