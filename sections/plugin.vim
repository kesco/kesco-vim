""" 插件设置
""" Author: Kesco Lin
""" Date: 2020-04-12

" 文件管理器
let g:nnn#layout = {'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug'}}
" LeaderF模糊搜索
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
if g:osType == 1
  let g:Lf_StlSeparator = { 'left': "\ue0b8", 'right': "\ue0be", 'font': 'Iosevka Nerd Font' }
else
  let g:Lf_StlSeparator = { 'left': "\ue0b8", 'right': "\ue0be", 'font': 'Iosevka' }
endif
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
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
set noshowmode

" Markdown Preview
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1

" Gitgutter

