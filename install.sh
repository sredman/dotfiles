#!/bin/zsh

# filename: install.sh
#
# created by: Graham Zuber
# github: github.com/gzuber
# email: grahamzuber@gmail.com
#
# created: 02.01.2017
# last modified: Mon Jan  2 15:51:29 2017
# 
# description:
#
# will use variable DOT_FILEPATH
# to correctly set symlinks for
# dotfiles throughout the user's
# home directory. 


# filepath to dotfiles repo (make
# sure to use $HOME and not ~/)
DOT_FILEPATH="$HOME/OneDrive/repos/dotfiles"

# utility vars
CHECK_MARK="\xE2\x9C\x94"
X_MARK="\xE2\x9C\x98"

# all files and paths
# these should be the same length
# each entry corresponds with entry
# in other array at same index.
NEW_LINKS=("/.gitignore_global" "/.zshrc" "/.vim/vimrc" "/.oh-my-zsh/custom/aliases.zsh" "/.oh-my-zsh/custom/functions.zsh" "/.oh-my-zsh/custom/completion.zsh" "/.oh-my-zsh/custom/correction.zsh" "/.oh-my-zsh/custom/misc.zsh" "/.oh-my-zsh/custom/schemes/schemes/gzuber.itermcolors" "/.oh-my-zsh/custom/themes/gzuber.zsh-theme")
DOT_FILES=("/dot_gitignore_global" "/dot_zshrc" "/dot_vim/vimrc" "/dot_oh-my-zsh/custom/aliases.zsh" "/dot_oh-my-zsh/custom/functions.zsh" "/dot_oh-my-zsh/custom/completion.zsh" "/dot_oh-my-zsh/custom/correction.zsh" "/dot_oh-my-zsh/custom/misc.zsh" "/dot_oh-my-zsh/custom/schemes/schemes/gzuber.itermcolors" "/dot_oh-my-zsh/custom/themes/gzuber.zsh-theme")

# make sure folders are all there
printf "creating paths   "
for (( i=0; i<${#NEW_LINKS[@]}; i++ ));
do
    JUST_PATH="$(dirname $HOME${NEW_LINKS[$i]})"
    MKDIR_OUTPUT="$(mkdir -p $JUST_PATH 2>&1)"
done

# make sure there weren't errors with
# creating paths
sleep 0.5
if [ "${MKDIR_OUTPUT}" = "" ]
then
    echo "${CHECK_MARK}"
else
    echo "${X_MARK}"
fi

# install links
# for i in {0..8}
for (( i=0; i<${#NEW_LINKS[@]}; i++ ));
do
    printf "linking %s  " "${NEW_LINKS[$i]}"
    LN_OUTPUT="$(ln -sf ${DOT_FILEPATH}${DOT_FILES[$i]} $HOME${NEW_LINKS[$i]} 2>&1)"
    sleep 0.5
    if [ "${LN_OUTPUT}" = "" ]
    then
        echo "${CHECK_MARK}"
    else
        echo "${X_MARK}"
    fi
done

