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

## Aliases and Functions

### file path helpers
```
/* all of the following commands allow you to specify a directory
 * argument to go to a subdirectory.
 * i.e. "drive school" takes you to the school dir in onedrive
 */
icloud // go to icloud folder
drive // go to onedrive folder
docs // go to "documents" directory in onedrive folder
repos // go to the repos folder in the home dir
```

### repo setup
```
/* helpers to make repos work with vim and vim plugins */
reposet // will create ycm and ctags config files in current repo
repoinit // does repo set but also creates src, inc, bin folders,
         // main.c, main.h, and Makefile
```

## Vim Shortcuts

### window management
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
[c // jump to previous chunk
]c // jump to next chunk
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

### commenting
```
<Leader>co // create a new line above current line and create a comment with the cursor in the middle
[count]<Leader>cc // comment the current/selected line
[count]<Leader>cu // uncomment the current/selected line
[count]<Leader>c<Space> // toggle commented-ness
[count]<Leader>cs // comment with a sexily formatted block
<Leader>c$ // comment from cursor to end of line
<Leader>cA // adds comment to the end of the line and places cursor in the middle
```

### googling/searching
```
:Go query // will open an internet browser to a google search of "query"
<K> // will open the man page for whatever's under the cursor
```

