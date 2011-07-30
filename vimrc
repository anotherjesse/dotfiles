filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

syntax on
set background=dark
colorscheme molokai

set statusline=%{fugitive#statusline()}\ %F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

" ,W -> strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,a -> Ack
nnoremap <leader>a :Ack

" ,ft -> fold tag
nnoremap <leader>ft Vatzf

" ,S -> sort css properties
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" ,q -> re-hardwrap paragraphs of text
nnoremap <leader>q gqip

" ,v -> reselect the text that was just pasted
nnoremap <leader>v V`]

" double jj is esc
inoremap jj <ESC>

" ,w -> split horizontal
nnoremap <leader>w <C-w>v<C-w>l
" ,v -> split virtical
nnoremap <leader>v <C-w>s<C-w>j

" ctrl-hjkl to navigate splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
let g:pep8_map='<leader>8'

if has("gui_running") 
  highlight SpellBad term=underline gui=undercurl guisp=Orange 
endif

map <leader>td <Plug>TaskList


" NERD Tree
noremap <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', '.*.pid', '.*\.o']
au Filetype nerdtree setlocal nolist

" from termie
if has("autocmd")
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif

    augroup END

    " Source the vimrc file after saving it
    autocmd bufwritepost vimrc source $MYVIMRC
endif " has("autocmd")


if has('gui_running')
    set cursorline

    if has("gui_gtk2")
        set guifont=Inconsolata\ 11
    else
        set guifont=Menlo:h15
    endif

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
endif
