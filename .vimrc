set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,shift_jis,default,latin1
set helplang=ja
set modeline
"=========================
"   Kawai's Setting
"=========================
"
" View
set number
set cursorline
colorscheme elflord

" window control
nnoremap <silent> ss :split<CR>
nnoremap <silent> sv :vsplit<CR>
nnoremap <silent> sh <C-w>h
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> st :tabnew<CR>
nnoremap <silent> sn gt
nnoremap <silent> sp gT

set tabstop=8
set shiftwidth=2
set softtabstop=-1

if v:version >= 800
    " openterminal
    noremap <C-T> :terminal ++curwin<CR>

    " terminal settings
    tnoremap <ESC> <C-w><S-n>
endif

" ESC2回で検索時のハイライトを消す
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <silent> L $
nnoremap <silent> H ^
" Reload
:command! Reload source ~/.vimrc
" HTMLタグ自動補完
augroup MyXML
  autocmd!
  autocmd BufNewFile,BufRead *.html inoremap <buffer> </ </<C-x><C-o>
augroup END

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
Plug 'tpope/vim-fugitive'
call plug#end()

"-----------------------
" unite, neomruの設定
"-----------------------
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-H> :Unite file_mru<CR>
" タブ一覧
nnoremap sT :Unite tab<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


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

" beep音を鳴らさない
set vb t_vb=
