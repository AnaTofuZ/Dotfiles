# plenv {{{
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
#}}}

# zsh-cmpletation{{{
fpath=(/usr/local/share/zsh-completions
        $HOME/src/zsh/completions
        $fpath)
# }}}

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
export MANPATH="/usr/local/opt/erlang/lib/erlang/man:$MANPATH"
