# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

export HISTFILE=~/.local/state/zsh/history
export HISTSIZE=1000
export SAVEHIST=1000

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    auto-notify
    you-should-use
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.config/oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

export zconf="$HOME/.config/zsh"
export hconf="$HOME/.config/hypr"
export hscripts="$hconf/scripts"
export hcomp="$hconf/components"

export LANG="pt_BR.UTF-8"alias zenvrc="nvim $HOME/.config/zsh/.zshenv"
export LC_ALL="pt_BR.UTF-8"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NIMBLE_DIR="$XDG_DATA_HOME/nimble"
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RANDFILE="$XDG_DATA_HOME/rnd"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export ANDROID_HOME="$XDG_DATA_HOME"/android

precmd() {
    precmd() {
        echo
    }
}


# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'Especifique: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completando %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SRolagem ativa: item %l%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/breno/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt autocd beep
unsetopt notify
setopt no_auto_menu

# export MANPATH="/usr/local/man:$MANPATH"

bindkey '\t' menu-complete
bindkey "^H" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Dir alias
#alias ls="lsd"
alias ls="echo use \'l\' instead of \'ls\'" 
alias l="lsd"
alias la="lsd -A"
alias ll="lsd -lh"
alias lla"=lsd -Alh"
alias cp="cp -rfv"
alias rm="rm -rfv"
alias mv="mv -v"
alias mkdir="mkdir -pv"

# Git alias
alias gcl="git clone"
alias gi="git init"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin master"

# Config alias
alias hyprc="nvim $hconf/hyprland.conf"
alias keyrc="nvim $hconf/keys.conf"
alias winrc="nvim $hconf/winrules.conf"
alias henvrc="nvim $hconf/env.conf"
alias wallrc="nvim $hconf/hyprpaper.conf"
alias zshrc="nvim $zconf/.zshrc"

# Other alias
alias h="history"
alias upd="yay -Syu --noconfirm"
alias please="sudo"
alias untar="tar -zxvf"
alias sha="shasum -a 256"
alias net="ping -c 4 8.8.8.8"
alias myip="curl ifconfig.co"
alias n="nvim"
alias icat="kitten icat"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias code="vscodium"


eval "$(starship init zsh)"
