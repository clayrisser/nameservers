# nameservers

List your nameservers


## Installation

### Ubuntu
```sh
curl -L -o /bin/nameservers https://github.com/jamrizzi/nameservers/releases/download/v0.1.0/nameservers.deb
sudo dpkg -i nameservers.deb
```

### Linux
```sh
curl -L -o /bin/nameservers https://github.com/jamrizzi/nameservers/releases/download/v0.1.0/nameservers
sudo chmod +x /bin/nameservers
```


## Build

```sh
git clone https://github.com/jamrizzi/nameservers.git
make build
sudo make install
```


## Usage

```sh
nameservers

# 8.8.8.8
# 8.8.4.4
```
