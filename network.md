# Network Setup

Right now the network setup is quite simple, there is the main LAN network where all the devices live, plus some VM's and containers are allowed to communicate as well.  
Then there are 3 other networks that are exclusive to the lab, a general VM network (VLAN 10), a storage network (VLAN 20) and a "unsecure / DMZ" network (VLAN 30).

- General VM network:
  - All Servers and VM's have an IP here, this network allows me to spin up a lot of VM's without filling the main LAN. 
  - There are no traffic restrictions on this network. 
- Storage Network:
  - Only Servers and VM's that need access to the storage server have an IP here, this simply keeps the LAN free from storage traffic by confining the traffic to the proxmox only network thus only the not going throug the main router.
- DMZ Network:
  - All traffic that goes in though the proxy and needs to access a container or VM goes trough this network only.
  - Restricted to the bare minimum of hosts.  


DHCP is handled by a [KEA DHCP](https://www.isc.org/kea/) instance managed trough Stork.

### Networks Range
|  Network | VLAN |      CIDR      | DHCP Range      |
|:--------:|:----:|:--------------:|-----------------|
|    LAN   |   1  | 192.168.1.0/24 | 192.168.1.5-250 |
| Internal |  10  |  10.0.10.0/24  | 10.0.10.5-250   |
|  Storage |  20  |  10.0.20.0/24  | 10.0.20.5-250   |
|    DMZ   |  30  |  10.0.30.0/24  | Static Only     |


### IP's Reservations

|  Machine Hostname  |         FDQN        |        MAC        |  LAN (VLAN 1) | Internal (VLAN 10) | Storage (VLAN 20) | DMZ (VLAN 30) |
|:------------------:|:-------------------:|:-----------------:|:-------------:|:------------------:|:-----------------:|:-------------:|
|    Yoda-Docker2    |    yoda.home.arpa   | DC:A6:32:14:C9:E1 | 192.168.1.65  |     10.0.10.5      |     10.0.20.5     |               |
|  Jabba-Hypervisor2 |   jabba.home.arpa   | 00:04:0B:80:80:80 | 192.168.1.66  |     10.0.10.6      |     10.0.20.6     |               |
| Anakin-Hypervisor1 |   anakin.home.arpa  | 18:C0:4D:AF:7B:A1 | 192.168.1.68  |     10.0.10.8      |     10.0.20.8     |               |
|     BB8-vProxy1    |   proxy1.home.arpa  | F2:61:E7:D7:EB:73 | 192.168.1.70  |     10.0.10.10     |     10.0.20.10    |   10.0.3.10   |
|   R2D2-vTrueNAS1   |    r2d2.home.arpa   | DE:A4:59:DA:51:9A | 192.168.1.72  |     10.0.10.12     |     10.0.20.12    |               |
| Chewbacca-vDocker1 | chewbacca.home.arpa | 36:54:E9:44:DA:1C | 192.168.1.73  |     10.0.10.13     |     10.0.20.13    |   10.0.30.13  |
|  JarJar-vWindows1  |   jarjar.home.arpa  | FA:1B:A2:17:D8:8A | 192.168.1.75  |     10.0.10.15     |     10.0.20.15    |               |
|    Maul-vFedora1   |    maul.home.arpa   | F2:0C:6B:70:09:EB | 192.168.1.76  |     10.0.10.16     |     10.0.20.16    |               |
|        Hass        |   hassio.home.arpa  | 52:54:00:BF:B8:CF | 192.168.1.145 |                    |                   |               |
