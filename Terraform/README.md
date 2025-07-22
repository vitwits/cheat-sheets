# Proxmox LXC Terraform Deployment (with DHCP)

Log into the Proxmox cluster or host using ssh (or mimic these in the GUI) then:

Create a new role for the future terraform user.
Create the user "terraform-prov@pve"
Add the TERRAFORM-PROV role to the terraform-prov user

```bash
pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
pveum user add terraform-prov@pve --password <password>
pveum aclmod / -user terraform-prov@pve -role TerraformProv
```


This Terraform configuration provisions multiple Linux containers (LXC) on a Proxmox VE node using official templates and dynamic IP assignment via DHCP.

## Features

- Auto-create multiple LXC containers (set via `instance_count`)
- Automatic network configuration using DHCP
- Uses Proxmox official templates (e.g. Alpine)
- Minimal setup — no static IPs needed

## Prerequisites

- Proxmox VE with `local-lvm` storage
- Downloaded template (e.g. `alpine-3.22-default_20250617_amd64.tar.xz`)
- Terraform installed on your local machine
- Proxmox API user with sufficient permissions

```bash
# Example: Alpine 3.22 LXC template
pveam update
pveam download local alpine-3.22-default_20250617_amd64.tar.xz
```

## Usage

1. Clone this repo or unzip the folder.
2. Rename `terraform.tfvars.example` to `terraform.tfvars` with your Proxmox credentials and URL.
3. Run the following commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
````

> The containers will be created as `lxc-0`, `lxc-1`, ..., each using DHCP to get an IP.

## Modify Number of Containers

To change the number of containers, update `instance_count` in `terraform.tfvars` and re-run:

```bash
terraform apply
```

## How to Delete the Instances

To destroy all containers created by Terraform:

```bash
terraform destroy
```

This will remove all provisioned LXC containers defined in this configuration.

---
