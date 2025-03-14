autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Scripts
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/git/git-prompt/git-info.sh

# Completion
# https://superuser.com/a/815317
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ":completion:*" matcher-list \
  '' \
  "m:{a-z\-}={A-Z\_}" \
  "r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}" \
  "r:|?=** m:{a-z\-}={A-Z\_}"

# Options
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
HISTCONTROL=ignoredups:erasedups

# Exports
export EDITOR=nvim

# Aliases
alias cd="z"
alias cdc="cd && clear"
alias ls="exa -lah --icons --group-directories-first"
alias cat="bat"
alias grep="ugrep -EinDskip --color=always"
alias fix-keys="sudo killall gpg-agent && sudo rm -rf /etc/pacman.d/gnupg && sudo pacman-key --init && sudo pacman-key --populate archlinux"

# Prompt
__zc_username=$'%F{yellow}%n%f'
__zc_hostname=$'%F{cyan}%m%f'
__zc_directory=$'%F{blue}%~%f'
__zc_newline=$'\n'
__zc_exitstatus=$'%(?.%F{green}.%F{red})'
__zc_privileges=$'%(!.#.$)'

precmd()
{ PROMPT="[${__zc_username}@${__zc_hostname}:${__zc_directory}] $(__zc_git_info)${__zc_newline}${__zc_exitstatus}${__zc_privileges}%f " }

# Evals
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Keybindings
bindkey "^[[Z" autosuggest-accept
