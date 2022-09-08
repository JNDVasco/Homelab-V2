# ================================================
# = Kickstart File for Rocky Linux 9
# = Based on:
# = https://access.redhat.com/labs/kickstartconfig/ 
# = https://github.com/dustinrue/proxmox-packer/
# ================================================

cdrom
text
lang en_GB
keyboard --xlayouts='pt'
timezone Europe/Lisbon --utc
network  --bootproto=dhcp --ipv6=auto --activate
network  --hostname=localhost.home.arpa
rootpw Packer
firstboot --disabled
skipx
zerombr
clearpart --all --initlabel
autopart
reboot

%packages
@^minimal-environment
openssh-server
openssh-clients
sudo
kexec-tools
curl
python3
python3-libselinux
nfs-utils
cockpit
bash-completion
rsync
nano

# unnecessary firmware
-aic94xx-firmware
-atmel-firmware
-b43-openfwwf
-bfa-firmware
-ipw2100-firmware
-ipw2200-firmware
-ivtv-firmware
-iwl100-firmware
-iwl1000-firmware
-iwl3945-firmware
-iwl4965-firmware
-iwl5000-firmware
-iwl5150-firmware
-iwl6000-firmware
-iwl6000g2a-firmware
-iwl6050-firmware
-libertas-usb8388-firmware
-ql2100-firmware
-ql2200-firmware
-ql23xx-firmware
-ql2400-firmware
-ql2500-firmware
-rt61pci-firmware
-rt73usb-firmware
-xorg-x11-drv-ati-firmware
-zd1211-firmware
%end


%post
echo "PermitRootLogin yes" > /etc/ssh/sshd_config.d/allow-root-ssh.conf
%end