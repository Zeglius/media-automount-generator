Systemd-generator for partition automounting for internal disks.

In inspiration of [Ferk/udev-media-automount](https://github.com/Ferk/udev-media-automount).

## Installation

```shell
just install
```

> **Note**
> The above method should be used when installing in a bootc image
> at container build.

For Fedora Silverblue/Kinoite and Universal Blue:

```shell
DESTDIR=/usr/local just install
```

## FAQ

### What filesystems does this thing support?

BTRFS and ext4 (by default).

### How can I exclude a specific partition?

Add it to `/etc/fstab` with the `noauto` option.

### How can I exclude a type of filesystem?

Create a symbolic link file pointing at `/dev/null` in `/etc/automounts.d/<FSTYPE>`

### Why my partition is not getting mounted?

By default, this generator ignores certain partitions (like NTFS) because
they don't work well with Linux.
Could it be as well that a filesystem