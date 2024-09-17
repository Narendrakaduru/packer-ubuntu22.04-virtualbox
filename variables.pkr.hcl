variable "name" {
  type    = string
  default = "jammy64"
}

variable "cpus" {
  type    = string
  default = "2"
}

variable "memory" {
  type    = string
  default = "2048"
}

variable "disk_size" {
  type    = string
  default = "204800"
}

variable "iso_checksum" {
  type    = string
  default = "9bc6028870aef3f74f4e16b900008179e78b130e6b0b9a140635434a46aa98b0"
}

variable "iso_checksum_type" {
  type    = string
  default = "sha256"
}

variable "iso_url" {
  type    = string
  default = "https://releases.ubuntu.com/jammy/ubuntu-22.04.5-live-server-amd64.iso"
}

variable "ssh_username" {
  type    = string
  default = "vagrant"
}

variable "ssh_password" {
  type    = string
  default = "vagrant"
}

variable "version" {
  type    = string
  default = "0.1"
}

locals {
  standard_tags = {
    Release     = "Jammy"
    Environment = "production"
  }
}