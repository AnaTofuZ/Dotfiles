#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# 上書き禁止
setopt noclobber
bindkey -e

# plenv {{{
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
# }}}
# GOPATH {{{
export GOPATH=$HOME
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GO111MODULE=on
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
export RBENV_ROOT="$HOME/.rbenv"
path=($HOME/.rbenv/bin $path)
eval "$(rbenv init -)"
# }}}
# bundle {{{
alias be="bundle exec"
# }}}
# cr slide {{{
#function _slide-cr {
#    _values 'command' 'new' 'build' 'upload' 'build-open' 'edit' 'open' 'memo'
#}
#
#compdef _slide-cr slide-cr
# }}}
# CbCgcc {{{
alias cbcgcc=/Users/anatofuz/workspace/cr/build_gcc/bin/gcc
# }}}
# CbClang{{{
alias cbclang=/Users/anatofuz/workspace/cr/build_llvm/bin/clang
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
alias gia="git add"
alias gc="git commit --verbose"
alias gp="git push"
alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'
# }}}
# weather{{{
weather(){
    curl -4 wttr.in./$@
}
# }}}
# lvc {{{
function lvc() { if [ -f $1 ]; then less $1 | lv -c; fi;  }
# cf. https://qiita.com/chezou/items/e45b99c7080a3ded0f13
alias lv='lv -c'
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
#export PATH=/Users/anatofuz/.pyenv/versions/3.6.5/bin:$PATH
# cf. https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-install-macos.html
#source /Users/anatofuz/.pyenv/versions/3.6.5/bin/aws_zsh_completer.sh
# }}}
# gitignore {{{
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
#}}}
# screenshot-type {{{
screenshot-type () {
    if [ $# -ne 1 ]; then
        echo "require bmp,gif,jpg,pdf,png,tiff"
        return 1
    else 
        defaults write com.apple.screencapture type $1
    fi
}

# }}}
# longman {{{
function longman(){ open "https://www.ldoceonline.com/jp/search/?q=$*" }
# }}}
# google cloud sdk {{{
#source /Users/anatofuz/src/google-cloud-sdk/completion.zsh.inc
#source /Users/anatofuz/src/google-cloud-sdk/path.zsh.inc
# }}}
# zplug {{{
#source ~/.zplug/init.zsh
# }}}
# pipenv {{{
eval "$(pipenv --completion)"
# }}}
# cat-gemfile{{{
function cat-gemfile()
{
    cat <<EOF
source 'http://rubygems.org'
ruby '2.5.1'
EOF
}
# }}}
# carton {{{
alias ce='carton exec --'
# }}}
# qt {{{
export PATH="/usr/local/opt/qt/bin:$PATH"
# }}}
# heroku autocomplete setup{{{
HEROKU_AC_ZSH_SETUP_PATH=/Users/anatofuz/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
#}}}
# gpg {{{
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
#}}}
#perlib {{{
alias perlib='perl -Ilocal/lib/perl5'
#}}}
#LC_ALL{{{
#export LC_ALL="ja_JP.UTF-8"
##export LC_CTYPE=C
#export LANG="ja_JP.UTF-8"
#}}}
# sandbox {{{
sandbox(){
    mkdir $PWD/.sandbox
    cd .sandbox
}
rmsandbox(){
    cd $PWD/../
    rm -rf .sandbox
}
# }}}
# ghq {{{
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias ghqdoc='godoc $(ghq list --full-path | peco) | $PAGER'
# }}}
# bat {{{
export BAT_THEME="GitHub"
# }}}
# hd{{{

host=$HOST:fr
export dirfile="$HOME/.dirfile.$host"

function cd {
    builtin cd "$@"
    echo $PWD >| $dirfile
}

function hd {
    cd `cat $dirfile`
}

# }}}
# brew llvm {{{
#export PATH="/usr/local/opt/llvm/bin:$PATH"
# }}}
# CBC_COMPILER {{{
export CBC_COMPILER=$HOME/workspace/cr/build_llvm/bin/clang
# }}}
# toFullwidth {{{
alias toFullwidth="perl -C -Mutf8 -pe 'tr/0-9a-zA-Z/０-９ａ-ｚＡ-Ｚ/'"
# }}}
export PATH="/usr/local/opt/libarchive/bin:$PATH"
export PATH="/Users/anatofuz/.local/bin:$PATH"

# bison {{{
export PATH="/usr/local/opt/bison/bin:$PATH"
LDFLAGS="-L/usr/local/opt/bison/lib"
# }}}
# $HOME/src/bin {{{
export PATH="$HOME/src/bin:$PATH"
# }}}
export PATH="/usr/local/opt/m4/bin:$PATH"
#export PATH="/Users/anatofuz/.cabal/bin:$PATH"
# ls alias {{{
alias ls="ls -GF"
alias sl="ls"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
# }}}
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export blogdir="/Users/anatofuz/Documents/blog"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# for nokogiri {{{
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libxslt/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export LDFLAGS="-L/usr/local/opt/libxslt/lib"
export CPPFLAGS="-I/usr/local/opt/libxslt/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/libxslt/lib/pkgconfig"
# }}}
# perl6 zef path {{{
export PATH="$(readlink $(where perl6) | perl -pne 's[\.\.][/usr/local]; s[(.*)/bin/perl6][$1/share/perl6/site/bin]'):$PATH"
# }}}

# history {{{
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

alias   h="fc -l -d -20"
alias   history="fc -l -d -$HISTSIZE"
# }}}
#autoload -U promptinit; promptinit
#prompt pure
prompt='%S+%s%m%S+%s%n '


# zsh syntax highlight {{{
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
path=("$HOME/anaconda3/bin" $path)
# grep color {{{
export GREP_OPTIONS='--color=auto'
# }}}

export STUDENT_NUMBER_MASTER="k198584"

# anatofuz-tools {{{
path=("$HOME/src/firefly/hg/Members/anatofuz/anatofuz-tools" $path)
#}}}
