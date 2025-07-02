" single command installation from https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'

call plug#end()

"
" Basic
"

let mapleader=" "

syntax on
filetype on

set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4

" cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"
" Plugins configs
"

" file explorer
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" scheme
colorscheme gruvbox
set background=dark

" outline view
nnoremap <leader>ot :TagbarToggle<CR>

" fzf finder
let g:ctrlp_map = '<c-p>'					      " open fzf
let g:ctrlp_working_path_mode = 'ra'		" find nearest ancestor with .git and other root dotfiles
