# bazzite-dx &nbsp; [![build-ublue](https://github.com/sparkrai/bazzite-dx/actions/workflows/build.yml/badge.svg)](https://github.com/sparkrai/bazzite-dx/actions/workflows/build.yml)

This is my custom Bazzite image that tries to add all the development capabilities from the Bluefin/Aurora DX images.
It includes docker, podman, vscode, etc... to get you started coding with devcontainers faster as advertised by the Bluefin project.

## Desktop Environment
As with the other ublue-os images, this image comes with either KDE or GNOME Desktop Environment.
The imaghes respect Bazzite naming convention:
- **bazzite-dx** based on **bazzite**, runs KDE with **aurora-dx** layered on top
- **bazzite-gnome-dx** based on **bazzite-gnome**, runs GNOME with **bluefin-dx** layered on top

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First choose the flavor of the image you'd like to install (either **bazzite-dx** or **bazzite-gnome-dx**)

- Then rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/sparkrai/(_bazzite-dx_ or _bazzite-gnome-dx_):latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/sparkrai/(_bazzite-dx_ or _bazzite-gnome-dx_):latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/sparkrai/bazzite-dx
```
