"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1

Plug 'rust-lang/rust.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vhdirk/vim-cmake'

Plug 'tyrannicaltoucan/vim-deep-space'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" THEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set termguicolors
colorscheme deep-space
let g:deepspace_italics=1
let g:airline_theme='deep_space'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRANSPARENCY
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
