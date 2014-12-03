" 自己的配置，用惯了Vim真TM离不开了

" 普通设置
set nocompatible              " be iMproved
set autoread                  " 外部修改后自动更新文件
syntax on                     " 语法高亮
filetype off                  " required!
filetype indent on	      " 根据文件类型缩进	
set incsearch             " incremental search
set hlsearch              " 高亮搜索结果
set nu                    " 显示行号
set autochdir             " 自动切换目录到当前文件的目录
set nowrap                " 不自动折行

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

" Markdown设置
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType markdown setlocal wrap                         " Markdown默认折行

" 折叠设置
set foldenable
set foldmethod=manual         " 手动折叠
set foldlevel=3

" 括号匹配
set showmatch
set matchtime=1               " 匹配高亮时间（单位是十分之一秒）

" 平铺视图导航
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab 导航
if has("gui_running")
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
endif

" Vundle Settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin list
Plugin 'gmarik/Vundle.vim'                              " Vundle
Plugin 'chriskempson/base16-vim'                        " Base16 Theme
Plugin 'scrooloose/nerdtree'                            " NerdTree
Plugin 'majutsushi/tagbar'                              " Tagbar
Plugin 'techlivezheng/vim-plugin-minibufexpl'           " MiniBuffer
Plugin 'kien/ctrlp.vim'                                 " ctrlp
Plugin 'scrooloose/syntastic'                           " syntastic
Plugin 'Valloric/YouCompleteMe'                         " YouCompleteMe
Plugin 'Raimondi/delimitMate'                           " delimitMate
Plugin 'Chiel92/vim-autoformat'                         " autoformat
Plugin 'kchmck/vim-coffee-script'                       " CoffeeScript
Plugin 'jelera/vim-javascript-syntax'                   " JavaScript
Plugin 'othree/javascript-libraries-syntax.vim'         " JavaScript-libraries
Plugin 'digitaltoad/vim-jade'                           " Jade
Plugin 'hdima/python-syntax'                            " Python
Plugin 'lukaszkorecki/CoffeeTags'                       " CoffeeTags
Plugin 'junegunn/goyo.vim'                              " Distraction-free Writing Mode
Plugin 'amix/vim-zenroom2'                              " iAWriter Mode
Plugin 'yonchu/accelerated-smooth-scroll'               " 平滑滚动
Plugin 'dyng/ctrlsf.vim'                                " ACK插件
Plugin 'jmcantrell/vim-virtualenv'                      " VirtualEnv
Plugin 'wting/rust.vim'                                 " Rust语言支持
" GUI Plugins
if has("gui_running")
Plugin 'bling/vim-airline'                              " Airline
endif

" 所有插件都必须定义在这下一行之前
call vundle#end()
filetype plugin indent on     " required!

" GUI设置
if has("gui_running")
    colorscheme base16-eighties
    set background=dark
    set go=aAce
    set cul                   " 高亮当前行
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12       " GUI字体设置
    " Airline
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
endif

" NerdTree 导航插件设置
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]      " 忽略文件列表
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end        " 当关闭最后文件时关闭Vim

" Tagbar 导航插件设置
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" 添加对CoffeeScript的支持
let g:CoffeeAutoDisabled=1

" Buffer 导航插件
if has("gui_running")
    map <C-n> :MBEbn<cr>
    map <C-o> :MBEbp<cr>
    map <leader>mt :MBEToggle<cr>
    let g:miniBufExplorerAutoStart = 0
endif

" Ctrlp 全局查找插件设置
let g:ctrlp_working_path_mode = 'ra' " 工作文件夹路径
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " 全局忽略文件列表
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }
let g:ctrlp_user_command = 'find %s -type f' " 使用操作系统自带查找工具

" Syntastic Checker设置
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_python_checkers = ['flake8']

" YouCompleteMe 自动补全，感觉超级好用啊！
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'      " 补全额外设置
let g:ycm_complete_in_strings = 0                                       " 设置YCM不在字符串内补全
let g:ycm_autoclose_preview_window_after_completion = 1                 " 自动关闭提示窗口
let g:ycm_autoclose_preview_window_after_insertion = 1                  " 自动关闭提示窗口
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 代码跳转

" DelimitMate 自动补全引号插件设置
au FileType python let b:delimitMate_nesting_quotes = ['"']     " Python特殊设置

" AutoFormat 代码格式化，但是Python的支持还不是很好。
let g:formatprg_args_expr_python = '"- ".(&textwidth ? "--max-line-length=".&textwidth : "")'   " Python的Bug，临时修复。
noremap <leader>fc :Autoformat<CR><CR>                                  " 代码格式化快捷键

" CoffeeScript 插件设置
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable     " 代码折叠

" JavaScript 语法高亮
" au FileType javascript call JavaScriptFold()    " enable javascript code folding

" Jade 语法高亮
autocmd BufNewFile,BufRead *.jade set filetype=jade             " Jade文件设置，解决与其它语法高亮冲突

" 改进的Python语法高亮
let python_highlight_all = 1        "高亮所有Python语法

" Goyo设置
let g:goyo_width = 100
nnoremap <silent> <leader>z :Goyo<cr>       " Goyo快捷键

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()

" CtrlSF搜索
let g:ctrlsf_ackprg = 'ack'                                     " 默认程序为ACK而不是AG
nmap <leader>s <Plug>CtrlSFPrompt
vmap <leader>sv <Plug>CtrlSFVwordExec

" Rust设置
au BufNewFile,BufRead *.rs set filetype=rust
