# -*- mode: ruby -*-
# vi: set ft=ruby :

BRANCH = ENV['BRANCH'] || "master"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "boxcutter/centos72-docker"
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision :shell, :path => "provision.sh", :args => "-b" + BRANCH
  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.memory = 2048
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vbguest.auto_update = false

end
