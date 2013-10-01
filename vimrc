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
" 有冲突
"map <c-w> :tabclose<cr> " Control + W 关闭Tab
map <c-t> :tabnew<cr> 	" Control + T 打开新Tab
map <c-n> :tabnext<cr> 	" Control + N 下一个Tab
map <c-p> :tabNext<cr>	" Control + P 上一个Tab

" 通用设置
set ai			" 自动缩进
set bs=2		" 在insert模式下用退格键删除
set showmatch		" 代码匹配
set autoread		" 文件自动加载
set helplang=cn		" 设置帮助语言为中文
set foldmethod=manual " 代码折叠
set cursorline		" 为光标所在行加下划线

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

