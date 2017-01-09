# Graham Zuber's dotfiles

*NEW*: install.sh will create and link the necessary files to
make these configs work, all you have to do is change the
directory variable in the shell script and run it.

## Things You'll Want to Change

- install.sh
    - change the dotfiles directory
- dot_zshrc
    - possibly the export ZSH variable
    - path variables
    - goroot setup
- dot_vim/vimrc
    - clang_library_path should point to your libclang
    - change auto header comments to your info

## Vim Shortcuts

```
// get rid of all splits except current one
:only
```

### fuzzy finding files
```
C-p // start fuzzy finding
C-j // navigate down results list
C-k // navigate up results list
```

### navigate buffer
```
M-f // forward a buffer
M-b // back a buffer

// enables nerd tree
M-t
```

### easily align paragraphs
```
// aligns on ‘=‘
M-a= 

// M-a starts alignment, selecting the current paragraph
// = specifies around what to align
// putting ‘*’ before ‘=‘ aligns to every occurrence
// putting a number before ‘=‘ aligns to that occurrence (1st, 2nd, etc…)
// pressing the enter key before ‘*=‘ or whatever flips between left/right/center alignment
// instead of entering a ‘=‘ or ‘ ‘, you can press C-x and enter a regex around which to align
```

### git commands
```
:Gedit // look at last committed version of file?
:Gvsplit
:Gsplit

:Gdiff // look at difference between commited and current, also a way to resolve conflicts
// in 3 way conflict, left is 2 (target, usually master), right is 3 (merging branch, and 1 is middle (soon-to-be resolved file)
:diffget // (add a number to specify where from) get the chunk where cursor is located into current window
:diffput // (add a number to specify where to) put the chunk where cursor is to other window
// diff mode ends when I exit all windows I don’t want to keep open

:Gblame
:Gstatus
:Gcommit
```

### snippets
write something like ‘for’ and then hit tab
you can then tab through, changing values

### ctags
```
C-] // takes you to definition of item under cursor
C-t // takes you back
```

### YouCompleteMe
```
// generates .ycm-extra_conf.py for specifying compiler flags with ycm
:YcmGenerateConfig
// shows you suggestions as you type, hit tab to cycle through
```

#### error navigating
```
M-l // open errors (list) window
M-h // close error window
M-j // cycle to next error
M-k // cycle to prev error
```
#### goto’s
```
M-y // get type
M-n // goto iNclude
M-d // goto Definition
M-r // goto declaRation
```

### clang complete
```
C-space // open list of possible completions for what you’re typing
// add .clang-complete to project root to supply compiler flags for additional libraries (i.e. -I../inc or -ltbb)
```

### a.vim
```
:A  // switched between header and source file
:AS // with split
:AV // with vsplit
:IH // goto file under cursor, S and V options exist for this as well
```

