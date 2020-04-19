""" 键位绑定
""" Author: Kesco Lin
""" Date: 2020-04-09

" 修改Leader键
let mapleader = "'"

" 文件浏览器
let g:nnn#set_default_mappings = 0
noremap <silent><leader>nn :NnnPicker<CR>
noremap <silent><leader>nc :NnnPicker '%:p:h'<CR>
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-]>': 'vsplit' }
" LeaderF
let g:Lf_ShortcutF = ""
let g:Lf_ShortcutB = ""
noremap <silent><leader>ff :Leaderf file<CR>
noremap <silent><leader>ft :Leaderf function<CR>
noremap <silent><leader>fb :Leaderf buffer<CR>
noremap <silent><leader>fe :Leaderf mru<CR>
