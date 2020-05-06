""" 键位绑定
""" Author: Kesco Lin
""" Date: 2020-04-09

" 修改Leader键
let mapleader = "'"

" Windows
nnoremap <C-j> <C-W>j                                                                                                                             
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 文件浏览器
let g:nnn#set_default_mappings = 0
nnoremap <silent><leader>nn :NnnPicker<CR>
nnoremap <silent><leader>nc :NnnPicker '%:p:h'<CR>
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-]>': 'vsplit' }
" LeaderF
let g:Lf_ShortcutF = ""
let g:Lf_ShortcutB = ""
nnoremap <silent><leader>ff :Leaderf file<CR>
nnoremap <silent><leader>ft :Leaderf function<CR>
nnoremap <silent><leader>fb :Leaderf buffer<CR>
nnoremap <silent><leader>fe :Leaderf mru<CR>
vnoremap <silent><leader>fg :<C-U><C-R>=printf("Leaderf rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
nnoremap <silent><leader>fr :Leaderf rg --recall<CR>

" Git包括几个插件fugitive、gitgutter和gv
nnoremap <silent><leader>gl :GV<CR>
nnoremap <silent><leader>gb :Git blame<CR>

