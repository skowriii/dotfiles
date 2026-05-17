# Install znap
[[ -r ~/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/znap

source ~/.zsh/znap/znap.zsh

# Compinit
if [ "$(date +'%j')" = "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    zstyle '*:compinit' arguments -C
    zstyle '*:bashcompinit' arguments -C
fi

# Scripts

# git-prompt
znap source woefe/git-prompt.zsh

# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

znap source zsh-users/zsh-autosuggestions

# zsh-ssh-agent
znap source twfksh/zsh-ssh-agent

# ohmyzsh plugins
znap source ohmyzsh/ohmyzsh plugins/sudo
znap source ohmyzsh/ohmyzsh plugins/history-substring-search

# zsh-completions
znap source zsh-users/zsh-completions

# zsh-syntax-highlighting
znap source zdharma-continuum/fast-syntax-highlighting

# mend
znap source Rakosn1cek/mend

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
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE
setopt EXTENDED_GLOB
setopt globdots

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
HISTCONTROL=ignoredups:erasedups

# Exports
export EDITOR=nvim
export WORDCHARS="${WORDCHARS//\/}"

# Aliases
alias cd="z"
alias cdc="cd && clear"
alias ls="exa -lah --icons --group-directories-first"
alias cat="bat"
alias rg="rg --color=always"
alias grep="grep --color=never"
alias fix-keys="sudo killall gpg-agent && sudo rm -rf /etc/pacman.d/gnupg && sudo pacman-key --init && sudo pacman-key --populate archlinux"
alias ncdu="ncdu -t$(nproc)"
alias startftp="sudo systemctl start vsftpd"
alias stopftp="sudo systemctl stop vsftpd"
alias restartftp="sudo systemctl restart vsftpd"
alias statusftp="systemctl status vsftpd"
alias change-resolution="nvim ${HOME}/.config/hypr/land/monitors.conf && exit"
alias resmem="tail /dev/zero"
alias ping="ping -c 4"

# Prompt
__zc_username=$'%F{red}%n%f'
__zc_hostname=$'%F{cyan}%m%f'
__zc_directory=$'%F{blue}%~%f'
__zc_newline=$'\n'
__zc_exitstatus=$'%(?.%F{green}.%F{red})'
__zc_privileges=$'%(!.#.$)'

PS1='%F{yellow}[%f${__zc_username}%F{magenta}@%f${__zc_hostname}%F{magenta}:%f${__zc_directory}%F{yellow}]%f $(gitprompt)${__zc_newline}${__zc_exitstatus}${__zc_privileges}%f '
znap prompt

# Evals
znap eval zoxide 'zoxide init zsh'

# Keybindings
bindkey "^[[Z" autosuggest-accept
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Functions
znap function _python_argcomplete pipx 'eval "$(register-python-argcomplete pipx)"'
complete -o nospace -o default -o bashdefault \
    -F _python_argcomplete pipx

export PATH=$PATH:/home/skowriii/.spicetify

# Created by `pipx` on 2026-05-16 17:05:56
export PATH="$PATH:/home/skowriii/.local/bin"
