# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

# oh-my-zsh plugins
plugins=(
  command-not-found
  archlinux
  git
  npm
  sudo
  kubectl
  kubectx
  mvn
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add other zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings for autosuggestion
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History for autosuggestion
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# The line below ensures that:
# 1. Any locally-installed man pages (e.g. for software you built yourself) are found before the distro’s versions.
# 2. You still inherit the rest of your man path via :$MANPATH, so you don’t lose access to the standard pages.
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias beautiful="/home/adam/Documents/qima-platform/.git/hooks/backend.maven-git-code-format.pre-commit.sh"

up() {
  /home/adam/Code/scripts/start_everything.sh "$@"
}

# asdf config:
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adam/.sdkman"
[[ -s "/home/adam/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adam/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2025-05-24 11:13:55
export PATH="$PATH:/home/adam/.local/bin"

# Load Angular CLI autocompletion.
export PATH="$PATH:$(npm get prefix -g)/bin"
source <(ng completion script)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
