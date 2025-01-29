BIN := "./media-automount-generator"

@_default:
    just --list

test:
    rm -rf ./_test
    mkdir -p ./_test
    sudo DEBUG=${DEBUG:-1} {{ BIN }} ./_test
