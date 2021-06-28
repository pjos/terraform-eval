terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.3.3"
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
  firewall_group_id      = vultr_firewall_group.fwg.id
  ssh_key_ids            = [ vultr_ssh_key.my_ssh_key.id ]
}

resource "vultr_ssh_key" "my_ssh_key" {
  name = "my-ssh-key"
  ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
}

resource "vultr_firewall_group" "fwg" {
  description = "docker-fwg"
}

resource "vultr_firewall_rule" "tcp" {
  firewall_group_id = vultr_firewall_group.fwg.id
  protocol          = "udp"
  subnet            = vultr_instance.my_instance.main_ip
  subnet_size       = 32
  port              = "8080"
  ip_type           = "v4"
}

