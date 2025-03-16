Systemd-generator/udev rules for partition automounting for internal disks.

In inspiration of [Ferk/udev-media-automount](https://github.com/Ferk/udev-media-automount).

## Installation

```shell
git clone --depth=1 https://github.com/Zeglius/media-automount-generator
cd ./media-automount-generator
```

```shell
# Run only one of them

# udev mode (recommended)
./install_udev.sh

# Systemd-generator mode
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

At `/media/media-automount/<Partition UUID>`.

### What filesystems does this thing support?

BTRFS and ext4 (by default).

## Configuration

The generator tries to follow Systemd overriding convention.

Upper directories override lower ones. Lower directories should be used
by vendors to set default configuration, whereas upper ones should be left for the system
administrator.

To disable a vendor configuration, you can create a symlink pointing to `/dev/null`
in its correspondent upper dir.

### Filesystem specific

- `/etc/media-automount.d/<FSTYPE>.conf`
- `/usr/local/lib/media-automount.d/<FSTYPE>.conf`
- `/usr/lib/media-automount.d/<FSTYPE>.conf`

```text
# /etc/media-automount.d/btrfs.conf
FSOPTIONS=noatime,lazytime,commit=120,discard=async,compress-force=zstd:1,space_cache=v2
```

## FAQ

### How can I...

#### ... exclude a specific partition?

Add it to `/etc/fstab` with the `noauto` option.

#### ... exclude a type of filesystem?

Create a symbolic link pointing at `/dev/null` in `/etc/automounts.d/<FSTYPE>.conf`

```shell
sudo ln -s /dev/null /etc/media-automount.d/ntfs.conf
```

#### ... deactivate it completely?

Create a symbolic link pointing at `/dev/null` in `/etc/automounts.d/_all.conf`

```shell
sudo ln -s /dev/null /etc/media-automount.d/_all.conf
```

### Why my partition is not getting mounted?

By default, this generator ignores certain partitions (like NTFS) because
they don't work well with Linux.
Could it be as well that a filesystem is not configured.
