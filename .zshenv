# plenv {{{
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
#}}}

# zsh-cmpletation{{{
fpath=(/usr/local/share/zsh-completions
        $HOME/src/zsh/completions
        $fpath)
# }}}

# rust zsh completions {{{
if hash rustup 2>/dev/null; then
    rustup completions zsh > $HOME/src/zsh/completions/_rustup
fi

if hash rustc 2>/dev/null; then
    fpath=($(rustc --print sysroot)/share/zsh/site-functions $fpath)
fi
# }}}

# 補完{{{
autoload -U compinit
compinit
#}}}
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
export MANPATH="/usr/local/opt/erlang/lib/erlang/man:$MANPATH"
