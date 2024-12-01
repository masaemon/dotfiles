" Leaderキーをスペースにする 
let mapleader = "\<space>"
" vim-plugがインストールされていないならインストールする
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc 
endif

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " ファイルツリー
Plug 'easymotion/vim-easymotion' " コードジャンプ
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSPコード補完
Plug 'tpope/vim-vinegar' " 同じバッファにファイルツリーを表示して選択したファイルを表示してくれる
Plug 'mbbill/undotree' " アンドゥーツリー
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " ファジーファインダー
Plug 'junegunn/fzf.vim' " ファジーファインダー
Plug 'tpope/vim-fugitive' " gitのツール
Plug 'vim-test/vim-test' " テストランナー
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot' "シンタックスハイライトのツール
Plug 'dense-analysis/ale' " リンター
Plug 'vim-airline/vim-airline' " ステータスライン
Plug 'vim-airline/vim-airline-themes' "ステータスラインテーマ
Plug 'yuttie/hydrangea-vim' " カラースキーム
Plug 'arcticicestudio/nord-vim' " カラースキーム
Plug 'jsit/toast.vim' " カラースキーム 

call plug#end()

" helpを日本語化
set helplang=ja,en


syntax on
filetype plugin indent on

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
colorscheme toast 
set number
set encoding=utf-8
set cursorline " 行数をハイライト
hi clear CursorLine " 現在行の線を表示しない

" 永続undoの設定
set undofile
if !isdirectory(expand("~/.vim/undodir/"))
    call mkdir(expand("~/.vim/undodir/"), "p", 0700)
endif
set undodir=~/.vim/undodir

" プラグインを有効にする
packloadall

" ヘルプファイルをロードする
silent! helptags ALL

" ウィンドウの移動
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
noremap <ESC> <c-[>

" ウィンドウを閉じずにバッファを削除
command! Bd :bp | :sp | :bn | :bd

" 折り畳み
" set foldmethod=indent

" 検索のハイライト
set hlsearch

" インクリメンタルサーチ
set incsearch

" 十字キーを無効に
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" ;と:の交換
noremap ; :

" かっこの中にカーソルを移動
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

" インサートモード中の移動"
inoremap <c-h> <c-o>h
inoremap <c-j> <c-o>j
inoremap <c-k> <c-o>k
inoremap <c-l> <c-o>l

" ツリーの表示
noremap <leader>e :NERDTreeToggle<cr>

" ツリーでの隠しファイルを表示
let NERDTreeShowHidden = 1

" アンドゥツリの表示
noremap <f5> :UndotreeToggle<cr>

" vim-test 
let test#strategy = "dispatch"

" ctags
set tags=./tags;$HOME

" fzf
nnoremap <space>g :Rg<space>
nnoremap <space>p :GFiles<space>
nnoremap <space>h :History<space>

" vim-airlineタブの表示
let g:airline#extensions#tabline#enabled = 1
" Powerline Fontsを利用
let g:airline_powerline_fonts = 1
" テーマの指定'
let g:airline_theme = 'wombat'

" 次のバッファに移動する
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
