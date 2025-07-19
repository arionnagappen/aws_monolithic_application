#!/bin/bash

# Update and install nginx using dnf (Amazon Linux 2023)
sudo dnf update -y
sudo dnf install -y nginx

# Start and enable nginx
sudo systemctl enable nginx
sudo systemctl start nginx
