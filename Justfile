BIN := "./media-automount-generator"

@_default:
    just --list

test:
    mkdir -p ./_test
    sudo DEBUG=1 {{ BIN }} ./_test