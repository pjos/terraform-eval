variable "vultr_region" {
  description = "Vultr Frankfurt Region"
  default = "fra"
}

variable "os" {
  description = "Ubuntu 18.04"
  default = 270
}

variable "one_cpu_one_gb_ram" {
  description = "1024 MB RAM,25 GB SSD,1.00 TB BW"
  default = "vc2-1c-1gb"
}

variable "pub_key" {
  description = "Public SSH key"
  default = "~/.ssh/id_rsa.pub"
}

variable "pvt_key" {
  description = "Private SSH key"
  default = "~/.ssh/id_rsa"
}