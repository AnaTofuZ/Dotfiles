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
# direnv {{{
eval "$(direnv hook zsh)"
# }}}
# git alias {{{
alias grau="git remote add upstream"
alias gplu="git pull upstream master"
# }}}
# weather{{{
weather(){
    curl -4 wttr.in./$@
}
# }}}
# lvc {{{
function lvc() { if [ -f $1 ]; then less $1 | lv -c; fi;  }
# cf. https://qiita.com/chezou/items/e45b99c7080a3ded0f13
# }}}
# pyenv {{{
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
alias brew="env PATH=${PATH/\/Users\/anatofuz\/\.pyenv\/shims:/} brew"
# cf. http://www.task-notes.com/entry/20141223/1419324649
# }}}
# aws {{{
export PATH=~/.local/bin:$PATH
# cf. https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-install-macos.html
source $HOME/.local/bin/aws_zsh_completer.sh
# }}}
# gitignore {{{
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
#}}}
# screenshot-type {{{
function screenshot-type () {
    if [ $# -ne 1 ]; then
        echo "require bmp,gif,jpg,pdf,png,tiff"
        return 1
    else 
        defaults write com.apple.screencapture type $1
    fi
}
function _screenshot-type {
    _values 'type' 'jpg' 'png' 'pdf' 'bmp' 'gif' 'tiff'
}
compdef _screenshot-type screenshot-type
# }}}
# longman {{{
function longman(){ open "https://www.ldoceonline.com/jp/search/?q=$*" }
# }}}
