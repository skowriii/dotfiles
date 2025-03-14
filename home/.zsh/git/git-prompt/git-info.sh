__zc_git_info() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local git_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    local git_status=$(git status --porcelain 2>/dev/null)

    if [[ -n "$git_status" ]]; then
        echo "%F{red}($git_branch)*%f"
    else
        echo "%F{green}($git_branch)=%f"
    fi
}
