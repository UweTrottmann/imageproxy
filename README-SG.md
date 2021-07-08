# imageproxy for SeriesGuide

A customized version of willnoris/imageproxy (info page, cached health check, host requirement).
Forked at "Commits on Aug 6, 2016" `94dbd77`.

## Usage
```
# listen on all interfaces
imageproxy -addr 0.0.0.0:8080
# see service config for actual commands
```

### Systemd config
See [/etc/systemd](/etc/systemd).

## Building
On WSL2 Ubuntu (best use same version as cache server).

### Installing go
https://golang.org/doc/install
https://github.com/golang/go/wiki/Ubuntu

Using backport package instead of tarball (snap doesn't work on WSL2?).
```
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
```

Test with `go version`.

### Fetching source
```
apt install git
git clone git@github.com:UweTrottmann/imageproxy.git
// Maybe also this:
go get github.com/UweTrottmann/imageproxy
```

### go build
```
mkdir ~/Downloads/imageproxy_build/usr/bin -p
env GOOS=linux GOARCH=amd64 go build -o ~/Downloads/imageproxy_build/usr/bin/imageproxy -v github.com/UweTrottmann/imageproxy/cmd/imageproxy
chmod 755 ~/Downloads/imageproxy_build/usr/ -R
```

### Installing fpm
https://github.com/jordansissel/fpm
https://fpm.readthedocs.io/en/latest/installing.html

```
apt install ruby ruby-dev rubygems build-essential
gem install --no-ri --no-rdoc fpm
fpm --version
```

### Package deb using fpm
```
fpm -s dir -t deb -n "imageproxy" -C ~/Downloads/imageproxy_build -v 0.7.0 --vendor "" --maintainer "Uwe Trottmann <uwe@seriesgui.de>" --url "https://github.com/UweTrottmann/imageproxy" --description "A caching, resizing image proxy written in Go. Fork customized for SeriesGuide." .
```

### Copy to server
E.g. using scp or magic wormhole.

### Install
`apt install .//imageproxy_0.5.1_amd64-sg7.deb`
