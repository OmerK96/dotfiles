# Git Configuration
There are several parts to git's configuration. The first is to configure data about ourselves and our preferences, and the second is adding useful aliases.

## User configurations
Run the following commands:
```console
$ git config --global user.email "you@example.com"
$ git config --global user.name "Your Name"
$ git config --global core.editor vim
$ git config --global merge.tool meld
```
You can, of course, change the editor and merge tool to your preference.

## Aliases
Aliases allow us to use different names for various common git commands. In order to add aliases, we can either do it via the command line like the previous configurations, or edit the configuration file directly.  
The first method, which is slower, can be done like this:
```console
git config --global alias.<alias> <command>
```

The second method just requires us to add a tag, and some aliases:
```console
[alias]
    <alias> = <command>
```

I will use the second form for easy copy-pasting, but feel free to use the first if you are not comfortable with *editing text files*.

We will add some useful ones:
```console
; Basic shortcuts
st = status -s
cl = clone
ci = commit
co = checkout
br = branch
dc = diff --cached
r = reset
sl = stash list
si = stash push
so = stash pop


; List commits in short form, with colors and branch/tag annotations
ls = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate

; List commits showing changed files
ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat

; List oneline commits showing relative dates
lsd = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative


; See all the commits related to a file, with the diff of the changes
flog = log -u


; Show modified files in last commit
dl = "!git ll -1"

; Show a diff last commit
dlc = diff --cached HEAD^

; Show content of a commit given a revision
dr  = "!f() { git diff "$1"^.."$1"; }; f"


; Grep your entire codebase for a string
gr = grep -Ii


; List all aliases
la = "!git config -l | grep alias | cut -c 7-"
```