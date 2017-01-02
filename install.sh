#!/bin/zsh

# filename: install.sh
# created by: Graham Zuber
# github: github.com/gzuber
# created: 02.01.2017
# last modified: Mon Jan  2 14:46:02 2017
# 
# description:
#
# will use variable DOT_FILEPATH
# to correctly set symlinks for
# dotfiles throughout the user's
# home directory. 
#
# will also use NEW_DIRS to fill
# out any file paths that may not
# be present

# filepath to dotfiles repo (make
# sure to use $HOME and not ~/)
DOT_FILEPATH="$HOME/OneDrive/repos/dotfiles"

# utility vars
CHECK_MARK="\xE2\x9C\x94"
X_MARK="\xE2\x9C\x98"

# all files and paths
DOT_FILES=("/dot_gitignore_global" "/dot_zshrc" "/dot_vim/vimrc" "/dot_oh-my-zsh/custom/alias.zsh" "/dot_oh-my-zsh/custom/completion.zsh" "/dot_oh-my-zsh/custom/correction.zsh" "/dot_oh-my-zsh/custom/misc.zsh" "/dot_oh-my-zsh/custom/schemes/schemes/gzuber.itermcolors" "/dot_oh-my-zsh/custom/themes/gzuber.zsh-theme" "/dot_zshrc")
NEW_LINKS=("/.gitignore_global" "/.zshrc" "/.vim/vimrc" "/.oh-my-zsh/custom/alias.zsh" "/.oh-my-zsh/custom/completion.zsh" "/.oh-my-zsh/custom/correction.zsh" "/.oh-my-zsh/custom/misc.zsh" "/.oh-my-zsh/custom/schemes/schemes/gzuber.itermcolors" "/.oh-my-zsh/custom/themes/gzuber.zsh-theme" "/this-is-test/zshrc")

# make sure folders are all there
for (( i=0; i<${#NEW_LINKS[@]}; i++ ));
do
    JUST_PATH="$(dirname $HOME${NEW_LINKS[$i]})"
    echo $JUST_PATH
    mkdir -p $JUST_PATH
done

# install links
# for i in {0..8}
for (( i=0; i<${#DOT_FILES[@]}; i++ ));
do
    printf "linking %s  " "${NEW_LINKS[$i]}"
    # RM_OUTPUT="$(rm -f $HOME${NEW_LINKS[$i]} 2>&1)"
    LN_OUTPUT="$(ln -sf ${DOT_FILEPATH}${DOT_FILES[$i]} $HOME${NEW_LINKS[$i]} 2>&1)"
    sleep 0.5
    if [ "${LN_OUTPUT}" = "" ] # && [ "${RM_OUTPUT}" = "" ]
    then
        echo "${CHECK_MARK}"
    else
        echo "${X_MARK}"
    fi
done
