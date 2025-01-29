BIN := "./media-automount-generator"
DESTDIR := env("DESTDIR", "/usr")

@_default:
    just --list

test:
    rm -rf ./_test
    mkdir -p ./_test
    sudo DEBUG=${DEBUG:-1} {{ BIN }} ./_test

install:
    sudo cp -rT automounts.d {{ DESTDIR }}/lib/automounts.d
    sudo install -Dm755 {{ BIN }} {{ DESTDIR }}/lib/systemd/system-generators/{{ file_name(BIN) }}

uninstall:
    sudo rm -rf {{ DESTDIR }}/lib/automounts.d
    sudo rm -f {{ DESTDIR }}/lib/systemd/system-generators/{{ file_name(BIN) }}
