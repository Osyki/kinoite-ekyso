#!/usr/bin/env bash
set -euo pipefail

# download the latest version of Hyperbeam
wget https://cdn.hyperbeam.com/Hyperbeam-0.21.0.AppImage -O /usr/local/bin/Hyperbeam.AppImage

# make the AppImage executable
chmod +x /usr/local/bin/Hyperbeam.AppImage

# create a desktop entry for Hyperbeam
cat <<EOF > /usr/share/applications/Hyperbeam.desktop
[Desktop Entry]
Name=Hyperbeam
Exec=/usr/local/bin/Hyperbeam.AppImage
Icon=/usr/local/bin/Hyperbeam.AppImage
Type=Application
Categories=Network;
EOF

# notify the user that the installation is complete
notify-send "Hyperbeam has been installed"