setopt noclobber
bindkey -e

unsetopt BEEP
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

setopt HIST_VERIFY
setopt printeightbit
#pbcopy {{{
alias pbcopy="xsel --clipboard --input"
#}}}
# ubuntu open {{{
#alias open="xdg-open"
#}}}
#golang {{{
#export PATH="/usr/local/go/bin:$PATH"
#}}}
# zsh-completions {{{
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
# }}}
# zsh hook {{{
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# }}}
# plenv {{{
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
# }}}
# man {{{
# cf. https://qiita.com/yu-ichiro/items/ea9c672e2d7488416db9
alias man='env LANG=C man'
# }}}
# rbenv {{{
export RBENV_ROOT="$HOME/.rbenv"
path=($HOME/.rbenv/bin $path)
eval "$(rbenv init -)"

function rbenv_update(){
  currnt_dir=$PWD
  cd $HOME/.rbenv
  git pull
  cd plugins/ruby-build
  git pull
  cd $currnt_dir
}

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
# CBC_COMPILER {{{
#export CBC_COMPILER=$HOME/workspace/cr/CbC/build_llvm/bin/clang
export CBC_COMPILER=/home/anatofuz/workspace/ie/build/cbc_gcc/bin/gcc
#export CBC_COMPILER=/Users/anatofuz/workspace/cr/CbC/build_gcc/bin/gcc
# }}}
#fasd {{{
#eval "$(fasd --init auto)"
#alias a='fasd -a'        # any
#alias s='fasd -si'       # show / search / select
#alias d='fasd -d'        # directory
#alias f='fasd -f'        # file
#alias sd='fasd -sid'     # interactive directory selection
#alias sf='fasd -sif'     # interactive file selection
#alias zz='fasd_cd -d'     # cd, same functionality as j in autojump
#alias zzz='fasd_cd -d -i' # cd with interactive selection
#alias c='fasd_cd -d'
## cf. https://github.com/clvv/fasd
#alias v='f -e vim' # quick opening files with vim
#alias m='f -e mplayer' # quick opening files with mplayer
#alias o='a -e xdg-open' # quick opening files with xdg-open
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
alias gs="git status"
# }}}
# weather{{{
weather(){
    curl -4 wttr.in./$@
}
# }}}
# lvc {{{
function lvc() { if [ -f $1 ]; then less $1 | lv -c; fi;  }
# cf. https://qiita.com/chezou/items/e45b99c7080a3ded0f13
alias lv='lv -cla -Ou8'
# }}}
# less {{{
alias less="less -r"
# }}}
# gitignore {{{
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
#}}}
# longman {{{
function longman(){ open "https://www.ldoceonline.com/jp/search/?q=$*" }
# }}}
# google cloud sdk {{{
#source /Users/anatofuz/src/google-cloud-sdk/completion.zsh.inc
#source /Users/anatofuz/src/google-cloud-sdk/path.zsh.inc
# }}}
# pipenv {{{
#eval "$(pipenv --completion)"
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
#perlib {{{
alias perlib='perl -Ilocal/lib/perl5'
#}}}
#LC_ALL{{{
#export LC_ALL="ja_JP.UTF-8"
##export LC_CTYPE=C
export LANG="en_US.UTF-8"
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
#alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias ghqdoc='godoc $(ghq list --full-path | peco) | $PAGER'
# }}}
# bat {{{
export BAT_THEME="GitHub"
# }}}
# hd{{{

export dirfile="$HOME/.dirfile"


function save_dir_history {
    echo $PWD >>| $dirfile
}

chpwd_functions+=save_dir_history

function hd {
    cd $(cat $dirfile | tail -1)
}

function dirfileuniq {
    local new_dirfile=$(cat $dirfile | /usr/local/bin/perl -ne 'BEGIN{%dir;} chomp($_); $dir{$_}++; END{map { print "$_\n" if (-d $_) } keys %dir}')
    echo $new_dirfile >| $dirfile
}

function dirfile_frequency_cut {
  local new_dirfile=$(cat $dirfile | /usr/local/bin/perl -ne 'BEGIN{%dir;} chomp($_); $dir{$_}++; END{map { print "$_\n" if (-d $_) } sort grep { $dir{$_} > 1} keys %dir}')
   echo $new_dirfile >| $dirfile
}

function dirfile_frequency {
  local new_dirfile=$(cat $dirfile | /usr/local/bin/perl -ne 'BEGIN{%dir;} chomp($_); $dir{$_}++; END{map { print "$dir{$_} : $_\n" if (-d $_) } sort grep { $dir{$_} > 1} keys %dir}')
  echo $new_dirfile
}

# }}}
alias eject="diskutil eject"
#function peco-z-search# {{{
function peco-z-search
{
    which peco > /dev/null
    if [ $? -ne 0 ]; then
        echo "Please install peco "
        return (1)
    fi
    local res=$(cat $dirfile | perl -ne 'BEGIN{%dir;} chomp($_); $dir{$_}++; END{map { print "$_\n" if (-d $_) } grep { $_ !~ /game/ } keys %dir}' | peco)
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
# toFullwidth {{{
alias toFullwidth="perl -C -Mutf8 -pe 'tr/0-9a-zA-Z/０-９ａ-ｚＡ-Ｚ/'"
# }}}
export PATH="/usr/local/opt/libarchive/bin:$PATH"
#export PATH="/Users/anatofuz/.local/bin:$PATH"
# bison {{{
export PATH="/usr/local/opt/bison/bin:$PATH"
#LDFLAGS="-L/usr/local/opt/bison/lib $LDFLAGS"
# }}}
# $HOME/src/bin {{{
export PATH="$HOME/src/bin:$PATH"
# }}}
export PATH="/usr/local/opt/m4/bin:$PATH"
#export PATH="/Users/anatofuz/.cabal/bin:$PATH"
# ls alias {{{
alias ls="ls -F --color=auto"
alias sl="ls"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias ltr="ls -ltr"
# }}}
export LDFLAGS="-L/usr/local/opt/libffi/lib $LDFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export blogdir="$HOME/Documents/blog"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib $LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/icu4c/include $CPPFLAGS"
# history {{{
# 履歴ファイルの保存先

host=$HOST:fr
tty=$TTY:t

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

if [[ -w $HOME ]]; then
HISTFILE=$HOME/.history
#export HISTSIZE=200
#export SAVEHIST=$HISTSIZE
fi

#export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=10000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=10000000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

#setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
alias   h="fc -l -d -20"
alias   history="fc -l -d -$HISTSIZE"
# }}}
#autoload -U promptinit; promptinit
#prompt pure
prompt='%S+%s%m%S+%s%n$ '
# zsh syntax highlight {{{
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
# anatofuz-tools {{{
path=("$HOME/src/firefly/hg/Members/anatofuz/anatofuz-tools" $path)
#}}}
# cpm {{{
alias cpc="cpm install; carton install;"
# }}}
path=(/usr/local/linaro/arm-linux-gnueabihf-raspbian/bin $path)
# pwdcopy{{{
function pwdcopy(){
  pwd | pbcopy
}
#}}}
function ojicopy {
  local ojimsg=$(ojichat $@)
  echo $ojimsg
  echo $ojimsg | pbcopy
}
# ghg {{{
export PATH="$HOME/.ghg/bin:$PATH"
# }}}
# open book {{{{
function openbooks(){
  (cd ~/Documents/Books; open "$(find ./ -name \*.pdf   | peco)")
}
#}}}
function ptvim () {
  vim $(pt $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}
export CBC_LANG_COMPILER=cbclang
# gi2hgi {{{
function gi2hgi {
  local gitignore=${PWD}/.gitignore
  if [[ ! (-f $gitignore) ]]; then
    exit 1
  fi
  echo 'syntax:glob' >| .hgignore
  cat $gitignore >> .hgignore
  rm $gitignore
}
# }}}
# nodenv {{{
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init - --no-rehash)"
#}}}
# colordiff {{{
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff'
fi
#}}}
# ARM_LIBRARY {{{
#export ARM_LIBRARY="/Users/anatofuz/workspace/cr/arm_library"
# }}}
# $HOME/.local/bin {{{
export PATH="$HOME/.local/bin:$PATH"
# }}}
# rm_last {{{
function rm_last {
  rm -rf $(ls -tr | tail -1)
}
#}}}
# zen {{{
export PATH="${HOME}/workspace/zen/zen-macos-x86_64-0.8.20191124+552247019:$PATH"
# }}}
# fdvim {{{
function fdvim {
  vim $(fd $1 | peco)
}
# }}}
# libc man {{{
export MANPATH="/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/share/man:$MANPATH"
# }}}
# history_peco {{{
function peco-history-selection() {
BUFFER=`history | perl -nle 'print $1 if /\d+\s+\d{2}:\d{2}\s+(.*)/' | peco`
#BUFFER=`cat ~/.zsh_history | perl -nle 'print $1 if /:\s+\d+:\d;(.*)/' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function phr() {
BUFFER=`history | perl -nle 'print $1 if /\d+\s+\d{2}:\d{2}\s+(.*)/' | perl -e 'print reverse <>' | peco`
#BUFFER=`cat ~/.zsh_history | perl -nle 'print $1 if /:\s+\d+:\d;(.*)/' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N phr


# }}}
# hi {{{
function hi() {
  local gitvar=`curl -L -s https://www.gitignore.io/api/$@`
  printf 'syntax:glob\n%s\n' ${gitvar}
}

# }}}
# ripgrep {{{
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
# }}}
# firefly {{{
export fireflyhg_local=$HOME/src/firefly/hg
export fireflyhg=ssh://firefly/hg
# }}}
# GOPATH {{{
export GOPATH=$HOME
export PATH=$(go env GOPATH)/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GO111MODULE=on
#}}}
# gpg key {{{
export GPG_TTY=$(tty)
#}}}
# ubuntu : perldoc {{{
#alias perldoc="/home/anatofuz/.plenv/shims/perldoc"
#}}}
# rakuenv {{{
export PATH="$HOME/.rakuenv/bin:$PATH"
eval "$(rakuenv init -)"
#}}}
