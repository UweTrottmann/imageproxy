# imageproxy for SeriesGuide

A customized version of willnoris/imageproxy (info page, cached health check, host requirement).
Forked at "Commits on Aug 6, 2016" `94dbd77`.

## Usage

```bash
# listen on all interfaces
imageproxy -addr 0.0.0.0:8080
# see service config for actual commands
```

### Systemd config

See [/etc/systemd](/etc/systemd).

## Building

On WSL2 Ubuntu. Not using cgo, so static binary produced by go should work
regardless of the Ubuntu versions of build machine and server.

### Installing go

See https://golang.org/doc/install

Test with `go version`.

### Fetching source

```bash
apt install git
git clone git@github.com:UweTrottmann/imageproxy.git
// Maybe also this:
go get github.com/UweTrottmann/imageproxy
```

### go build

```bash
mkdir ~/Downloads/imageproxy_build/usr/bin -p
env GOOS=linux GOARCH=amd64 go build -o ~/Downloads/imageproxy_build/usr/bin/imageproxy -v github.com/UweTrottmann/imageproxy/cmd/imageproxy
chmod 755 ~/Downloads/imageproxy_build/usr/ -R
```

### Installing fpm

- https://github.com/jordansissel/fpm
- https://fpm.readthedocs.io/en/latest/installation.html

```bash
apt install ruby ruby-dev rubygems build-essential
gem install --no-document fpm
fpm --version
```

### Package deb using fpm

```bash
fpm -s dir -t deb -n "imageproxy" -C ~/Downloads/imageproxy_build -v 0.7.0 --vendor "" --maintainer "Uwe Trottmann <uwe@seriesgui.de>" --url "https://github.com/UweTrottmann/imageproxy" --description "A caching, resizing image proxy written in Go. Fork customized for SeriesGuide." .
```

### Copy to server

E.g. using scp or magic wormhole.

### Install

```bash
apt install ./imageproxy_0.7.0_amd64.deb
```
