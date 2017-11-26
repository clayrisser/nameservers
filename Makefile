.PHONY: all
all: clean build

.PHONY: start
start:
	@go run nameservers.go

.PHONY: build
build: nameservers
	@echo ::: BUILD :::

.PHONY: clean
clean:
	-@rm -rf nameservers template.txt &>/dev/null || true
	@echo ::: CLEAN :::

.PHONY: install
install: build
	@mv nameservers /bin
	@chmod +x /bin/nameservers
	@echo ::: INSTALL :::

nameservers:
	@go build nameservers.go
