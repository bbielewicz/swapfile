CONFIG_FILE ?= /etc/swapfile.conf

.PHONY: default install remove purge

default:
	@echo "usage: make {install|remove|purge}"

install:
ifeq ($(wildcard $(CONFIG_FILE)),)
	cp swapfile.conf $(CONFIG_FILE) && \
	chmod 644 $(CONFIG_FILE)
else
	@echo "configuration file $(CONFIG_FILE) already exists"
endif
	cp swapfile /sbin/swapfile && \
	chmod 755 /sbin/swapfile
	cp swapfile.service /lib/systemd/system/swapfile.service && \
	chmod 644 /lib/systemd/system/swapfile.service
	systemctl daemon-reload

remove:
ifneq ($(wildcard /lib/systemd/system/swapfile.service),)
	systemctl stop swapfile.service
	systemctl disable swapfile.service
	rm -f /lib/systemd/system/swapfile.service
	systemctl daemon-reload
endif
	rm -f /sbin/swapfile

purge: remove
ifeq ($(wildcard $(CONFIG_FILE)),)
	@echo "configuration file $(CONFIG_FILE) not found, swap file will not be removed"
else
	rm -f $(shell grep "SWAPFILE" /etc/swapfile.conf | cut -d '=' -f2)
	rm -f /etc/swapfile.conf
endif
