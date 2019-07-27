call plug#begin('~/.vim/plugged')

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

" The color scheme for a true DOVAHKIIN 
":color alduin
:colorscheme sublimemonokai
":let g:sublimemonokai_term_italic = 1

" 80-character line
:set cc=80


" Fix paren/bracket matching highlights
":let g:alduin_Shout_Aura_Whisper = 1

" Some magic for syntax plugins like Haskell-Vim and Syntastic
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

autocmd FileType python :hi semshiSelected ctermfg=231 ctermbg=235 cterm=bold
hi Comment ctermfg=243 cterm=italic
hi MatchParen ctermfg=231 ctermbg=235 cterm=bold

" Semshi commands
nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>
nmap <silent> <leader>rr :Semshi rename<CR>

function! PyCommentChunk()
  let colnum = col('.')
  let lineNum = line('.')
  :normal j
  :exe (":normal " . colnum . "i#")
  :exe cursor(lineNum,colnum+1)
endfunction

nmap <silent> <leader>c :execute PyCommentChunk()<CR>


" Pathogen load
execute pathogen#infect()
