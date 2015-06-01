" 自用的一套配置
" Author : Kesco Lin
" Date : 2014-12-22

" 普通设置
set nocompatible 		" 不兼容旧Vi
set autoread 			" 自动更新Buffer里的文件
set nu				    " 显示行号
set incsearch 			" 递进搜索
set hlsearch 			" 高亮搜索结果
set ignorecase          " 搜索时大小写不敏感
set autochdir			" 自动切换目录到当前文件
set nowrap			    " 不自动折行
set cursorline			" 突出当前行

set laststatus=2        " 总是显示状态栏
set ruler               " 在状态栏显示行号

syntax enable           " 开启语法高亮
syntax on 			    " 允许用指定语法高亮配色方案替换默认方案

set showmatch 			" 括号匹配
set matchtime=1 		" 匹配高亮时间(单位是十分之一秒)

set guifont=Source\ Code\ Pro\ for\ Powerline:h12 " GUI字体设置
set guioptions-=r       " 去除右侧滚动条
set guioptions-=L       " 去除左侧滚动条

" 设置Leader键
let mapleader=';'

" 文件编码
set encoding=utf-8		" 设置文件编码为utf-8

filetype plugin indent on	" 开启文件名探测缩进

" 缩进设置
filetype indent on      " 自适应不同语言的智能缩进
set smartindent			" 自动缩进

" 文件编码
set encoding=utf-8 		" vim内部的编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbkgb2312,cp936 " 默认新建的文件编码
set termencoding=utf-8 	" 输出到终端的编码
set fileencoding=utf-8 	" 写入文件的编码

" 普通文件Tab设置
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 特殊文件Tab设置
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType html,htmldjango,xhtml,haml,jade setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

" 文件类型设置
autocmd BufNewFile,BufReadPost *.md set filetype=markdown       " Markdown设置
autocmd FileType markdown setlocal wrap                         " Markdown折行

" 折叠设置
set foldmethod=syntax   " 根据语法进行缩进
set nofoldenable        " 启动 vim 时关闭折叠代码

" 括号匹配
set showmatch
set matchtime=1         " 匹配高亮时间（单位是十分之一秒）

" 需要载入的插件
call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim' 	" 主题
Plug 'scrooloose/nerdtree'      " 文件浏览器
Plug 'techlivezheng/vim-plugin-minibufexpl' " Buffer
Plug 'kien/ctrlp.vim'           " Ctrl-P功能插件
Plug 'mileszs/ack.vim'          " ACK插件

Plug 'scrooloose/syntastic'     " 代码语法检查
Plug 'Chiel92/vim-autoformat'   " 代码格式化
Plug 'Valloric/YouCompleteMe'   " 代码补全
Plug 'majutsushi/tagbar'        " 显示代码结构
Plug 'Raimondi/delimitMate'     " 括号补全

Plug 'wting/rust.vim'		    " Rust语法支持
Plug 'aklt/plantuml-syntax'	    " PlantUml语法支持
Plug 'udalov/kotlin-vim'        " Kotlin语法支持

Plug 'vimwiki/vimwiki'          " VimWiki

Plug 'jmcantrell/vim-virtualenv'    " Python Virtualenv支持

if has('gui_running')
    Plug 'vim-airline'          " 状态栏美化
endif

call plug#end()

" 主题设置
let g:seoul256_background = 252
colo seoul256

" 状态栏美化Airline设置
if has('gui_running')
    let g:airline_powerline_fonts = 1
endif

" 文件浏览器设置
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ] " 忽略文件列表
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end " 当关闭最后文件时关闭Vim

" Buffer设置
map <leader>mt :MBEToggle<cr>
let g:miniBufExplorerAutoStart = 0  " 默认不打开Buffer提示栏
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

" CtrlP设置
let g:ctrlp_working_path_mode = 'ra' " 工作文件夹路径
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " 全局忽略文件类型
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f' " 使用系统查找命令

" 代码格式化设置
noremap <leader>fc :Autoformat<CR><CR>

" 代码语法检测
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 代码语法检测Lint设置
let g:syntastic_python_checkers = ['flake8']

" 代码自动补全
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'    " 全局默认配置
set completeopt-=preview        " 不要提示
let g:ycm_add_preview_to_completeopt = 0    " 补全时不弹出预览框
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" 代码结构Tagbar设置
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1      " 自动高亮代码所在Tag区域

" DelimitMate 自动补全引号插件设置
au FileType python let b:delimitMate_nesting_quotes = ['"']     " Python特殊设置

" VimWiki
let g:vimwiki_menu = ''         " 不在菜单栏上显示Vimwiki
let g:vimwiki_use_mouse = 1     " 使用鼠标
let g:vimwiki_diary_months = {
    \ 1: '一月', 2: '二月', 3: '三月', 4: '四月', 5: '五月', 6: '六月',
    \ 7: '七月', 8: '八月', 9: '九月', 10: '十月', 11: '十一月', 12: '十二月'
    \ }                         " 设置日期显示文字
autocmd FileType vimwiki setlocal wrap " 折行
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,img' " 设置可以在笔记中使用的Html Tag
let develop_notes = {}          " 个人开发笔记
let develop_notes.path = '~/Documents/note/develop-notes'                       " 笔记文件路径
let develop_notes.path_html = '~/Documents/note/develop-notes/output/'          " 笔记转换为HTML输出路径
let develop_notes.template_path = '~/Documents/note/develop-notes/template/'    " 用于生成HTML页面的模板
let develop_notes.template_default = 'kesco.tpl'                                " 默认模板
let develop_notes.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'java': 'java', 'sh': 'sh',
    \ 'viml': 'vim', 'xml': 'xml'
    \ }                                                                         " 启用的代码语法高亮
let g:vimwiki_list = [develop_notes]                                            " 笔记列表
nmap <leader>wc :VimwikiAll2HTML<CR>
