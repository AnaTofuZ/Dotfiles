#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

#PATH for ~/bin
export PATH=$PATH:$HOME/bin

# for MacTeX
export PATH="/Library/TeX/texbin:$PATH"

# plenv PATH
export PATH="/usr/local/Cellar/plenv/2.2.0/bin:$PATH"

# GOPATH {{{
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/Documents/src/Go
export PATH="$GOPATH:$PATH"
export PATH="$GOPATH/bin:$PATH"
#}}}

# nodebrew PATH
export PATH=/Users/e155730/.nodebrew/current/bin:$PATH


# JPF PATH
export JPF_HOME=/Users/e155730/Documents/src/java/jpf-core

#opemipi
export PATH=/opt/openmpi/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

export GO15VENDOREXPERIMENT=1

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# CbC
export CBC_COMPILER=/Users/e155730/src/github.com/kuina/Kuin/releacs/bin/clang
