#!/bin/bash

# Install SAMBA
echo "Installing SAMBA..."
sudo apt install samba wsdd -y

# Update the SAMBA configuration file
echo "Updating SAMBA configuration file..."

# Include the SAMBA configuration file
echo "Including SAMBA configuration file..."
"include = $PWD/shares.conf" | sudo tee -a /etc/samba/smb.conf

# Replace CONFIG_PATH and STORAGE_PATH with $CONFIG_PATH and $STORAGE_PATH
echo "Replacing CONFIG_PATH and STORAGE_PATH with \$CONFIG_PATH and \$STORAGE_PATH..."
sudo sed -i "s|CONFIG_PATH|$CONFIG_PATH|g" shares.conf
sudo sed -i "s|STORAGE_PATH|$STORAGE_PATH|g" shares.conf

echo "Restarting SAMBA..."
sudo systemctl restart smbd
echo "Done..."
