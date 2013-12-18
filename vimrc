" Vundle设置
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tomasr/molokai'
Bundle 'plasticboy/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'bling/vim-airline'
Bundle 'mhinz/vim-startify'
Bundle 'scrooloose/nerdtree'
Bundle 'Yggdroot/indentLine'
Bundle 'hdima/python-syntax'
Bundle 'majutsushi/tagbar'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'kevinw/pyflakes-vim'
Bundle 'scrooloose/nerdcommenter'

" vim-scripts repos

filetype plugin indent on     " required!

" 主题设置
syntax enable
set background=dark
let g:molokai_original = 1
colorscheme molokai

" UI设置
set nu
" GUI设置
if has("gui_running")
    set go=aAce		 " 去掉工具栏和滑动条
    " set transparency=30  " 透明背景
    set guifont=Source\ Code\ Pro\ for\ Powerline:h13 " 设置字体
    set showtabline=2    " 开启自带的tab栏
    set columns=100      " 设置宽
    set lines=35         " 设置长
endif

" Markdown 设置
let g:vim_markdown_folding_disabled=1
filetype plugin on
let g:instant_markdown_slow = 1

" 搜索设置
set ignorecase		" 忽略大小写
set smartcase		" 不忽略单词首位大写
set hlsearch 		" 高亮搜索内容
set incsearch  		" 即时搜索

" Tab设置
map <c-w> :tabclose<cr> " Control + W 关闭Tab
map <c-t> :tabnew<cr> 	" Control + T 打开新Tab
map <c-n> :tabnext<cr> 	" Control + N 下一个Tab
map <c-p> :tabNext<cr>	" Control + P 上一个Tab

" 通用设置
set ai			" 自动缩进
set bs=2		" 在insert模式下用退格键删除
set showmatch		" 代码匹配
set autoread		" 文件自动加载
set helplang=cn		" 设置帮助语言为中文
set foldmethod=indent " 代码折叠
set foldlevel=99
set cursorline		" 为光标所在行加下划线
set nowrap          " 不自动折行

" 分屏跳转
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Tab键设置
set expandtab
set shiftwidth=4
set tabstop=4

" Airline 设置
set laststatus=2 	" 总是显示状态行
set t_Co=256        " 设置颜色
let g:airline_powerline_fonts = 1 " Airline字体设置
let g:airline#extensions#tabline#enabled = 1 " Airline状态栏设置

" Vim-Startify 设置
" Startify颜色设置
hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=111
hi StartifyHeader  ctermfg=203
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240

" 自定义页首文字
let g:startify_custom_header = [
            \ '      __ __                        __      _    _    ___           ',
            \ '     / //_/__  ______________      \ \    ( )  | |  / (_)___ ___   ',
            \ '    / ,< / _ \/ ___/ ___/ __ \      \ \   |/   | | / / / __ `__ \  ',
            \ '   / /| /  __(__  ) /__/ /_/ /       \ \       | |/ / / / / / / /  ',
            \ '  /_/ |_\___/____/\___/\____/         \_\      |___/_/_/ /_/ /_/   ',
            \ '',
            \ '',
            \ ]

" 自定义页尾文字
let g:startify_custom_footer = [
            \ '',
            \ '   Coding well !!!',
            \]

" 自动显示的内容
let g:startify_list_order = ['files', 'dir']
" 显示文件数
let g:startify_files_number = 10
" 打开文件时自动跳到该文件目录
let g:startify_change_to_dir = 1

" NerdTree 设置
nnoremap <F2> :NERDTreeToggle<cr>   " 设置目录树快捷键
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif  " 设置当Vim最后窗口为NerdTree时自动关闭

" indentLine 设置
let g:indentLine_char = '┊'
let g:indentLine_noConcealCursor = 1

" python-syntax 设置
let python_highlight_all = 1

" Python 设置
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" Tagbar 设置
nmap <F3> :TagbarToggle<CR>

" Parentheses 设置
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Trailing-whitespace设置
map <leader><space> :FixWhitespace<cr>  去除行末尾空行

" DelimitMate 自动补全单引号，双引号等
" for python docstring ",优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']

" 语法检查
" Syntastic设置
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
let g:pyflakes_use_quickfix = 0
