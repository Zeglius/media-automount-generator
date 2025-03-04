#!/bin/bash

set -euo pipefail

exec 2> >(printf '%s: ' "$(date)" "$(</dev/stdin)" | tee -ia log.txt >&2)

cd "$(dirname "$0")" || exit 1

DESTDIR=${DESTDIR:-/usr}
install_locs="media-automount-generator /usr/lib/udev/media-automount-udev
              60-media-automount.rules /etc/udev/rules.d/60-media-automount.rules
              media-automount.d $DESTDIR/lib/media-automount.d"

placeIn() {
    local src=${1:?}
    local dest=${2:?}

    if [[ ! -e $src ]]; then
        echo >&2 "File $src does not exists"
        return 1
    fi
    mkdir -vp "$(dirname "$dest")"
    cp -vTrd "$src" "$dest"
}

if [[ $EUID -ne 0 ]]; then
    echo >&2 "WARNING: you might lack permissions to write to the directories. Try with 'sudo' if doesnt work."
fi

ACTION=${1:-install}
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
*)
    echo >&2 "Action no supported: $ACTION"
    exit 1
    ;;
esac
