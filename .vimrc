" General Settings
filetype indent on
syntax on
set hlsearch
set nowrap

set tabstop=8
set smartindent

" Plugins, etc.

"""""""""""""""
" My mappings "
"""""""""""""""
map <space> \

" Allows jumping straight to mark via <leader> + apostrophe rather than
" reaching for the backtick
noremap <leader>' `

" Allows using <c-h>, <c-j>, <c-k>, and <c-l> to resize windows
nnoremap <c-h> <c-w><
nnoremap <c-j> <c-w>-
nnoremap <c-k> <c-w>+
nnoremap <c-l> <c-w>>

" Allows quick buffer switching
nnoremap <leader>b :ls<CR>:b<Space>

" Clears search
nnoremap <leader>c :noh<CR>
