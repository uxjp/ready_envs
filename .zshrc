cd() {
    builtin cd "$@"
    if [ "$(pwd)" = "/Users/uxjp/dev" ] && [ "$SCRIPT_SOURCED" -eq 0 ]; then
        source ~/.key-ssh-setup-github
        export SCRIPT_SOURCED=1
    fi
}
