# IPMI Exporter

**This is a copy of [lovoo/ipmi_exporter](https://godoc.org/github.com/lovoo/ipmi_exporter).**
Upstream is no longer maintained (the repo is archived).

IPMI Exporter for prometheus.io, written in Go.

Changes from upstream are:
- Include fan speeds exported by percentage (under `fan_speed_percent`)
- Use Go modules, remove `vendor` folder

## Requirements

* ipmitool

## Docker Usage

    docker run --device=/dev/ipmi0 -d --name ipmi_exporter -p 9289:9289 lovoo/ipmi_exporter:latest

## Building

    make build

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Package repositories

Debian repo quick install:

    curl -s https://packagecloud.io/install/repositories/LovooOS/prometheus-exporters/script.deb.sh | sudo bash

You can find package repositories for other systems and how to add it to the system on [packagecloud.io/LovooOS/](https://packagecloud.io/LovooOS/prometheus-exporters/install)

Special thanks to [packagecloud.io](https://packagecloud.io/) for hosting our packages.
