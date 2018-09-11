set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=ja
set modeline
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
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

nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" jjでインサートモードを抜ける
inoremap <silent> jj <ESC>

" Reload
:command! Reload source ~/.vimrc

"=======================
" vim-plugの設定
"=======================

call plug#begin('~/.vim/plugged')
" ファイルオープン支援
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
" ウィンドウサイズを簡単に変更
Plug 'simeji/winresizer'
" ステータスラインを装飾
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" PlugInstall でインストールするよ

"=======================
" プラグインごとの設定
"=======================

"-----------------------
" unite, neomruの設定
"-----------------------
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-H> :Unite file_mru<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"-----------------------
" vim-airlineの設定
"-----------------------
let g:airline#extensions#branch#enabled = 1

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
