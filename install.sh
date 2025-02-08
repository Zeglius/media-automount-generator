#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")" || exit 1

DESTDIR=${DESTDIR:-/usr}
SUDOIF=""
if [[ $UID -ne 0 ]]; then
    SUDOIF="sudo"
fi

ACTION=${1:-install}

case $ACTION in
install)
    $SUDOIF cp -rT ./media-automount.d "$DESTDIR"/lib/media-automount.d
    $SUDOIF install -Dm755 ./media-automount-generator "$DESTDIR"/lib/systemd/system-generators/media-automount-generator
    ;;

uninstall)
    $SUDOIF rm -rf "$DESTDIR"/lib/media-automount.d
    $SUDOIF rm -f "$DESTDIR"/lib/systemd/system-generators/media-automount-generator
    ;;
esac
