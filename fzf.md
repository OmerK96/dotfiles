# Fzf

## Installation
Fzf is a fuzzy file finder. It will allow us to find files and select them super fast. Installing it requires us to download 2 things: its repository, and a binary file (*Well, you can compile it yourself with go...*).

First, let's clone the repository:
```console
git clone https://github.com/junegunn/fzf.git
```

After that, we will download the binary of fzf. From a computer with an internet connection, run:
``` console
wget -O - https://github.com/junegunn/fzf-bin/releases/download/0.17.4/fzf-0.17.4-linux_amd64.tgz | tar -xzf -
```
This will create a binary called `fzf`. Place that binary inside a directory called `bin` in the fzf repo (create it if it does not exist), and then run `./install`. Make sure to press `Y` to every question.

## Usage
So what are the things we can do? The `fzf` binary can read a list of items from `STDIN`, and write the selected item to `STDOUT`:  
```console
$ find * -type f | fzf > selected
```
Installing fzf adds and overrides some key bindings:
* `Ctrl-t`: Paste the selected files and directories onto the command line.
* `Ctrl-r`: Paste the selected command from history onto the command line.
    * If you want to see the commands in chronological order, press `Ctrl-r` again which toggles sorting by relevance.
* `Alt-C`: Cd into the selected directory.

## Flags
There are several flags we can pass to `fzf`. The most useful ones are:
* `-m`: Select multiple items. Use `tab` and `shift-tab` to select.
* `--reverse`: Have the search bar be at the top (instead of bottom).
* `--border`: Have a border for the `fzf` window.

Obviously, running `fzf -h` and `man fzf` will help you out a lot.

## Search 
The search terms you can insert are as follows:

Token     | Match type | Description
----------|----------------------------|------------
`sbtrkt`  | fuzzy-match                | Items that match `sbtrkt`
`'wild`   | exact-match (quoted)       | Items that include `wild`
`^music`  | prefix-exact-match         | Items that start with `music`
`.mp3$`   | suffix-exact-match         | Items that end with `.mp3`
`!fire`   | inverse-exact-match        | Items that do not include `fire`
`!^music` | inverse-prefix-exact-match | Items that do not start with `music`
`!.mp3$`  | inverse-suffix-exact-match | Items that do not end with `.mp3`

## Environment Variables
* `FZF_DEFAULT_COMMAND`: Default command to use when input is tty.
* `FZF_DEFAULT_OPTS`: Default options.

## `fzf-tmux` Script
A bash script that opens fzf in a tmux pane:
```console
; In case you forget:
fzf-tmux --help

git branch | fzf-tmux -d 15
cat /usr/share/dict/words | fzf-tmux -l 20% --multi --reverse
```

## Fuzzy Completion for Bash
Fuzzy completion for files and directores can be triggered if the word before the cursor ends with the trigger sequence which is by default `**`.

### Files and Directories
```console
; Files under current directory
; - You can select multiple items with TAB key
vim **<TAB>

; Files under parent directory
vim ../**<TAB>

; Files under parent directory that match `fzf`
vim ../fzf**<TAB>

; Files under your home directory
vim ~/**<TAB>


; Directories under current directory (single-selection)
cd **<TAB>

; Directories under ~/github that match `fzf`
cd ~/github/fzf**<TAB>
```

### Process IDs
Fuzzy completion for PIDs is provided for kill command. In this case
there is no trigger sequence, just press tab key after kill command.

```console
; Can select multiple processes with <TAB> or <Shift-TAB> keys
kill -9 <TAB>
```
### Host Names

For ssh and telnet commands, fuzzy completion for host names is provided. The names are extracted from /etc/hosts and ~/.ssh/config.

```console
ssh **<TAB>
telnet **<TAB>
```
### Environment Variables / Aliases
```console
unset **<TAB>
export **<TAB>
unalias **<TAB>
```

## Bash changes
By installing fzf, the following line will be added to your `.bashrc`:
`[ -f ~/.fzf.bash ] && source ~/.fzf.bash`, which will enable all of the above interactions. However, we can improve even that! Add the following lines to your `.bashrc`:
```sh
export FZF_DEFAULT_COMMAND='ag -l --hidden --nocolor --ignore .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
```