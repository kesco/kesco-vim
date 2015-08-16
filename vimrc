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
Plugin 'Shougo/vimfiler.vim'            " 文件管理器
Plugin 'tpope/vim-fugitive'             " Git插件
Plugin 'Shougo/neocomplete.vim'         " 代码补全
Plugin 'majutsushi/tagbar'              " 代码结构插件
Plugin 'jiangmiao/auto-pairs'           " 括号补全
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

" 代码补全
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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
" 代码结构快捷键
nnoremap <leader>t :TagbarToggle<CR>
