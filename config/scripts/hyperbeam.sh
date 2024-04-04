#!/usr/bin/env bash
set -euo pipefail

# download the latest version of Hyperbeam
curl -L https://cdn.hyperbeam.com/Hyperbeam-0.21.0.AppImage -o /tmp/Hyperbeam-0.21.0.AppImage

# make the AppImage executable
chmod +x /tmp/Hyperbeam-0.21.0.AppImage

# move the AppImage to the applications directory
mv /tmp/Hyperbeam-0.21.0.AppImage /usr/local/bin/Hyperbeam

# create a desktop entry for Hyperbeam
cat <<EOF > /usr/share/applications/Hyperbeam.desktop
[Desktop Entry]
Name=Hyperbeam
Exec=/usr/local/bin/Hyperbeam
Icon=/usr/local/bin/Hyperbeam
Type=Application
Categories=Network;
EOF

# notify the user that the installation is complete
notify-send "Hyperbeam has been installed"