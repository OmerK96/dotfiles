# Ubuntu Setup
The following guide refers to installations on Ubuntu 18.04 LTS 64bit.  
It *could* potentially work on your machine, but there is no guarantee of it.

## Ifconfig
Ubuntu 18.04 does not come with `ifconfig` installed by default. The reason is that `ifconfig` is deprecated, and the usage of the `ip` command is recommended. However, for convenience, we will still install it:

```console
# apt install net-tools
```

**NOTE**: Please go [here](./ip-guide.md), to learn how to use the `ip` command.

## Common packages
We will need to install some packages in our work environment. If any package is missing, please go [here](./offline-install.md) for instructions how to download it. The packages are:

```console
# apt install build-essential
# apt install tmux
# apt install git
# apt install wireshark
# apt install openssh-server
# apt install open-vm-tools-desktop
# apt install python
# apt install python-dev
# apt install python3-dev
# apt install libncurses5-dev
# apt install meld
# apt install silversearcher-ag
```

After installing `open-vm-tools-desktop`, you need to restart VMWare to enforce the changes.

For C developers, extra dependencies are required:
```console
# apt install cmake
# apt install ctags
# apt install clang
```

Furthermore, we will need to download the following source tarballs for compiling some programs (The ones in the repo are not new enough):
* vim

## Nightlight
Nightlight is a feature that reduces blue light at night. It is highly recommended that you turn nightlight on.  
To do it, go to System Settings-> Devices-> Displays, and turn Night light on.