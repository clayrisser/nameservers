.PHONY: all
all: clean build


.PHONY: start
start:
	@go run nameservers.go

.PHONY: build
build: dist/bin/nameservers
	@echo ::: BUILD :::

.PHONY: clean
clean:
	-@rm -rf dist nameservers.deb &>/dev/null || true
	@echo ::: CLEAN :::

.PHONY: install
install: build
	@mv nameservers /bin
	@chmod +x /bin/nameservers
	@echo ::: INSTALL :::

.PHONY: package
package: clean build nameservers.deb
	@echo ::: PACKAGE :::

dist/bin/nameservers:
	@mkdir -p dist/DEBIAN
	@cp control dist/DEBIAN
	@go build -o dist/bin/nameservers nameservers.go

nameservers.deb:
	@dpkg-deb --build dist
	@mv dist.deb nameservers.deb
