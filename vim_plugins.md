# Vim Plugins
The bread and butter of vim is the ability to add plugins that will **drastically** change its behaviour. Some of them allow for incredible working efficiency. We will start by installing `vundle`, and then installing other plugins afterwards:

## Vundle
Vundle is a vim plugin manager. In a normal environment, we would be able to install all plugins from the internet and vundle will fetch it for us. However, for people without an active internet connection on their work environment, we will have to download each plugin locally from another computer. Let's start by installing vundle.

1. Make the following directory `~/.vim/bundle`
2. Download the vundle repo from https://github.com/VundleVim/Vundle.vim
3. Copy it to the directory created at step 1.
4. Add the following lines to your `.vimrc` file:
    ```vim
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " Plugins go here
    " Install vundle
    Plugin file:///home/user/.vim/bundle/Vundle.vim
    call vundle#end()
    filetype plugin indent on
    ```
5. Open `vim` and run `:PluginInstall`

After installing vundle, we can start installing other plugins. Have them all be in a certain directory in your computer, create a repo for them (if it is a zipped download) and run `:PluginInstall` again.

## Plugins
### GitGutter
Shows new, removed and edited lines according to git.  
URL: https://github.com/airblade/vim-gitgutter  
`vimrc` changes:
```vim
set signcolumn=yes
set updatetime=100
```

### ALE
A smart linter. Go to the link below to see which extra tools you need to download.  
URL: https://github.com/w0rp/ale  
`vimrc` changes:
```vim
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
```

### Lightline
A prettier status line.  
URL: https://github.com/itchyny/lightline.vim

### Lightline+ALE
Integration of the ALE plugin to show the errors and warnings in the status line.  
URL: https://github.com/maximbaz/lightline-ale  
`vimrc` changes (*note*: copy AS IS - vim dictionaries are stupid):
```vim
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
```

### Easymotion
Easily move to anywhere in the file.  
URL: https://github.com/easymotion/vim-easymotion  
`vimrc` changes:
```vim
nmap <Leader>a <Plug>(easymotion-bd-w)
```

### Python-PEP8-Indent
Vim's default python indentation rules suck. This plugin fixes them.  
URL: https://github.com/Vimjas/vim-python-pep8-indent  
`vimrc` changes:
```vim
let g:python_pep8_indent_multiline_string = -1
let g:python_pep8_indent_hang_closing = 0
```

### Fzf.vim
Improved integration between fzf and vim.  
URL: https://github.com/junegunn/fzf.vim.git  
`vimrc` changes:
```vim
" You can change it to whatever key you want
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>t :Tags<CR>
```

### Colorscheme
A much prettier vim.  
Installing the colorscheme just requires us to download the colorscheme, copying it to `~/.vim/colors` and registering it.  
URL: https://github.com/altercation/vim-colors-solarized  
`vimrc` changes:
```vim
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
```

### YouCompleteMe
Smart auto completion.  
Probably useful for C developers, or for people not using PyCharm.
*This is quite a pain in the ass*  
URL: https://github.com/Valloric/YouCompleteMe  

Installation steps:
1. in the cloned repo, run the following git command to clone all of the repo's dependencies: `git submodule update --init --recursive`.
2. Install YCM with vundle (it should fail - it's OK).
3. Create a temp directory and cd into it. For reference, we will call it `temp` following this line.
4. Inside `temp`, run `cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp -DUSE_SYSTEM_LIBCLANG=ON`.
5. Now run `cmake --build . --target ycm_core --config Release`.
6. In vim, run `:YcmRestartServer`.
    * If this fails because of different python version, add the following line to your `vimrc`: `let g:ycm_server_python_interpreter='<python>'` where `<python>` is the path to the python interpreter you used to build YCM.
7. Copy the [.ycm_extra_conf.py](./.ycm_extra_conf.py) file to your home directory.
8. Add to your `vimrc`:
    ```vim
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
    let g:ycm_key_list_select_completion = ['<TAB>', '<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-p>', '<Up>']
    ```

### UltiSnips
Vim snippets manager. Does not contain any actual snippets!  
URL: https://github.com/SirVer/ultisnips  
`vimrc` changes:
```vim
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
```

### Vim-Snippets
The actual snippets. You can add your own (be sure to add them to the UltiSnips directory).  
URL: https://github.com/honza/vim-snippets  