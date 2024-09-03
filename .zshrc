if [ -z "$SCRIPT_SOURCED" ]; then
    export SCRIPT_SOURCED=0
fi

cd() {
    builtin cd "$@"
    if [[ ("$(pwd)" == "/Users/uxjp/dev" || "$(pwd)" == /Users/uxjp/dev/*) && "$SCRIPT_SOURCED" -ne 1 ]]; then
        source ~/.key-ssh-setup-github
        export SCRIPT_SOURCED=1
    fi
}
