# Infrastructure

In this folder there's available all the documentation about the infrasctrure allong with the packer templates and terraform config.

**Naming Scheme**

LLL-vAPP##

 - **LLL** = Location of the server/vm **[** HL(*Homelab*) | AZR(*Azure*) | VLT(*Vultr*) | DGO(*Digital Ocean*) | others **]**  
 - **v** = If the **v** is present, the server is virtualized  
 - **APP** = Server Use **[** DC (Domain Controller) | Docker | HV (Hypervisor) **]**  
 - **##** = Numerical designation

### Servers and VM's List

**Servers**  
|   Hostname  |       OS      |         Specs        |                              Storage                             |
|:-----------:|:-------------:|:--------------------:|:----------------------------------------------------------------:|
|    HL-HV1   |  Proxmox 7.2  | i7-11700 \| 32GB RAM | Boot: 120GB SSD<br>Storage: 512GB NVMe \| 1x3TB HDD \| 1x8TB HDD |
|  HL-Docker1 | Rocky Linux 9 |   Raspberry Pi 2GB   |                        64GB Micro SD Card                        |
| HL-General2 | Rocky Linux 9 |   Raspberry Pi 2GB   |                        64GB Micro SD Card                        |
| HL-General1 | Fedora Server |  64 X2 4600+ 8GB RAM |                             500GB HDD                            |

**VM's**

- **HL-HV1**


