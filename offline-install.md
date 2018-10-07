# Offline Installations

Installing missing packages offline is a very simple procedure. The steps are:
1. remove everything from `/var/cache/apt/archives`.
2. run `sudo apt install -d <pkg>`.
3. copy all of the `.deb` files.
4. run `sudo dpkg -i *` in the directory of the package.