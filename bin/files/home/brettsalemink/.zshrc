#==== ENVIRONMENT ====
#==== Added by Brett Salemink for Flutter Install ===
#export PATH=$HOME/Development/flutter/bin:$PATH

#Added by Brett Salemink
export ADULT=brettsalemink@manjaro.roguedesigns.us:/mnt/Media/Adult

# added by Anaconda3 installer
#export PATH="/home/brettsalemink/anaconda3/bin:$PATH"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/install:$PATH
export PATH=$HOME/lib/sh:$PATH

# The next line enables catt for pip and python
#export PATH="$PATH:$HOME/.local/bin"
#export PYTHONPATH="/usr/lib/python3/dist-packages/:$PYTHONPATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to golang
#export PATH=$PATH:/usr/local/go/bin

# Path to Go
#export GOPATH=$HOME/go

# Path to GoBin
#export GOBIN=$HOME/go/bin

# Path to User GoLang
#export PATH=$PATH:$GOBIN

# Variable for DVDAuthor
export VIDEO_FORMAT=NTSC

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

#== Added for NVM ==
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#=== THEMES ===
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="Soliah"

#=== AUTOLOADS ===
#==	ZSH Autoloads Added by Brett Salemink ==
#autoload zmv

#=== OH-MY-ZSH ===
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

#=== USER CONFIGURATION ===

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags do not use for Raspberry Pi ARCH ONLY
# export ARCHFLAGS="-arch x86_64"


#======= ALIASES ========
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#====== SOURCES =======
# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/home/brettsalemink/google-cloud-sdk/path.zsh.inc' ]; then source '/home/brettsalemink/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/home/brettsalemink/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/brettsalemink/google-cloud-sdk/completion.zsh.inc'; fi

# ZSH
source $ZSH/oh-my-zsh.sh

#======= COMMON ALIASES =======
source $HOME/bin/files/Aliases/aliases-common
source $HOME/bin/files/Aliases/aliases-systemctl

#======= SEPERATE MACHINE SPECIFIC ALIASES =========
source $HOME/bin/files/Aliases/Arch/aliases-arch
#source $HOME/bin/files/Aliases/Raspbian/aliases-raspbian
#source $HOME/bin/files/Aliases/Gentoo/aliases-gentoo
#
#

