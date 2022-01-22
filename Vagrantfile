IMAGE_NAME = "ubuntu/impish64"

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 8192
        v.cpus = 4
    end

    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.60.10"
        config.vm.network "public_network", ip: "192.168.0.8", bridge: "wlp5s0"
        master.vm.hostname = "k8s-master"

        # Install ansible; as with vagrant it does not work
        master.vm.provision "shell",
            inline: "apt-get update -y -qq && apt-get upgrade -y -qq && apt-get install ansible -y -qq"

        # Provsion the box with ansible on the guest system
        master.vm.provision "ansible_local" do |ansible|
            ansible.playbook = "kubernetes-setup/master-playbook.yml"
            ansible.install  = false
            ansible.become   = true
            ansible.compatibility_mode = "2.0"
        end
    end
end
