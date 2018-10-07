# Tmux Configuration
Tmux allows us to run several terminals side by side, and manage them easily. The configuration for tmux is quite lengthy and also self-explanatory, so I will just reference the [file](dotfiles/.tmux.conf), but an important thing to remember here is this - **always run tmux with the flag "-2"**. This flag add support for 256-bit colors for tmux, so we can have pretty things in our terminal (vim will really hate you if you don't do this...).

Before running tmux, make sure to put the [`.tmux-main-ip.sh`](dotfiles/.tmux-main-ip.sh) script in your home directory, and giving it running permissions. It will display your IP (assuming your interface name is `ens33`) on your left status bar.
