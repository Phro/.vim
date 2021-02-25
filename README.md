# (Neo)Vim Configuration File

## Installation
*Note*: this config will usually be loaded as a submodule to my dotfiles
directory. To install just the neovim config, recursively clone into
`~/.config/nvim`:

```
$ git clone --recurse-submodules git@github.com:phro/.vim
```

## To do
- Implement cleaner folding in the init.vim
  - Add blank lines to the previous line's fold level
  - Add `/end.*/` statements to the previous line's fold level
- Improve syntax highlighting of comments in init.vim
  - Color any phrase which precedes a colon
  - Specify what summary text should appear in a closed fold
- Reorganize sections to be more intuitive
- Fix bug: when a terminal is opened, insert mode is not begun
- Fix bug: when deleting whitespace after the beginning of a comment, the
  following newline is also deleted
- Fix bug: in vimtex, when starting auto-background compiling, the pdf document
  is opened twice for viewing (yet only once thereafter)
- The highlight color of parentheses contrasts poorly with the red foreground
- Many TeX snippets appear to be missing from before (perhaps they were not
  added to the repository?)
