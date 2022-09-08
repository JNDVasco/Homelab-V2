# Infrastructure

## Templates 

These templates are created with Packer, with the exception of the LXC one, and can then be used with terraform to provision the infrastucture.

| Template Name    | Type | OS            | Description                                 |
|:----------------:|:----:|:-------------:|:-------------------------------------------:|
| Rocky9-Clean     | VM   | Rocky Linux 9 | Has cockpit installed                       |
| Rocky9-Docker    | VM   | Rocky Linux 9 | Clean + docker and docker compose installed |
| LXC-Rocky9-Clean | LXC  | Rocky Linux 9 | Has SSH server, ncurses and nano            |

---

In this folder there's available all the documentation about the infrasctrure allong with the packer templates and terraform config.

**Naming Scheme**

LLL-vAPP##

- **LLL** = Location of the server/vm **[** HL(*Homelab*) | AZR(*Azure*) | VLT(*Vultr*) | DGO(*Digital Ocean*) | others **]**  
- **v** = If the **v** is present, it's a VM or LXC
- **APP** = Server Use **[** DC (Domain Controller) | Docker | HV (Hypervisor) **]**  
- **##** = Numerical designation

### Servers and VM's List

**Servers**  

| Hostname     | OS            | Specs                | Storage                                                          |
|:------------:|:-------------:|:--------------------:|:----------------------------------------------------------------:|
| HL-HV1       | Proxmox 7.2   | i7-11700 \| 32GB RAM | Boot: 120GB SSD<br>Storage: 512GB NVMe \| 1x3TB HDD \| 1x8TB HDD |
| HL-Docker1   | Rocky Linux 9 | Raspberry Pi 2GB     | 64GB Micro SD Card                                               |
| HL-k3s-node1 | Rocky Linux 9 | Raspberry Pi 2GB     | 64GB Micro SD Card                                               |
| HL-k3s-node2 | Ubuntu 20.04  | Jetson Nano          | 64GB Micro SD Card                                               |
| HL-General1  | Fedora Server | 64 X2 4600+ 8GB RAM  | 500GB HDD                                                        |

**VM's**

- **HL-HV1**
  
  | ID  | Hostname        | OS            | Type | CPU | RAM     | Disk  |
  |:---:|:---------------:|:-------------:|:----:|:---:|:-------:|:-----:|
  | 301 | HL-Proxy1       | Rocky Linux 9 | VM   | 2   | 1024 MB | 32 GB |
  | 302 | HL-vTrueNAS1    | TrueNAS Scale | VM   | 6   | 8192 MB | 32 GB |
  | 303 | HL-vDocker2     | Rocky Linux 9 | VM   | 6   | 8192 MB | 64 GB |
  | 304 | HL-vGameServer1 | Rocky Linux 9 | VM   | 6   | 8192 MB | 64 GB |
  | 305 | HL-vWin1        | Windows 10    | VM   | 14  | 4096 MB | 64 GB |
  | 900 | HL-vAutomation1 | Fedora 35     | LXC  | 4   | 1024 MB | 32 GB |
  | 905 | HL-vDHCP1       | Ubuntu 20.04  | LXC  | 2   | 512 MB  | 8 GB  |


