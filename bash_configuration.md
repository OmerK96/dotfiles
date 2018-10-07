# Bash Configuration
There isn't a lot of configuration for the `.bashrc` file. Some key configurations are the different aliases, the support for colors in man pages, and the improved PS1 variable (the prompt).

__**BEFORE YOU START CHANGING THE `.bashrc` FILE, BACK IT UP!**__

Replace your `.bashrc` file with this [`.bashrc`](dotfiles/.bashrc) configuration file. Feel free to remove stuff you don't need.

It is recommended that you put all of the aliases and functions that will be used by the user, in the file `~/.bash_aliases`. An example (and very simple) one can be found [here](dotfiles/.bash_aliases).

There is one option that I have commented out, and that is the one that appends your history to the shared history file. The reason for that is that when you have 2 shells (in tmux), *while you still can have all of the history shared*, pressing `Up+Enter` won't have the desired effects all of the time. This is mostly a user preference - uncomment if you do want it.