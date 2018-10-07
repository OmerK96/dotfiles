# Vim Configuration
The `vimrc` file lets us modify the behavior of vim for our own taste. The `vimrc` provided here is merely a recommendation - if you wish to change something, please do. For the meantime, ignore all of the parts after the `""" Plugins` line, as they will be covered in the next section.

The [file](./.vimrc) itself contains some useful keys and configs, let's overview some of them (`leader='\'`):
* Tag searching in `/usr/include` (you have to create the tags yourself).
* `<leader>w` - save the file.
* `:W` - sudo save (such as when opening a root file).
* Show both relative line numbers and current line number.
* Smart searching.
* Search in visual mode using `*` and `#`.
* No swap files.
* Using 4 spaces instead of tabs.
* Wrapping (commented out in the original vimrc, you can turn it on).
* Iterating over lines with `right`, `left`, `h`, or `l`.
* Auto indentation
* Window movement with `<C-j>`, `<C-k>`, `<C-h>` and `<C-l>`.