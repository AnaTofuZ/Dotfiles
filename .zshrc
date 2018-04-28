#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# 上書き禁止
setopt noclobber

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# plenv {{{
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
# }}}

# GOPATH {{{
export GOPAT=$HOME/workspace/go
export PATH=$PATH:$(go env GOPATH)/bin
#}}}

# hub {{{
function git(){hub "$@"}
# }}}

# man {{{
# cf. https://qiita.com/yu-ichiro/items/ea9c672e2d7488416db9
alias man='env LANG=C man'
# }}}

# gpg-agent {{{
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
# }}}
# rbenv {{{
eval "$(rbenv init -)"
# }}}
# bundle {{{
alias be="bundle exec"
# }}}
# cr slide {{{
function _slide-cr {
    _values 'command' 'new' 'build' 'upload' 'build-open' 'edit' 'open' 'memo'
}

compdef _slide-cr slide-cr
# }}}
# CbCgcc {{{
alias cbcgcc=/Users/anatofuz/workspace/cr/build_gcc/bin/gcc
# }}}
# nodebrew {{{
export PATH=$HOME/.nodebrew/current/bin:$PATH
# }}}
#fasd {{{
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias c='fasd_cd -d'
# cf. https://github.com/clvv/fasd
alias v='f -e vim' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open
# }}}
# perldoc {{{
alias perldoc='perldoc -M Pod::Text::Color::Delight'
# }}}
#peco-kill{{{
function peco-kill(){
    for pid in `ps aux| peco --prompt "PROCESS >" |awk '{ print $2 }'`
    do
        kill $pid
        echo "Killed ${pid}"
    done
}
alias pk="peco-kill"
#}}}
#function peco-z-search# {{{
function peco-z-search
{
    which peco z > /dev/null
    if [ $? -ne 0 ]; then
        echo "Please install peco and z"
        return (1)
    fi
    local res=$(z | sort -rn | cut -c 12- | peco)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
        else
            return 1
        fi
 }
zle -N peco-z-search
bindkey '^[pz' peco-z-search
# }}}
