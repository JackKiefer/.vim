" The colorscheme for a true DOVAHKIIN 
:color alduin

" Some magic for syntax plugins like haskell-vim
syntax on

" Get those line numbers
:set number

" I'm a fan of highlighted current lines
:set cursorline

" Sane indentation
:filetype on
filetype plugin indent on
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Fix for Haskell indentation
autocmd FileType haskell setlocal smartindent

" Better scrolling
nnoremap J gjzz
nnoremap K gkzz
nnoremap j gj
nnoremap k gk

" Better view-switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" NERD Tree hotkey
map <C-m> :NERDTreeToggle<CR>

execute pathogen#infect()
