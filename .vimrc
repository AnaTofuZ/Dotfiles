"dein Scripts----------------------------- {{{
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
  call dein#add('junegunn/vim-easy-align')
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('zerowidth/vim-copy-as-rtf')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

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

"End dein Scripts------------------------- }}}

language ja_JP.UTF-8
" language ja_JP.eucJP
" set encoding=euc-jp
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
set expandtab
set sw=2 sts=2 ts=2
set softtabstop=4
set nocompatible
set backupcopy=yes
syntax on
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme Tomorrow
set tags=tags;/
set runtimepath+=~/src/public/qfixapp
let howm_dir="~/public_html/howm/"
set runtimepath+=~/etc/vim

"キーマップリーダー
let QFixHowm_Key = 'g'
"howm_dirはファイルを保存したいディレクトリを設定。
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

" ai
" Emacs like key in Insert mode
map!  A
map!  0I
map!  lli
map!  i
" map!  ka
" map!  ja
map!  :su
map!  d$a
map!  Ua
map!  pa
" Paragraph Folder
map q !}nkf -w -Bmf59
map q !}nkf -w -Bmf59
" Execute Typed Command Macro
map e "mdd@m
" Read Typed file
map ! 0i:r!"ndd@n
" Comment/Uncomment
map ; ^i/* A */^
map u :s/\/\* \([^*]*\) \*\//\1
" Incorporate mouse selection
map i :r!xcb -p 0
" Decode MIME selection
map m !}nkf -w -m
map j !}nkf -w -Bm
" cut & page
map v !aquaclip
map c !}aquaclip put
map a :0,$!aquaclip put
" Windowing like Emacs
map 0 :close
map 1 :only
map 2 :split
map 5 :vsplit
map o 
map! 0 :close
map! 1 :onlya
map! 2 :splita
map! 5 :vsplita
map! o 

map n :GtagsCursor
map p :Gtags -r ^

" defaults:
let otl_install_menu=1
let no_otl_maps=0
let no_otl_insert_maps=0

" overrides:
let otl_bold_headers=0
let otl_use_thlnk=0

" au BufWinLeave *.otl mkview
" au BufWinEnter *.otl silent loadview
let maplocalleader = ","

autocmd FileType make setlocal noexpandtab
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set shiftwidth=4
autocmd BufRead *.py set smarttab
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set softtabstop=4
autocmd BufRead *.py set autoindent
autocmd BufRead *.py highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead *.py match BadWhitespace /^\t\+/
autocmd BufRead *.py match BadWhitespace /\s\+$/

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
set foldmethod=marker
set shortmess+=I

" deactive insert mode from jj to ESC
inoremap <silent> jj <ESC>

set backspace=indent,eol,start

" end

set noswapfile

" cbc {{{
autocmd BufNewFile,BufRead *.cbc set filetype=c
" }}}

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

autocmd FileType perl6 setlocal syntax=off

autocmd BufWritePre * :%s/\s\+$//e

