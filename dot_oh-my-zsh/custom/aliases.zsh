# filename: aliases.zsh
#
# created by: Graham Zuber
# github: github.com/gzuber
# email: grahamzuber@gmail.com
#
# created: 02.01.2017
# last modified: Mon Jan  2 15:45:10 2017
#
# description: 
#
# custom bash aliases


# program shortcuts
alias emacs='open -a /Applications/Emacs.app/Contents/MacOS/Emacs $1'
alias emacsd='open -a /Applications/Emacs.app/Contents/MacOS/Emacs $1 --args -debug-init'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl .'

# git shortcuts
alias mergemaster='if [ -n "$1" ]; then BRANCH="$1"; else BRANCH="dev"; fi; git checkout $BRANCH && git push && git checkout master && git merge $BRANCH && git push && git checkout $BRANCH'
alias mergeprod='if [ -n "$1" ]; then BRANCH="$1"; else BRANCH="master"; fi; git checkout $BRANCH && git push && git checkout master-production && git merge $BRANCH && git push && git checkout $BRANCH'

# assignment shortcuts
alias copy='scp -r ./* u:~/cs4400/5_shell/'
