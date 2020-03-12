" oooooo     oooo ooooo ooo        ooooo ooooooooo.     .oooooo.   
"  `888.     .8'  `888' `88.       .888' `888   `Y88.  d8P'  `Y8b  
"   `888.   .8'    888   888b     d'888   888   .d88' 888          
"    `888. .8'     888   8 Y88. .P  888   888ooo88P'  888          
"     `888.8'      888   8  `888'   888   888`88b.    888          
"      `888'       888   8    Y     888   888  `88b.  `88b    ooo  
"       `8'       o888o o8o        o888o o888o  o888o  `Y8bood8P'  

" =====================================
" === Auto load for first time uses ===
" =====================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

"当前窗口打开文件:e or :edit file 
let mapleader=" "
let &t_ut=''
syntax on "代码高亮
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nocompatible "关闭vi兼容模式
set encoding=utf-8
set number "显示行号
set norelativenumber "显示相对行号
set cursorline "光标线
set wrap "内容显示自动换行
set showcmd "底部显示命令
set wildmenu "输入命令是Tab键提示功能
set scrolloff=5 "光标距离top或者bottom的行数

set hlsearch "高亮搜索结果，下一行是避免上次搜索结果继续高亮
exec "nohlsearch"
set incsearch "边输入边高亮
set ignorecase "搜索时忽略大小写
set smartcase "搜索时优先匹配大小写

command! JsonFormat :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
  \ | :set ft=javascript
  \ | :1

" ===============================
" === Restore Cursor Position ===
" ===============================
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitright<CR>:vsplit<CR>

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tk :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" Press leader twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

call plug#end()
