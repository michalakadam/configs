# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  npm
  sudo
  web-search
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

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
