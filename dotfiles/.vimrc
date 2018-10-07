set nocompatible

"filetype plugin indent on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
" Support fzf inside vim
set rtp+=/home/user/.fzf
call vundle#begin()
" Plugins
" Vundle
Plugin 'file:///home/user/.vim/bundle/Vundle.vim'
Plugin 'file:///home/user/vim_plugins/vim-gitgutter'
Plugin 'file:///home/user/vim_plugins/ale'
Plugin 'file:///home/user/vim_plugins/lightline.vim'
Plugin 'file:///home/user/vim_plugins/lightline-ale'
Plugin 'file:///home/user/vim_plugins/vim-easymotion'
Plugin 'file:///home/user/vim_plugins/YouCompleteMe'
Plugin 'file:///home/user/vim_plugins/vim-python-pep8-indent'
Plugin 'file:///home/user/vim_plugins/fzf.vim'
Plugin 'file:///home/user/vim_plugins/ultisnips'
Plugin 'file:///home/user/vim_plugins/vim-snippets'

call vundle#end()
filetype plugin indent on

""" vimrc
"" General config
" Reload the file if someone changed it outside of vim
set autoread
" Map the <leader> key to \. The key is used a lot, so choose something you 
" like
let mapleader = '\'
" Don't redraw the screen when performing macros
set lazyredraw
" Enable syntax highlighting
syntax enable
" Search for tags in /usr/include
set tags+=/usr/include/**/tags

"" Saving
" Save with leader
nmap <leader>w :w!<cr>
" Sudo save
command W w !sudo tee % > /dev/null
" Remove backups
set nobackup
set nowb
set noswapfile

"" Command line
" Height of the command line
set cmdheight=2
" Wild completion in the command line
set wildmenu
" Don't show trash when searching for files
set wildignore=*.o,*~,*.pyc,*/.git/*

"" Screen visuals
" See the ruler - The line, column, and overall position in the file
set ruler
" Always have a status line
set laststatus=2
" Show both line number on current line, and relative line numbers for other
" lines
set number relativenumber

"" Search
" Ignore case sensitivty
set ignorecase
" If the search contains only upper case letters, perform case sensitive search
set smartcase
" Highlight the searches
set hlsearch
" Highlight semi complete searches (when we are still typing the search)
set incsearch
" Search in visual mode too (Uses a function defined below)
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Search forward with space
map <space> /
" Search backwards with CTRL-space
map <c-space> ?
" Clear searches
map <silent> <leader><cr> :noh<cr>

"" Brackets
" Show matching brackets
set showmatch
" How many tenths of a second to blink
set mat=2

"" Bells - we just remove error bells, they make annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" File metadata
" File encoding
set encoding=utf8
" File format
set ffs=unix,dos,mac

"" Tab
" Expand tabs to spaces
set expandtab
" Add/delete tabs normally (even though they are spaces)
set smarttab
" Set auto-indention to 4 spaces
set shiftwidth=4
" Set tab length to 4 spaces
set tabstop=4
set softtabstop=4

"" Wrapping
" Display a column for the line break
set colorcolumn=80
" Pressing right, left, h, or l allows us to move to the next or previous line
set whichwrap+=<,>,h,l
" Wrap lines longer than the window (only in vim, not in the actual file!)
"set wrap

"" Indentation
" Auto indent (when pressing <CR> for example)
set ai
" Smart indenting for C languages (remove if it messes with python)
set cindent
" Backspace will correctly indent
set backspace=eol,start,indent

"" Windows
" Window movement with CTRL-movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"VisualSelection function
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""" Plugins
" GitGutter
set signcolumn=yes
set updatetime=100

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
set noshowmode

" Lightline (+ALE)
let g:lightline = {
\ 'colorscheme': 'powerline',
\ }

let g:lightline.component_expand = {
\ 'linter_checking': 'lightline#ale#checking',
\ 'linter_warnings': 'lightline#ale#warnings',
\ 'linter_errors': 'lightline#ale#errors',
\ 'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
\ 'linter_checking': 'left',
\ 'linter_warnings': 'warning',
\ 'linter_errors': 'error',
\ 'linter_ok': 'left',
\ }

let g:lightline.active = {
\ 'left': [['mode', 'paste'], ['filename', 'modified'], ['filetype']],
\ 'right': [['lineinfo'], ['percent'], ['readonly', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']],
\ }

" Easymotion
nmap <Leader>a <Plug>(easymotion-bd-w)

" Python-PEP8-Indent
let g:python_pep8_indent_multiline_string = -1
let g:python_pep8_indent_hang_closing = 0

" Fzf.vim
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>t :Tags<CR>

" Solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" YouCompleteMe
" Add this line only if ycmd was compiled with python2!
" let g:ycm_server_python_interpreter='/usr/bin/python2'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf='/home/user/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-p>', '<Up>']

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"