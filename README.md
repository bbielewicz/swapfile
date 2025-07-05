# Swap File Manager

A simple script to manage the swap file.

## Installation
```bash
sudo make install
```
## Initialization and start-up
```bash
sudo swapfile init
sudo systemctl start swapfile.service
sudo systemctl enable swapfile.service
sudo systemctl status swapfile.service
sudo swapon --show
```
