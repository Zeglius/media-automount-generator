Systemd-generator for partition automounting for internal disks.

In inspiration of [Ferk/udev-media-automount](https://github.com/Ferk/udev-media-automount).

## Installation

```shell
./install.sh
```

> **Note**
> The above method should be used when installing in a bootc image
> at container build.

For Fedora Silverblue/Kinoite and Universal Blue:

```shell
DESTDIR=/usr/local ./install.sh
```

## Uninstall

```shell
./install uninstall
```

For Fedora Silverblue/Kinoite and Universal Blue:

```shell
DESTDIR=/usr/local ./install uninstall
```

## FAQ

### Where are my partitions mounted?

At `/media/<Partition UUID>`.

### What filesystems does this thing support?

BTRFS and ext4 (by default).

## Configuration

### How can I...

#### ... exclude a specific partition?

Add it to `/etc/fstab` with the `noauto` option.

#### ... exclude a type of filesystem?

Create a symbolic link pointing at `/dev/null` in `/etc/automounts.d/<FSTYPE>`

```shell
sudo ln -s /dev/null /etc/media-automount.d/ntfs
```

#### ... deactivate it completely?

Create a symbolic link pointing at `/dev/null` in `/etc/automounts.d/_all`

```shell
sudo ln -s /dev/null /etc/media-automount.d/_all
```

### Why my partition is not getting mounted?

By default, this generator ignores certain partitions (like NTFS) because
they don't work well with Linux.
Could it be as well that a filesystem is not configured.
