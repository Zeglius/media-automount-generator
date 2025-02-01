BIN := "./media-automount-generator"
export DESTDIR := env("DESTDIR", "/usr")

@_default:
    just --list

test:
    rm -rf ./_test
    mkdir -p ./_test
    sudo DEBUG=${DEBUG:-1} {{ BIN }} ./_test

install:
    ./install.sh install

uninstall:
    ./install.sh uninstall
