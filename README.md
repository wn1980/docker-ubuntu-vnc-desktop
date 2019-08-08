# Get started
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
- ### Ubuntu arm64 (Refer to [Docker manual](https://docs.docker.com/install/linux/docker-ce/ubuntu/))
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
**Note**: For raspberry pi with ubuntu 18.04 server
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

