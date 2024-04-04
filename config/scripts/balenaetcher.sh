#!/usr/bin/env bash
set -euo pipefail

# download the latest version of BalenaEtcher from https://github.com/balena-io/etcher/releases with latest tag
curl -L $(curl -s https://api.github.com/repos/balena-io/etcher/releases/latest | jq -r '.assets[] | select(.name | contains("AppImage")) | .browser_download_url') -o /tmp/BalenaEtcher.AppImage

# make the AppImage executable
chmod +x /tmp/BalenaEtcher.AppImage

# move the AppImage to the applications directory
mv /tmp/BalenaEtcher.AppImage /usr/local/bin/BalenaEtcher

# create a desktop entry for BalenaEtcher
cat <<EOF > /usr/share/applications/BalenaEtcher.desktop
[Desktop Entry]
Name=BalenaEtcher
Exec=/usr/local/bin/BalenaEtcher
Icon=/usr/local/bin/BalenaEtcher
Type=Application
Categories=Utility;
EOF

# notify the user that the installation is complete
notify-send "BalenaEtcher has been installed"