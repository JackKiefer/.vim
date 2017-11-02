" The colorscheme for a true DOVAHKIIN 
:color alduin

" Some magic for syntax plugins like haskell-vim
syntax on

" Sane indentation
filetype plugin indent on
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Better scrolling
nnoremap J gjzz
nnoremap K gkzz
nnoremap j gj
nnoremap k gk

" NERD Tree hotkey
map <C-n> :NERDTreeToggle<CR>

execute pathogen#infect()
