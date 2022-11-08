terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.11.4"
    }
  }
}


provider "vultr" {
  # In your .bashrc you need to set
  # export VULTR_API_KEY="Your Vultr API Key"
}

resource "vultr_instance" "my_instance" {
  plan                   = var.one_cpu_one_gb_ram
  region                 = var.vultr_region
  os_id                  = var.os
  label                  = "terraform example"
  enable_ipv6            = false
  backups                = "disabled"
  activation_email       = false
  ddos_protection        = false
  tag                    = "tag"
  ssh_key_ids            = [ vultr_ssh_key.my_ssh_key.id ]

  provisioner "remote-exec" {
    # Install ansible to get all correct python configuration
    inline = [ "sudo apt-get update", "sudo apt-get install ansible -y", "echo Done!"]

    connection {
      host        = self.main_ip
      type        = "ssh"
      user        = "root"
      private_key = chomp(file("~/.ssh/id_rsa"))
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.main_ip},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' ansible.yml"
  }

}

resource "vultr_ssh_key" "my_ssh_key" {
  name = "my-ssh-key"
  ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
}


