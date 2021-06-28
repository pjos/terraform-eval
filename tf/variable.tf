variable "vultr_region" {
  description = "Vultr Frankfurt Region"
  default = "fra"
}

variable "os" {
  description = "Ubuntu 20.10"
  default = 413
}

variable "one_cpu_one_gb_ram" {
  description = "1024 MB RAM,25 GB SSD,1.00 TB BW"
  default = "vc2-1c-1gb"
}
