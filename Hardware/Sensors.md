# LM-Sensors

My motherboard comes with a EC that isn't supported by default. In order to make it work I needed to compile the IT87 module.

**Steps**
- Clone https://github.com/gamanakis/it87
- `git checkout it8688E`
- `cd it87`
- `apt install pve-headers-$(uname -r)`
- make dkms
- `modprobe it87 force_id=0x8688` or in case this doesn't work `modprobe it87 force_id=0x8628`
- `sensors` should now report the EC chip sensors

For my motherboard I created a specific file that has the used sensors with the respetive names, these can be changed by editing the file.

Place the file on `/etc/sensors.d/`
Then reload lm-sensors with `systemctl restart lm-sensors.service`
