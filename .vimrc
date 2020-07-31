call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'airblade/vim-gitgutter'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()

set number

set hidden
set history=100

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
filetype on
filetype indent on
filetype plugin indent on

noremap <F3> :Autoformat<CR>
map <C-n> :NERDTreeToggle<CR> n
let NERDTreeShowHidden=1


colorscheme elflord

hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
