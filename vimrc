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


" 设置 utf-8 编码解决 vim 下乱码的问题
set encoding=utf-8

" 将 leader 设置为空格
let mapleader=" "

" 代码高亮
syntax on

" 关闭vi兼容模式
set nocompatible

" 识别不同的文件格式
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 提高某些终端 vim 配色的兼容性
let &t_ut=''

" 启用鼠标操作
set mouse=a

" tab 缩进长度
set tabstop=4
set shiftwidth=4
set softtabstop=4

" tab 自动转换为空格
set expandtab

" 将行尾空格显示出来
set list
set listchars=tab:▸\ ,trail:▫

" 光标距离top或者bottom的行数
set scrolloff=5

" 缩进
set tw=0
set indentexpr=

" 退格键从行首回到上一行行尾
set backspace=indent,eol,start

" 代码收起
set foldmethod=indent

" 让光标插入模式和普通模式不一样
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 状态栏高度
set laststatus=2

" 在当前目录下执行程序
set autochdir

" 关闭代码自动折叠
set nofoldenable

" 显示行号
set number

" 显示相对行号
set norelativenumber

" 光标线
set cursorline

" 内容显示自动换行
set wrap

" 底部显示命令
set showcmd

" 输入命令是Tab键提示功能
set wildmenu

" 高亮搜索结果，下一行是避免上次搜索结果继续高亮
set hlsearch

" 打开 vim 时取消高亮
exec "nohlsearch"

" 边输入边高亮
set incsearch

" 搜索时忽略大小写
set ignorecase

" 搜索时优先匹配大小写
set smartcase

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

" buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <leader>q :bdelete<CR>

" Open lazygit
noremap <C-g> :term lazygit<CR>

" fuzzy finder
noremap <C-f> :FZF<CR>

" 上下左右分屏
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitright<CR>:vsplit<CR>

" 切换分屏选中窗口
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" 分屏窗口大小调整
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 标签页
map tk :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

" 横竖分屏切换
map sH <C-w>t<C-w>H
map sK <C-w>t<C-w>K

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

"当前窗口打开文件:e or :edit file
map <LEADER>rc :e $MYVIMRC<CR>

" Spelling Check
map <LEADER>sc :set spell!<CR>

" Press leader twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" NERDTree
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "h"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "l"

" NERDTree Git
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Undotree
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR><C-w>h
" map L :UndotreeToggle<CR>

" vim-instant-markdown
" let g:instant_markdown_slow = 0
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
" let g:instant_markdown_autoscroll = 1

" Bullets.vim
" let g:bullets_set_mappings = 0
" let g:bullets_enabled_file_types = [
"       \ 'markdown',
"       \ 'text',
"       \ 'gitcommit',
"       \ 'scratch'
"       \]

" vim-markdown-toc
" let g:vmt_auto_update_on_save = 0
" let g:vmt_dont_insert_fence = 1
" let g:vmt_cycle_list_item_markers = 1
" let g:vmt_fence_text = 'TOC'
" let g:vmt_fence_closing_text = '/TOC'

" Markdown Settings
" Snippets
" source $HOME/.vim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell

" vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

" colorscheme snazzy
" let g:SnazzyTransparent = 1

" noremap r :call CompileRunGcc()<CR>
" func! CompileRunGcc()
"   exec "w"
"   if &filetype == 'c'
"     exec "!g++ % -o %<"
"     exec "!time ./%<"
"   elseif &filetype == 'cpp'
"     set splitbelow
"     exec "!g++ -std=c++11 % -Wall -o %<"
"     :sp
"     :res -15
"     :term ./%<
"   elseif &filetype == 'java'
"     exec "!javac %"
"     exec "!time java %<"
"   elseif &filetype == 'sh'
"     :!time bash %
"   elseif &filetype == 'python'
"     set splitbelow
"     :sp
"     :term python3 %
"   elseif &filetype == 'html'
"     silent! exec "!".g:mkdp_browser." % &"
"   elseif &filetype == 'markdown'
"     exec "InstantMarkdownPreview"
"   elseif &filetype == 'tex'
"     silent! exec "VimtexStop"
"     silent! exec "VimtexCompile"
"   elseif &filetype == 'dart'
"     exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
"     silent! exec "CocCommand flutter.dev.openDevLog"
"   elseif &filetype == 'javascript'
"     set splitbelow
"     :sp
"     :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
"   elseif &filetype == 'go'
"     set splitbelow
"     :sp
"     :term go run .
"   endif
" endfunc

" :PlugInstall :PlugClean
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto Complete
" Plug 'ycm-core/YouCompleteMe'

" Markdown
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'
" Plug 'vimwiki/vimwiki'

" Undo Tree
Plug 'mbbill/undotree'

" Plug 'connorholyday/vim-snazzy'

call plug#end()

