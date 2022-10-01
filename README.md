# Homelab-V2
In order to improve the Homelab and have a better platform for learning and experimenting with everything I want just because I read or saw it somewhere HomelabV2 was born.  

The new Homelab is all provisioned using [Packer](https://www.packer.io/), [Terraform](https://www.terraform.io/) and [Ansible](https://www.ansible.com/). This allows for a litle more FuckUpsForgiveness since I can now simply nuke the server, install a fresh [Proxmox](https://proxmox.com/en/) server and rebuild the server using the tools listed above.

For simplicity and 


## Lab Overview  
The main core of the lab are:
 - 2 DNS Servers, one on a NAS and another on a RPi
 - 1 Hypervisor running on a custom built server
 - 1 NAS as a data backup
 
## TechStack
