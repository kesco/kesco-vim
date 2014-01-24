" 普通设置
set nocompatible              " be iMproved
set autoread                  " 外部修改后自动更新文件
syntax on                     " 语法高亮
filetype off                  " required!
filetype indent on	      " 根据文件类型缩进	
filetype plugin indent on     " required!
set incsearch             " incremental search
set hlsearch              " 高亮搜索结果
set nu                    " 显示行号
set cul                   " 高亮当前行
set autochdir             " 自动切换目录到当前文件的目录
set nowrap                " 不自动折行
set guifont=Source\ Code\ Pro\ for\ Powerline:h12       " GUI字体设置
let mapleader=","         " 绑定<Leader>键

" 平铺视图导航
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab 导航
noremap <D-M-Left> :tabprevious<cr>
noremap <D-M-Right> :tabnext<cr>
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" 文件编码
set encoding=utf-8              " vim内部的编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbkgb2312,cp936 " 默认新建的文件编码
set termencoding=utf-8          " 输出到终端的编码
set fileencoding=utf-8          " 写入文件的编码

" 缩进设置
set autoindent                " 自动缩进
set cindent                   " C风格缩进
set smartindent               " 智能缩进

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

" 折叠设置
set foldenable
set foldmethod=manual         " 手动折叠
set foldlevel=3

" 括号匹配
set showmatch
set matchtime=1               " 匹配高亮时间（单位是十分之一秒）
" GUI设置
if has("gui_running")
    set go=aAce
endif

" Vundle 设置
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Tomorrow 主题设置
Bundle 'chriskempson/vim-tomorrow-theme'
colorscheme Tomorrow-Night-Bright

" Airline 设置
Bundle 'bling/vim-airline'
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" CoffeeScript 插件设置
Bundle 'kchmck/vim-coffee-script'
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable     " 代码折叠

" YouCompleteMe 自动补全，感觉超级好用啊！
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'      " 补全额外设置
let g:ycm_complete_in_strings = 0                                       " 设置YCM不在字符串内补全
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 代码跳转

" Syntastic 代码错误检测
Bundle 'scrooloose/syntastic'

" AutoFormat 代码格式化，但是Python的支持还不是很好。
Bundle 'Chiel92/vim-autoformat'
let g:formatprg_args_expr_python = '"- ".(&textwidth ? "--max-line-length=".&textwidth : "")'   " Python的Bug，临时修复。
noremap <leader>fc :Autoformat<CR><CR>                                  " 代码格式化快捷键

" Tagbar 导航插件设置
Bundle 'majutsushi/tagbar'
nmap <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" 改进的Python语法高亮
Bundle 'hdima/python-syntax'
let python_highlight_all = 1        "高亮所有Python语法

" NerdTree 导航插件设置
Bundle 'scrooloose/nerdtree'
map <F3> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]      " 忽略文件列表
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end        " 当关闭最后文件时关闭Vim

" DelimitMate 自动补全引号插件设置
Bundle 'Raimondi/delimitMate'
au FileType python let b:delimitMate_nesting_quotes = ['"']     " Python特殊设置

" Ctrlp 全局查找插件设置
Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'            " 工作文件夹路径
set wildignore+=*/tmp/*,*.so,*.swp,*.zip        " 全局忽略文件列表
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
let g:ctrlp_user_command = 'find %s -type f'    " 使用操作系统自带查找工具

" JavaScript 语法高亮
Bundle 'jelera/vim-javascript-syntax'
" au FileType javascript call JavaScriptFold()    " enable javascript code folding

" JavaScript 类库高亮
Bundle 'othree/javascript-libraries-syntax.vim'

" Jade 语法高亮
Bundle 'digitaltoad/vim-jade'
autocmd BufNewFile,BufRead *.jade set filetype=jade             " Jade文件设置，解决与其它语法高亮冲突

" Buffer 导航插件
Bundle 'techlivezheng/vim-plugin-minibufexpl'
map <C-n> :MBEbn<cr>
map <C-o> :MBEbp<cr>
map <leader>mt :MBEToggle<cr>
let g:miniBufExplorerAutoStart = 0
