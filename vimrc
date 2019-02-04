" The color scheme for a true DOVAHKIIN 
:color alduin

" Fix paren/bracket matching highlights
:let g:alduin_Shout_Aura_Whisper = 1

" Some magic for syntax plugins like Haskell-Vim
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

" Fix for Markdown indentation
au FileType markdown setl sw=4 sts=4 et

nnoremap H J

" Better scrolling 
nnoremap J gjzz
nnoremap K gkzz
nnoremap j gj
nnoremap k gk

" Autocorrect spelling mistake to first choice
nnoremap z1 z=1<CR><CR>

" Better view-switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" NERD Tree hotkey
map <C-m> :NERDTreeToggle<CR>

" Make command
map <C-c> :make!<CR>


function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " Equation definition. Look for "\begin{equation}[anything]\end{equation}"
    syn region math start='\\begin' end='\\end'

    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

" Auto recompilation of markdown files with F3
autocmd FileType markdown nmap <F3> <ESC>:w<CR> :!pand '%:t'<CR>:redraw<CR>

" Enable spellcheck
:set spell 
hi clear SpellBad
hi SpellBad cterm=underline

" Add writing mode command and shortcut
:command WriteMode Goyo 80 | PencilSoft
map <C-p> :WriteMode<CR>

execute pathogen#infect()

" Python highlighting tweaks
:let g:python_highlight_all = 1
:let g:python_highlight_space_errors = 0
:let g:python_highlight_indent_errors = 0
:hi pythonStatement guifg=#878787 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=bold
:hi pythonInclude guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=bold
:hi pythonImport guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=bold
:hi pythonFunction guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
:hi Type guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=bold

