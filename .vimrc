version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=ja
set modeline
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
" vim: set ft=vim :
syntax on

"=========================
"   Kawai's Setting
"=========================

" View
set number
set cursorline
colorscheme ron

" Tab
set expandtab
set autoindent
set smartindent

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.md setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead Makefile setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
augroup END

" Key mapping
nnoremap H ^
nnoremap L $

" window control
nnoremap <silent> ss :split<CR>
nnoremap <silent> sv :vsplit<CR>
nnoremap <silent> sh <C-w>h
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l

nnoremap <silent> <ESC><ESC> :nohlsearch<CR>:SyntasticReset<CR>
" ペーストの設定
noremap <silent> p "0p
noremap <silent> x "ex
set clipboard=unnamedplus

" vimgrep用の設定
augroup WuickFixCmd
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

" Reload
:command! Reload source ~/.vimrc

" for UnicornIDM
nnoremap T :w<CR>:!cd ~/document/unicornidm && make test<CR>
nnoremap TT :w<CR>:!cd ~/document/unicornidm && make test T="-s test/backend"<CR>
nnoremap TTT :w<CR>:!cd ~/document/unicornidm && make test T="-s test/backend/test_ad.py"<CR>

"========================
" NeoBundle
"========================

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-fugitive'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"========================
" Other setting for plugin
"========================
"Unite
noremap <C-n> :Unite -buffer-name=file file<CR>
noremap <C-h> :Unite file_mru<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>

"NERDTree
noremap <C-t> :NERDTree<CR>
au FileType nerdtree nnoremap <silent> <buffer> <ESC><ESC> :q<CR>

"syntastic
let g:syntastic_python_checkers = ["flake8"]

"indentLine
let g:indentLine_chare = '┆'

"TwitVim
let twitvim_force_ssl = 1
let twitvim_count = 40


au FileType gitcommit nnoremap <silent> <ESC><ESC> :q<CR>

au FileType qf nnoremap <silent> <ESC><ESC> :q<CR>

"========================
" Alias
"========================
:command! Tree NERDTree


"=======================
" ネットからコピペ
"=======================

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
 if has("autocmd")
     autocmd BufReadPost *
         \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""
