# ================================================
# = Packer Template for Rocky Linux 9 on Proxmox
# = Based on:
# = https://github.com/dustinrue/proxmox-packer/
# ================================================

# ==== Proxmox Server Info ====
variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

variable "proxmox_node" {
  type    = string
}


# ==== OS ISO Info ====
variable "rocky_image" {
  type    = string
  default = "Rocky-9.0-x86_64-dvd.iso"
}

variable "proxmox_iso_pool" {
  type    = string
  default = "local:iso"
}

# ==== VM Storage Info ====
variable "proxmox_storage_pool" {
  type    = string
  default = "Fast_512GB"
}

variable "proxmox_storage_pool_type" {
  type    = string
  default = "dir"
}


source "proxmox" "rocky-linux-9" {
  # Proxmox Connection Information
  node        = "${var.proxmox_node}"
  proxmox_url = "${var.proxmox_api_url}"
  username    = "${var.proxmox_api_token_id}"
  token       = "${var.proxmox_api_token_secret}"
  insecure_skip_tls_verify = true

  # Template Info
  vm_id                = 1000
  vm_name              = "Packer-RL9"
  template_description = "Clean Rocky Linux 9 template with nothing extra instaled"
  template_name        = "Rocky9-Clean"

  # OS ISO
  iso_file        = "${var.proxmox_iso_pool}/${var.rocky_image}"
  unmount_iso     = true
  os              = "l26"

  # System Specs
  scsi_controller = "virtio-scsi-pci"
  qemu_agent      = true
  
  # Disks
  disks {
    disk_size         = "32G"
    format            = "qcow2"
    storage_pool      = "${var.proxmox_storage_pool}"
    storage_pool_type = "${var.proxmox_storage_pool_type}"
    type              = "virtio"
  }

  cloud_init              = true
  cloud_init_storage_pool = "${var.proxmox_storage_pool}"
  
  # CPU and Memory
  cpu_type = "host"  
  cores    = "4"
  memory   = "4096"

  # Network
  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # Packer Stuff
  http_directory           = "Rocky9/config"
  boot_command             = ["<tab> text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/inst.ks<enter><wait>"]
  boot_wait                = "10s"
  ssh_username             = "root"
  ssh_password             = "Packer"
  ssh_port                 = 22
  ssh_timeout              = "15m"
}

build {
  sources = ["source.proxmox.rocky-linux-9"]

  # Update and Clean and enable cockpit
  provisioner "shell" {
    inline = ["yum update -y",
              "rm -f /etc/ssh/ssh_config.d/allow-root-ssh.conf",
              "yum install -y cockpit",
              "yum install -y cockpit-storaged",
              "sudo systemctl enable --now cockpit.socket"]
  }

  # Install Guest Agent
  provisioner "shell" {
    inline = ["yum -y install qemu-guest-agent",
              "sudo systemctl enable qemu-guest-agent"]
    }
  # Install Cloud Init
  provisioner "shell" {
    inline = ["yum -y install cloud-init cloud-utils-growpart gdisk",
              "sudo systemctl enable cloud-init.service"]
  }

  # Allow password login
  provisioner "shell" {
    inline = ["sed '/PasswordAuthentication no/d' /etc/ssh/sshd_config",
              "systemctl restart sshd"]
  }

  # Custom PS1 I like
  provisioner "shell" {
    inline_shebang = "/bin/bash -e"
    inline = ["echo 'export PS1=\"\\[\\033[38;5;10m\\]\\u@\\h\\[$(tput sgr0)\\]:\\[$(tput sgr0)\\]\\[\\033[38;5;14m\\][\\w]\\[$(tput sgr0)\\]: \\[$(tput sgr0)\\]\"' >> /etc/bashrc"]
  }
  # Copy files need for cloud init
  provisioner "file" {
      source = "Rocky9/config/99-pve.cfg"
      destination = "/etc/cloud/cloud.cfg.d/99-pve.cfg"
  }

}
