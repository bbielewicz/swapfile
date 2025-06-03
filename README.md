# Swap File Manager

A simple script to manage the swap file.

## Installation
```bash
sudo cp swapfile /sbin/
sudo chmod 755 /sbin/swapfile
sudo cp swapfile.conf /etc/
sudo chmod 644 /etc/swapfile.conf
sudo cp swapfile.service /lib/systemd/system/
sudo chmod 644 /lib/systemd/system/swapfile.service
sudo systemctl daemon-reload
```
## Initialization and start-up
```bash
sudo swapfile init
sudo systemctl start swapfile.service
sudo systemctl enable swapfile.service
sudo systemctl status swapfile.service
sudo swapon --show
```
