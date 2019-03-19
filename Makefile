.PHONY: install uninstall

PREFIX ?= /usr/local/bin

install:
	install -o root -g root -m 755 systemctl-shim.sh $(PREFIX)/
	ln -vs $(PREFIX)/systemctl-shim.sh /usr/bin/systemctl

uninstall:
	rm $(PREFIX)/systemctl-shim.sh
	rm -v /usr/bin/systemctl
