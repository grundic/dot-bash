ssh() {
    settitle "$*"
    if command ssh "$@"; then
        settitle $(hostname)
    fi
}
