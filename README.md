# Kinoite-Ekyso

This is a custom image based on [Bazzite kinoite-nvidia](https://github.com/ublue-os/bazzite).

It includes the following changes:
Installed:
- Virt-manager (layered)
- LibreOffice (layered)
- VSCode (layered)
- Discord (flatpak)
- Spotify (flatpak)
- Vinegar (flatpak)
- Zoom (flatpak)
- Boxes (flatpak)
- Hyperbeam (AppImage)
- Balena Etcher (AppImage)

Removed:
- Waydroid
- Cage

## BlueBuild Template &nbsp; [![build-ublue](https://github.com/blue-build/template/actions/workflows/build.yml/badge.svg)](https://github.com/blue-build/template/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

After setup, it is recommended you update this README to describe your custom image.

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:
`

- First pin your current ostree image to make sure you can rollback:
  ```
  sudo ostree pin <index: number>
  ```
- Then remove all layered packages to prepare for rebase:
  ```
  rpm-ostree reset
  ```
- Then rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/osyki/kinoite-ekyso:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/osyki/kinoite-ekyso:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

This build will still always use the latest Bizzate version, so you will get updated to the next major version.

<!-- ## ISO

> **Warning**  
> The ISO GitHub Action will be deprecated soon in favor of the new [ublue-os/isogenerator](https://github.com/ublue-os/isogenerator). The Action will then be removed from this template repository and instructions for building ISOs will be on the website.

This template includes a simple GitHub Action to build and release an ISO of your image.

To run the action, simply edit the `boot_menu.yml` by changing all the references to startingpoint to your repository. This should trigger the action automatically.

The Action currently uses [ublue-os/isogenerator-old](https://github.com/ublue-os/isogenerator-old) and works in a similar manner to the official Universal Blue ISO. If you have any issues, you should first check [the documentation page on installation](https://universal-blue.org/installation/). The ISO is a netinstaller and should always pull the latest version of your image.

Note that this release-iso action is not a replacement for a full-blown release automation like [release-please](https://github.com/googleapis/release-please). -->

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/osyki/kinoite-ekyso
```
