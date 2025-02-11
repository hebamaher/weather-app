Vagrant.configure("2") do |config|

  
### DB vm  ####
  config.vm.define "m01" do |m01|
    m01.vm.box = "eurolinux-vagrant/centos-stream-9"
    m01.vm.hostname = "m01"
    m01.vm.network "private_network", ip: "192.168.56.15"
    m01.vm.provider "virtualbox" do |vb|
     vb.memory = "600"
   end
  end
  
### Memcache vm  #### 
  config.vm.define "m02" do |m02|
    m02.vm.box = "eurolinux-vagrant/centos-stream-9"
    m02.vm.hostname = "m02"
    m02.vm.network "private_network", ip: "192.168.56.14"
    m02.vm.provider "virtualbox" do |vb|
     vb.memory = "600"
   end
  end
  
  
### VM3 ###
#  config.vm.define "m03" do |m03|
#    m03.vm.box = "ubuntu/jammy64"
#    m03.vm.hostname = "m03"
#  m03.vm.network "private_network", ip: "192.168.56.11"
#  m03.vm.provider "virtualbox" do |vb|
#     vb.gui = true
#     vb.memory = "600"
#   end
#end
  
end
