export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

DISABLE_COMPFIX="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git-prompt ssh-agent zsh-autosuggestions zsh-syntax-highlighting)
plugins=(ssh-agent zsh-autosuggestions zsh-syntax-highlighting)

# ssh-agent setup
zstyle :omz:plugins:ssh-agent identities ~/.ssh/main_ssh
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent agent-forwarding yes

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
    bashcompinit
else
    compinit -C
    bashcompinit -C
fi

# Scripts
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/wikiman/widgets/widget.zsh
source <(COMPLETE=zsh jj)

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

# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Exports
export EDITOR=nvim

# Aliases
alias cd="z"
alias cdc="cd && clear"
alias ls="exa -lah --icons --group-directories-first"
alias cat="bat"
alias grep="ugrep -EinDskip --color=always"
alias fix-keys="sudo killall gpg-agent && sudo rm -rf /etc/pacman.d/gnupg && sudo pacman-key --init && sudo pacman-key --populate archlinux"
alias cp="/usr/local/bin/advcp -g"
alias mv="/usr/local/bin/advmv -g"
alias ncdu="ncdu -t$(nproc)"

# Prompt
__zc_username=$'%F{red}%n%f'
__zc_hostname=$'%F{cyan}%m%f'
__zc_directory=$'%F{blue}%~%f'
__zc_newline=$'\n'
__zc_exitstatus=$'%(?.%F{green}.%F{red})'
__zc_privileges=$'%(!.#.$)'

precmd()
{
    RPROMPT=
    PROMPT="%F{yellow}[%f${__zc_username}%F{magenta}@%f${__zc_hostname}%F{magenta}:%f${__zc_directory}%F{yellow}]%f ${__zc_newline}${__zc_exitstatus}${__zc_privileges}%f "
}

# precmd()
# {
#     RPROMPT=
#     PROMPT="%F{yellow}[%f${__zc_username}%F{magenta}@%f${__zc_hostname}%F{magenta}:%f${__zc_directory}%F{yellow}]%f $(git_super_status)${__zc_newline}${__zc_exitstatus}${__zc_privileges}%f "
# }

# Evals
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(register-python-argcomplete pipx)"

# Keybindings
bindkey "^[[Z" autosuggest-accept
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line

export PATH="$PATH:/home/smoolldev/.local/bin:/home/smooll/.spicetify"
