BUILD_DIR    = $(CURDIR)/build
PROJECT_NAME = ipmi_exporter
VERSION      = $(shell git describe --tags || echo 0.0.0-dev)
GO           = go
MEGACHECK    ?= $(GOPATH)/bin/megacheck
GOX_ARGS     = -output="$(BUILD_DIR)/{{.Dir}}_{{.OS}}_{{.Arch}}" -osarch="linux/amd64 linux/386 linux/arm linux/arm64 darwin/amd64 freebsd/amd64 freebsd/386 windows/386 windows/amd64"
pkgs         = $(shell $(GO) list ./... | grep -v /vendor/)

PREFIX       ?= $(shell pwd)/build/ipmi_exporter
BIN          = ipmi_exporter

all: format vet build test

build: $(BIN)
	@echo ">> building binaries"

$(BIN): *.go collector/*.go go.mod
	@$(GO) build

clean:
	rm -rf $(BIN)

test:
	@echo ">> running tests"
	@$(GO) test $(pkgs)

format:
	@echo ">> formatting code"
	@$(GO) fmt $(pkgs)

vet:
	@echo ">> vetting code"
	@$(GO) vet $(pkgs)

docker: $(BIN) Dockerfile
	docker build -t mjkelly/ipmi_exporter:latest .

.PHONY: all build clean format test vet
