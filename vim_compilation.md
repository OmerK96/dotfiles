# Vim Compilation
Starting from now, we will be handling with some more advanced stuff. If you just wish to use vim *without* auto-completion, you can just download vim from `apt`, and don't add the auto-completion plugin from the next section. If you do want it, let's start.  

1. Download the vim repo from https://github.com/vim/vim.git.
2. Install `python3-dev` (with `apt`).
3. Install `libncurses5-dev` (with `apt`).
3. Remove old vim - `sudo apt remove vim vim-runtime gvim`.
4. Go to the vim git directory, and run the following configure line:
    ```console
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-python3interp=yes
                --with-python3-config-dir=/usr/lib/python3.6/config \ #See comment
                --enable-cscope \
                --prefix=/usr/local
    make
    ```
    * Your python config directory might have a machine-specific name (e.g. `config-3.6m-x86_64-linux-gnu`). Put the correct name in the flag.
    * On Ubuntu, allegedly there is an error with installing both python2 and python3 for the auto-completion engine. So just install one of them.

The previous installation compiles vim *without* GUI support. If you want it, you will need to install additional dependencies:
1. libgnome2-dev
2. libgnomeui-dev
3. libgtk2.0-dev
4. libatk1.0-dev
5. libbonoboui2-dev
6. libcairo2-dev
7. libx11-dev
8. libxpm-dev
9. libxt-dev

And add the following flag to the configure line: `--enable-gui=gtk2`. If that somehow does not work, you can try changing it to `--enable-gui=gnome2`.