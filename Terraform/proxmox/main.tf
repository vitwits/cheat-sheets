terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.proxmox_url
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = true
}

resource "proxmox_lxc" "container" {
  count           = var.instance_count
  hostname        = "lxc-${count.index}"
  ostemplate      = "local:vztmpl/${var.template}"
  target_node     = var.target_node
  password        = var.container_password
  cores           = var.cores
  memory          = var.memory
  swap            = var.swap
  unprivileged    = true

  rootfs {
    storage = var.storage
    size    = var.rootfs_size
  }

  # ✅ DHCP network config
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }

  features {
    nesting = true
  }

  start = true
}
