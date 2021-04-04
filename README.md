# LudOS

LudOS is a 'Just enough OS' Linux distribution for running [Ludo](https://ludo.libretro.com) on hardware like PC or the Raspberry Pi. LudOS is based on [LibreELEC](https://libreelec.tv) 9.0 with a few minor changes.

## Installation

To install LudOS, you can download the latest release and flash it on a bootable media like a USB drive or an SD card. Flashing can be done using `dd` or [Etcher](https://www.balena.io/etcher/). Just like you would install LibreELEC or Lakka. Installing LudOS will wipe all previous data on your disk.

## Usage

To transfer games, connect to a Wi-Fi network and enable SAMBA or SSH access in the settings menu. LudOS should then appear in the file sharing interface of any machine on the same network. The default SSH credentials are root:ludos, we recommend to change it as soon as you login the first time. Please refer to [Ludo Wiki](https://github.com/libretro/ludo/wiki) on how to use the frontend.

## Support

LudOS is not ready for production and contains bugs. However, you can get some help on our [Discord](https://discordapp.com/invite/YXYSEQD).

## License

The license of LudOS is the same as the one of LibreELEC, but adds some packages like Snes9x or Genesis Plus GX that are protected by a Non-Commercial license. Thus, you can't sell LudOS or a derivative without removing these packages.
