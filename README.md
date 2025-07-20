# iVentoy Service Manager

This repository contains scripts and a systemd service file to manage iVentoy as a systemd service.

## Prerequisites:

1. A host running a Linux distribution with systemd.
2. iVentoy downloaded and properly extracted in the `/lib` directory (e.g., `/lib/iventoy-1.0.21`).
3. Sudo or root access to run the setup script.

## Quick Start

1. Download and extract iVentoy:
   - Download the latest version of iVentoy from the official website.
   - Extract the downloaded .tar.gz file in the `/lib` directory:
     ```bash
     sudo tar -xzvf iventoy-x.x.x-linux.tar.gz -C /lib
     ```
   - Ensure that the extracted folder is named like `iventoy-x.x.x` in `/lib`.

2. Clone this repository:
   ```bash
   git clone https://github.com/FlickRare/iVentoy-CTL
   cd ./iVentoy-CTL
   ```

3. Run the setup script:
   ```bash
   sudo ./setup.sh
   ```

4. Verify the service is running:
   ```bash
   sudo systemctl status iventoy
   ```
Now iVentoy will start automatically on boot and restart if it crashes.