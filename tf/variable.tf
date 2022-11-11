# 
# https://www.vultr.com/api/
#


variable "vultr_region" {
  description = "Vultr Frankfurt Region"
  default = "sto"
}

# curl "https://api.vultr.com/v2/os" -X GET   -H "Authorization: Bearer ${VULTR_API_KEY}" | jq
variable "os" {
  description = "Fedora 37 x64"
  default = 1946
#  default = 1929
}

# curl "https://api.vultr.com/v2/plans"   -X GET   -H "Authorization: Bearer ${VULTR_API_KEY}" | jq
variable "one_cpu_one_gb_ram" {
  description = "1024 MB RAM,25 GB SSD,1.00 TB BW"
  default = "vc2-6c-16gb"
  #default = "vc2-1c-1gb"
}

variable "pub_key" {
  description = "Public SSH key"
  default = "/var/lib/ssh/id_ed25519.pub"
}

variable "pvt_key" {
  description = "Private SSH key"
  default = "/var/lib/ssh/id_ed25519"
}