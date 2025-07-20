#!/bin/bash

# Check if iVentoy is installed in /lib or /usr/lib and not compressed
if { [ ! -d /lib/iventoy* ] && [ ! -d /usr/lib/iventoy* ]; } || { [ -f /lib/iventoy*.tar.gz ] || [ -f /usr/lib/iventoy*.tar.gz ]; }; then
    echo "Error: iVentoy is not properly installed in /lib or /usr/lib. Please download and unpack iVentoy first."
    echo "Make sure the iVentoy folder is uncompressed and not a .tar.gz file."
    exit 1
fi

# Find the iVentoy directory (excluding .tar.gz files)
IVENTOY_DIR=$(find /lib /usr/lib -maxdepth 1 -type d -name "iventoy*" ! -name "*.tar.gz" | sort -V | tail -n 1)

if [ -z "$IVENTOY_DIR" ]; then
    echo "Error: Could not find an uncompressed iVentoy directory in /lib or /usr/lib."
    exit 1
fi

# Check if iventoy.sh exists in the directory
if [ ! -f "$IVENTOY_DIR/iventoy.sh" ]; then
    echo "Error: iventoy.sh not found in $IVENTOY_DIR. Please ensure iVentoy is properly extracted."
    exit 1
fi

# Update iventoy_service.sh with correct path
sed -i "s|ExecStart=.*|ExecStart=/bin/bash \"$IVENTOY_DIR/iventoy.sh\" start|" iventoy.service
sed -i "s|ExecStop=.*|ExecStop=/bin/bash \"$IVENTOY_DIR/iventoy.sh\" stop|" iventoy.service

# Move files to correct locations
cp ./iventoy.service /etc/systemd/system

# Enable and start the service
systemctl enable iventoy.service
systemctl start iventoy.service

echo "Setup completed successfully. iVentoy service is now running using the installation in $IVENTOY_DIR."