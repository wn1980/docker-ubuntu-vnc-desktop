# Get started

### Prepare Ubuntu Server for Raspberry Pi
#### Enable WiFi using netplan ([reference](https://linuxconfig.org/ubuntu-20-04-connect-to-wifi-from-command-line))
```
$ sudo nano /etc/netplan/50-cloud-init.yaml #OR edit file "system-boot/network-config" directly from SD card  

# edit somethings like this

network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    version: 2
    wifis:
        wlan0:
            dhcp4: true 
            optional: true
            access-points:
                "SSID-NAME-HERE":
                    password: "PASSWORD-HERE"
                    
# then run these commands
$ sudo netplan generate
$ sudo netplan apply
$ ip a #to check ip address
```

#### Enable WiFi
```
# Connect to internet via lan first
$ sudo lshw -C network #to check 
$ sudo apt-get install wireless-tools
$ sudo apt-get install wpasupplicant
$ sudo nano /etc/network/interfaces #add followings

# The loopback network interface
auto lo
iface lo inet loopback

# The wireless network interface
allow-hotplug wlan0
auto wlan0
iface wlan0 inet dhcp
wpa-ssid My Wifi Name
wpa-psk yourPassword

$ reboot
```

#### Change hostname
```
$ sudo nano /etc/hostname
# replace the old hostname with <custom hostname>
$ sudo nano /etc/hosts
# make sure that there are these 2 lines
# 127.0.0.1 localhost
# 127.0.1.1 <custom hostname>

$ reboot
```

#### Enable swapfile
```
$ sudo swapon --show #to check
$ sudo fallocate -l 4G /swapfile
$ sudo chmod 600 /swapfile
$ sudo mkswap /swapfile
$ sudo swapon /swapfile
$ sudo nano /etc/fstab #add followings
/swapfile swap swap defaults 0 0

#check 
$ sudo swapon --show
$ sudo free -h

#to remove
$ sudo swapoff -v /swapfile
# remove the line /swapfile swap swap defaults 0 0 from the /etc/fstab 
$ sudo rm /swapfile

```

### Docker Installation
- ### Typical (Ubuntu/Raspbian most platforms except arm64)
```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```
- ### Raspbian Buster
```
$ CHANNEL=nightly curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
```
- ### Ubuntu 20.04 LTS Server 
```
$ sudo apt install docker.io docker-compose
```

- ### Ubuntu 18.04 LTS Server (Refer to [Docker manual](https://docs.docker.com/install/linux/docker-ce/ubuntu/))
```
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
$ sudo apt-get update && sudo apt-get install docker-ce
```

### Start Docker service (if not done by installer)
```
$ sudo systemctl enable docker
$ sudo systemctl start docker

# Check status
$ systemctl status docker
```

### Add user to the docker group 
```
$ sudo usermod -aG docker $USER #(reboot to take effect)
```

### Simple test
```
$ docker version
$ docker run --rm hello-world
#For arm64
$ docker run --rm aarch64/hello-world
```

