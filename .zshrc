#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.# {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# }}}
bindkey -e

#syntachighright
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
 bindkey '^f' peco-z-search
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
# zle -N peco-kill
# bindkey '^k' peco-kill
#}}}
# 課題ディレクトリにpecoジャンプ {{{
#function peco-work{

#    local res=$
#}}}
#Language set {{{
export LC_ALL=ja_JP.UTF-8
#}}}
#cdを打ったら自動的にls{{{
function cd(){
    builtin cd $@ && ls;
}
#}}}
#cdをC-uで移動{{{

#function cdup(){
#    echo 
#    cd ..
#   zle reset-prompt
#   }
#zle -N cdup
#bindkey '^u' cdup
#}}}
#TreeVnc{{{
#alias tvc ='java -jar /Users/e155730/bin/TreeVNC.jar'
#}}]
# Customize to your needs...

[ -s "/Users/e155730/.k/kvm/kvm.sh" ] && . "/Users/e155730/.k/kvm/kvm.sh" # Load kvm

#yomitan ssh{


#}}}
#vim_tex{{{
vitex(){

    echo "hoo!"
    if [ -e *.tex ]; then
        texfile=`ls -1 *.tex`
        wc_tex=`echo $texfile|grep -c ''`

        if [ $wc_tex -ne 1 ]; then
            texfile=`echo "$texfile"|peco`
        fi

        vim $texfile
    fi
}
#}}}
#weather{{{
weather(){
    curl -4 wttr.in/okinawa
}
#}}}
# plenv {{{
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
#}}}

#export PATH="/Users/e155730/Canossa/working/OS/kono/jpf-core-new/bin:$PATH"

# nodebrew {{{
#export PATH=$HOME/.nodebrew/current/bin:$PATH
# }}}

# perldoc{{{
alias perldoc='perldoc -M Pod::Text::Color::Delight'
# }}}
# carton {{{
alias carp='carton exec -- perl'
alias riji='carton exec -- riji'
alias crc='carton exec --'
# }}}
# ghc {{{
# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
#export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
#if [ -d "$GHC_DOT_APP" ]; then
#  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
#fi
# }}}
# rbenv {{{
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# }}}
# ghq alias{{{
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
# }}}
# direnv {{{
eval "$(direnv hook zsh)"
# }}}
# jupyter notebook{{{
alias jnote='jupyter notebook'
# }}}


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## tmuxを起動 {{{
#if [ $SHLVL = 1 ]; then
#      tmux
#fi
##}}}
# llvm(openMP){{{
alias clang-omp='/usr/local/opt/llvm/bin/clang -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
alias clang-omp++='/usr/local/opt/llvm/bin/clang++ -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
#}}}
#
# alias less line number {{{
alias less="less -N"
# }}}
#PROMPT='%F{red}%(5~,.../%2~,%4~)%f%F{blue}%#%f '
#
# git status{{{
 autoload -Uz vcs_info
 autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
#
function _update_vcs_info_msg()
{
    LANG=ja_JP.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg
# }}}

#alias git{{{
alias gia='git add'
alias gc='git commit --verbose'
alias gp='git push'
alias grau="git remote add upstream"
alias gplu="git pull upstream master"
#}}}

zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

### sandbox{{{
sandbox()
{
    mkdir $PWD/.sandbox
    cd .sandbox
}
#}}}


export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

eval "$(direnv hook zsh)"

# libxml2{{{
export PATH="/usr/local/opt/libxml2/bin:$PATH"
# }}}

# added by travis gem
[ -f /Users/e155730/.travis/travis.sh ] && source /Users/e155730/.travis/travis.sh

alias be="bundle exec"

## hub {{{
function git(){hub "$@"}
#}}}
#qt5 {{{
export CPPFLAGS="-I/usr/local/opt/qt5/include"
export LDFLAGS="-L/usr/local/opt/qt5/lib"
export PATH=/usr/local/opt/qt5/bin:$PATH
#}}}
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

# php {{{
#export PATH="$(brew --prefix homebrew/php/php72)/bin:$PATH"
#}}}
#
# coreUtils {{{
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# }}}

# . /Users/e155730/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

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

# cr-slide {{{


function _slide-cr {
    _values 'command' 'new' 'build' 'upload' 'open' 'edit' 'build-open' 'memo'
}

compdef _slide-cr slide-cr

# }}}
#
# alias perl {{{
function perlib(){
    perl -I$PWD/local/lib/perl5
}
# }}}
#


function longman(){
    open "https://www.ldoceonline.com/jp/dictionary/$1";
}


# ruby-build {{{
export PATH="/Users/e155730/.rbenv/plugins/ruby-build/bin:$PATH"
# }}}
#
alias bundleiexec="bundle install --without production --path vendor/bundle"
#export PATH="/usr/local/opt/apr/bin:$PATH"
#export PATH="/usr/local/opt/apr-util/bin:$PATH"
#export PATH="/usr/local/opt/libpq/bin:$PATH"
#export PATH="/usr/local/opt/python@2/bin:$PATH"
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
PATH="/usr/local/opt/gnupg@1.4/libexec/gpgbin:$PATH"

export PATH="/Users/e155730/Documents/src/google-cloud-sdk/bin:$PATH"
# The next line enables shell command completion for gcloud.
if [ -f '/Users/e155730/Documents/src/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/e155730/Documents/src/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/ncurses/bin:$PATH"

export EDITOR=nvim

#pyenv {{
export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"
#}}}
eval "$(pipenv --completion)"

alias cbcgcc="/Users/e155730/workspace/CbC/src/bin/gcc"
