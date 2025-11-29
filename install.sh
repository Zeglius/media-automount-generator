#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")" || exit 1

DESTDIR=${DESTDIR:-/usr}
install_locs="src/99-ublueos-udisks-automount.rules /etc/polkit-1/rules.d/99-ublueos-udisks-automount.rules
              src/ublueos-udisks-automount-generator $DESTDIR/lib/systemd/user-generators/ublueos-udisks-automount-generator
              src/mount_options.conf /etc/udisks2/mount_options.conf"

placeIn() {
    local src=${1:?}
    local dest=${2:?}

    if [[ ! -e $src ]]; then
        echo >&2 "File $src does not exists"
        return 1
    fi
    mkdir -vp "$(dirname "$dest")"
    cp -vTrdb "$src" "$dest"
}

if [[ $EUID -ne 0 ]]; then
    echo >&2 "WARNING: you might lack permissions to write to the directories. Try with 'sudo' if doesnt work."
fi

ACTION="${1:-install}"
case $ACTION in
install)
    while read -r _k _v; do
        placeIn "$_k" "$_v"
    done <<<"$install_locs"
    unset -v _k
    ;;
uninstall | remove | rm | delete)
    while read -r _ _v; do
        rm -vr "$_v"
    done <<<"$install_locs"
    ;;
"")
    echo >&2 "Available actions: install, uninstall, remove, rm, delete"
    exit 0
    ;;
*)
    echo >&2 "Action no supported: $ACTION"
    exit 1
    ;;
esac
