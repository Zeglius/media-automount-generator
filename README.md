Systemd-generator/udev rules for partition automounting for internal disks.

In inspiration of [Ferk/udev-media-automount](https://github.com/Ferk/udev-media-automount).

## Installation

```shell
git clone --depth=1 https://github.com/Zeglius/media-automount-generator
cd ./media-automount-generator
```

```shell
./install.sh
```

> **Note**
> The above method should be used when installing in a bootc image
> at container build.

For Fedora Silverblue/Kinoite and Universal Blue in an already deployed system:

```shell
DESTDIR=/usr/local ./install.sh
```

## Uninstall

```shell
./install.sh uninstall
```

For Fedora Silverblue/Kinoite and Universal Blue:

```shell
DESTDIR=/usr/local ./install.sh uninstall
```

## FAQ

### Where are my partitions mounted?

At `/media/<user>/<Partition name or UUID>`.

### What filesystems does this thing support?

BTRFS and ext4 (by default).

## FAQ

### How can I...

#### ... deactivate it completely?

Create a symbolic link pointing at `/dev/null` in `/etc/systemd/user-generators/ublueos-udisks-automount-generator`

```shell
sudo ln -s /dev/null /etc/systemd/user-generators/ublueos-udisks-automount-generator
```

### Why my partition is not getting mounted?

By default, this generator ignores certain partitions (like NTFS) because
they don't work well with Linux.
Could it be as well that a filesystem is not configured.
