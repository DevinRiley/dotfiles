# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"
export LS_COLORS=exfxcxdxbxegedabagacad;
# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
plugins=(rails)
source $ZSH/oh-my-zsh.sh

ulimit -n 1024
# vi key bindings
bindkey -v
# allow ctrl-R to work with vim bindings
bindkey '^R' history-incremental-search-backward
# Customize to your needs...
export PATH=/bin:/usr/local/bin:/usr/local/sbin:/bin:/bin:/usr/share/java/grails/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:usr/local/go/bin
PATH=$PATH:/usr/local/share/npm/bin # Add Node.js modules path
PATH=$PATH:/usr/local/bin/gcc-4.2
PATH=$PATH:/usr/local/go/bin/
PATH=$PATH:/Users/devin/Library/Python/3.6/bin/ 
export C_INCLUDE_PATH=/usr/local/Cellar/imagemagick/6.8.7-7/include/ImageMagick-6 # for rmagick
if which rbenv > /dev/null;
then eval "$(rbenv init - zsh)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### Root directory for the Go Language
export GOROOT=/usr/local/go
### Path for Go libraries & local code
export GOPATH=$HOME/Code/go
### Add Go binaries to path
export PATH=$PATH:$GOPATH/bin
# Add Algorithms 4th Edition library code to Java class path
export CLASSPATH=$CLASSPATH:$HOME/Code/sedgewick/library/algs4.jar:$HOME/Code/sedgewick/library/stdlib.jar
# Add vim as default editor 
export EDITOR=vim
alias gd='git diff'
alias gs='git status'
alias gco='git checkout'
alias ga='git add -p'
alias be='bundle exec'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias rake='noglob rake'
ulimit -S -n 2048
# Use brew installed ctags
alias ctags='/usr/local/bin/ctags'

rails_replace() {
  find ./app ./spec -name "*.rb" -exec sed -i '' -e $1 {} \;
}
