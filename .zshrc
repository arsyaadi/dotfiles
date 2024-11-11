# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# zstyle ':omz:update' frequency 13

# DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=vim

# User
export USER=arstzy
# export USER=arsya

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# aliases
alias lvim='/Users/apple/.local/bin/lvim'
alias cls='clear'

# run nix-darwin profile
alias nix-run-profile='nix run nix-darwin -- switch --flake ~/.config/nix-darwin'


# starship
eval "$(starship init zsh)"

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"

export PATH="/usr/local/opt/msodbcsql17/bin:$PATH"
export PATH="/usr/local/opt/mssql-tools/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export HOMEBREW_NO_AUTO_UPDATE=true
export PATH="/opt/homebrew/Cellar/neovim/0.9.5/bin:$PATH"
export PATH="$PATH:/Users/apple/development/flutter/bin"
export PATH=$PATH:/usr/local/opt/curl/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/13/bin
export PATH="/opt/homebrew/opt/php@7.2/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.2/sbin:$PATH"
export ANDROID_HOME=/Users/apple/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
# export PATH="$PATH:/Users/apple/.dotnet/tools"
export PATH=$PATH:$HOME/.dotnet/tools
# export DOTNET_ROOT=$HOME/dotnet
# export PATH=$PATH:$HOME/dotnet
export DOTNET_ROOT=/usr/local/share/dotnet
export PATH=$DOTNET_ROOT/sdk/6.0.300:$PATH
# export DOTNET_ROOT=/usr/local/share/dotnet
# export PATH=$PATH:/usr/local/share/dotnet

export M2_HOME=/Applications/apache-maven-3.9.6
export PATH=$PATH:$M2_HOME/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH

# export JAVA_HOME=$(/usr/libexec/java_home -v 11)
# export PATH=$JAVA_HOME/bin:$PATH

# export JAVA_HOME=$(/usr/libexec/java_home -v 17)
# export PATH=$JAVA_HOME/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/apple/.dart-cli-completion/zsh-config.zsh ]] && . /Users/apple/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]



# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
