variable "proxmox_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_user" {
  description = "Proxmox API username"
  type        = string
}

variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}

variable "target_node" {
  default = "e560"
}

variable "template" {
  default = "alpine-3.22-default_20250617_amd64.tar.xz"
}

variable "container_password" {
  default = "securepass"
}

variable "cores" {
  default = 1
}

variable "memory" {
  default = 512
}

variable "swap" {
  default = 256
}

variable "instance_count" {
  default = 3
}

variable "storage" {
  default = "local-lvm"
}

variable "rootfs_size" {
  default = "4G"
}
