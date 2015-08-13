" Kesco的Vim配置
" Author: Kesco Lin
" Date: 2015-08-10

" 普通设置
set nocompatible 						" 不兼容旧Vi
set autoread 							" 自动更新Buffer里的文件
" set autochdir							" 自动切换目录到当前文件
set nowrap			    				" 不自动折行
set mouse=a                             " 启用鼠标

syntax enable           				" 开启语法高亮
syntax on 			    				" 允许用指定语法高亮配色方案替换默认方案

set showmatch 							" 括号匹配
set matchtime=1 						" 匹配高亮时间(单位是十分之一秒)

" 搜索
set incsearch 							" 递进搜索
set hlsearch 							" 高亮搜索结果
set ignorecase          				" 搜索时大小写不敏感

" 文件编码
set encoding=utf-8						" 设置文件编码为utf-8

" 缩进设置
filetype indent on      				" 自适应不同语言的智能缩进
set smartindent							" 自动缩进

" 普通文件Tab设置
set expandtab							" 以空格代替Tab键
set tabstop=4
set softtabstop=4
set shiftwidth=4

" UI设置
set nu				    				" 显示行号
set cursorline							" 突出当前行
set guioptions-=m                       " 去除菜单栏
set guioptions-=T                       " 去除工具栏
set guioptions-=r       				" 去除右侧滚动条
set guioptions-=L       				" 去除左侧滚动条
" 字体使用Source Code Pro
if has('macunix')
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
endif
set laststatus=2        				" 总是显示状态栏
set ruler               				" 在状态栏显示行号

if has('gui_running')
    set lines=40
    set columns=120
endif

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'           " Vundle扩展
Plugin 'godlygeek/csapprox'             " CGI下的主题兼容
Plugin 'chriskempson/base16-vim'        " Base16主题
Plugin 'mhinz/vim-startify'             " 自定义欢迎界面
Plugin 'bling/vim-airline'              " AirLine
Plugin 'Shougo/unite.vim'               
Plugin 'Shougo/vimproc.vim'             " Vim-Shell依赖
Plugin 'Shougo/vimshell.vim'            " Vim Shell
Plugin 'Shougo/vimfiler.vim'
call vundle#end()
filetype plugin indent on

" 主题设置
colorscheme base16-solarized            

" 欢迎页面
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header=s:filter_header([
    \ ' _   __                        ',
	\ '| | / /                        ',      
	\ '| |/ /   ___  ___   ___   ___  ',
	\ '|    \  / _ \/ __| / __| / _ \ ',
	\ '| |\  \|  __/\__ \| (__ | (_) |', 
	\ '\_| \_/ \___||___/ \___| \___/ ',                
    \ '                               ',                     
    \ '-------------------------------',
    \ '(       Always for fun!       )',
    \ '-------------------------------',
    \ ])
let g:startify_change_to_dir= 1

" AirLine状态栏设置
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" Vim Shell
let g:vimshell_prompt='$ '
let g:vimshell_user_prompt='fnamemodify(getcwd(), ":~")'

" Vim Filer
let g:vimfiler_as_default_explorer=1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" 快捷键设置
let mapleader=';'						" 设置Leader键
" 打开Shell快捷键
nmap <leader>sh :VimShellPop<CR>
" Buffer切换快捷键
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bt :b 
" 文件浏览器快捷键
nnoremap <leader>n :VimFilerExplorer<CR>
autocmd FileType vimfiler nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('split')
