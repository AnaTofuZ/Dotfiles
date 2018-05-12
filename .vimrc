"dein 初期設定{{{
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/anatofuz/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/anatofuz/.cache/dein')
  call dein#begin('/Users/anatofuz/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/anatofuz/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/neocomplete.vim')

  call dein#add('osyo-manga/vim-anzu')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('tomtom/tcomment_vim')

  call dein#add('w0ng/vim-hybrid')
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('itchyny/lightline.vim')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
" }}}
" ----------------------------------------------------
set nocompatible
filetype off
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

set vb t_vb=
set shortmess+=I               " 起動時のメッセージを消す
let g:bufferline_echo=0
set hidden
set nobackup                   " バックアップを作らない
set noswapfile                 " swapファイルを作らない
set autoread                   " 他で書き換えられたら自動で読み直す
set cindent
set expandtab                  " タブは全部展開する
set ruler
set showcmd
set title
set number
set ignorecase                 " 大文字小文字を無視して検索
set smartcase                  " 大文字を入力すると大文字小文字無視を解除
set wrapscan                   " 先頭に戻って検索
set hlsearch                   " 前回の検索結果が残ってればハイライトする
set incsearch
set textwidth=0                " 自動改行させない
set backspace=indent,eol,start
set formatoptions+=m           " 整形オプション，マルチバイト系を追加
set formatoptions-=ro          " 挿入モードで改行した時に # を自動挿入しない
set wildmenu                   " コマンド補完を強化
set wildmode=list:full         " リスト表示，最長マッチ
set fileformats=unix,dos,mac   " 改行コードの自動認識
set list                       " タブなどの制御文字を表示
set tabstop=4
set shiftwidth=4
set autoindent
set scrolloff=5
set lcs=tab:>.,trail:_,extends:\  " タブを表示する。改行文字は表示しない
set laststatus=2               "常にステータス行を表示

syntax on

if has('gui')
    set clipboard=unnamed,unnamedplus
endif

set t_Co=256
colorscheme Tomorrow

highlight Normal ctermbg=none
highlight Comment ctermfg=7
"highlight Pmenu ctermbg=4
"highlight PmenuSel ctermbg=1
"highlight PMenuSbar ctermbg=4
" ----------------------------------------------------

" search with anzu -----------------------------------
let g:lightline = {
    \ 'active': {
    \   'left': [
    \       ['mode', 'paste'],
    \       ['readonly', 'filename', 'modified', 'anzu']
    \   ]
    \ },
    \ 'component_function': {
    \   'anzu': 'anzu#search_status'
    \ }
    \ }

" vim-anzu
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
"augroup vim-anzu
"    autocmd!
"    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
"augroup END
" ----------------------------------------------------

" NeoComplete ----------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
let g:neocomplete#max_list = 20
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_auto_close_preview = 0
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default'  : '',
            \ 'vimshell' : '~/.vimshell_hist',
            \ 'scheme'   : '~/.gosh_completions'
            \ }

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" ----------------------------------------------------

" Snippet --------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets/'

if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" ----------------------------------------------------


" Unite ----------------------------------------------
"let g:unite_enable_start_insert=1
"let g:unite_enable_split_vertically = 0
"let g:unite_winheight = 15
"let g:unite_winwidth = 40
""noremap <C-B> :Unite buffer<CR>
"noremap <C-N> :Unite -buffer-name=file file<CR>
"noremap <C-Z> :Unite file_mru<CR>
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"" ----------------------------------------------------

" Easy align---{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}---

" ctags auto save ------------------------------------
let g:auto_ctags = 1
" ----------------------------------------------------

" インデント可視化"{{{
"let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_faster = 1
"}}}
" 検索単語を画面中央に"{{{
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
"}}}
" 折り返された文章でも自然に"{{{
nnoremap j gj
nnoremap k gk
"}}}
" タブでペアにジャンプ"{{{
nnoremap <Tab> %
vnoremap <Tab> %
"}}}
" ESC2回でハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=yellow
endfunction

if has('syntax')
    augroup ZenkakuSpace
    autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" Insert mode からjjで逃走{{{
inoremap jj <ESC>
"}}}

set foldmethod=marker
