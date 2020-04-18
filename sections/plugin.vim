""" 插件设置
""" Author: Kesco Lin
""" Date: 2020-04-12

" 文件管理器
let g:nnn#layout = {'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug'}}
" LeaderF模糊搜索
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b8", 'right': "\ue0be", 'font': 'Iosevka' }
let g:Lf_PreviewResult = {
            \ 'File': 1,
            \ 'Buffer': 1,
            \ 'Mru': 1,
            \ 'Tag': 1,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 1,
            \ 'Colorscheme': 0,
            \ 'Rg': 0,
            \ 'Gtags': 1
            \}
" 状态栏设置
let s:statusSymbols = {
      \ 'separator':    { 'left': "\ue0b8", 'right': "\ue0be" },
      \ 'subseparator': { 'left': "\u2572", 'right': "\u2572" },
      \ }
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \ 'component_type': {'buffers': 'tabsel'},
      \ 'separator':    s:statusSymbols.separator,
      \ 'subseparator': s:statusSymbols.subseparator,
      \ }
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#filename_modifier = ':p:.'
set laststatus=2
set showtabline=2
set noshowmode

" Markdown Preview
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
