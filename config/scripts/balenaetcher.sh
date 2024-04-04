#!/usr/bin/env bash
set -euo pipefail

# download the latest version of BalenaEtcher from https://github.com/balena-io/etcher/releases with latest tag
wget $(wget -q https://api.github.com/repos/balena-io/etcher/releases/latest -O - | jq -r '.assets[] | select(.name | contains("AppImage")) | .browser_download_url') -O /usr/local/bin/BalenaEtcher.AppImage

# make the AppImage executable
chmod +x /usr/local/bin/BalenaEtcher.AppImage

# create a desktop entry for BalenaEtcher
cat <<EOF > /usr/share/applications/BalenaEtcher.desktop
[Desktop Entry]
Name=BalenaEtcher
Exec=/usr/local/bin/BalenaEtcher.AppImage
Icon=/usr/local/bin/BalenaEtcher.AppImage
Type=Application
Categories=Utility;
EOF

# notify the user that the installation is complete
notify-send "BalenaEtcher has been installed"