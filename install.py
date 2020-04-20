#!/usr/bin/env python3

"""
Filename    : install.py
Author      : Simon Redman
Date        : 17 May 2017
Description :  
"""

from enum import Enum
import ntpath # ntpath is more reliable than os.path, apparently
import os
import sys

def add_bash_linkings():
  DOT_FILES['dot_bashrc'] = '.bashrc'
  DOT_FILES['dot_bashrc_d'] = '.bashrc.d'
  
def add_zsh_linkings():
  DOT_FILES['dot_zshrc'] = '.zshrc'
  DOT_FILES['dot_oh-my-zsh/custom/aliases.zsh'] = '.oh-my-zsh/custom/aliases.zsh'
  DOT_FILES['dot_oh-my-zsh/custom/functions.zsh'] = '.oh-my-zsh/custom/functions.zsh'
  DOT_FILES['dot_oh-my-zsh/custom/completion.zsh'] = '.oh-my-zsh/custom/completion.zsh'
  DOT_FILES['dot_oh-my-zsh/custom/correction.zsh'] = '.oh-my-zsh/custom/correction.zsh'
  DOT_FILES['dot_oh-my-zsh/custom/misc.zsh'] = '.oh-my-zsh/custom/misc.zsh'
  DOT_FILES['dot_oh-my-zsh/custom/schemes/schemes/gzuber.itermcolors'] = '.oh-my-zsh/custom/schemes/schemes/gzuber.itermcolors'
  DOT_FILES['dot_oh-my-zsh/custom/themes/gzuber.zsh-theme'] = '.oh-my-zsh/custom/themes/gzuber.zsh-theme'
  # Just how many configuration files does zsh need?

"""
Return a set containing all the new directories to be created
Expects a dictionary formatted as DOT_FILES.values(), which a list of every link destination
"""
def extract_new_directories ( dot_file_destinations ):
  to_return = set(); # Python bows to the need to declare some types
  
  for destination in dot_file_destinations:
    path, filename = ntpath.split(destination);
    to_return.add(path);
    
  to_return.remove('')
  return to_return
    

"""
Differentiate between different shells which, among other things, have different settings files
"""
class Shell(Enum):
  BASH = 1
  ZSH  = 2 # It should be obvious to all that zsh is number two
  
"""
Exit with non-arbritrarily-random numbers
"""
class ExitCodes(Enum):
  SUCCESS = 0
  ENVIRON_ERROR = 1

# Mapping of source files (In this repo) to destination links
DOT_FILES = {
                'dot_gitignore_global' : '.gitignore_global',
                       'dot_vim/vimrc' : '.vim/vimrc',
                       'dot_tmux.conf' : '.tmux.conf'
            }

# Will be populated with directories to create as a result of the call to extract_new_directories
NEW_DIRECTORIES = []

# The folder where the links will be created
INSTALL_DIR = ""

# Set up environment
PWD = os.environ.get('PWD')
HOME = os.environ.get('HOME')
SHELL = os.environ.get('SHELL')

if (PWD is None):
  sys.stderr.write("PWD environment variable is not set. Please set this to the current path")
  exit(ExitCodes.ENVIRON_ERROR)
  
if (HOME is None):
  sys.stderr.write("HOME is not set. Please set this to a directory where you would like the dotfiles installed (probably your user's home directory")
  exit(ExitCodes.ENVIRON_ERROR)

if (os.environ.get('DOT_FILEPATH') is not None):
  DOT_FILEPATH = os.environ.get('DOT_FILEPATH')
else:
  print("Using default DOT_FILEPATH as " + PWD)
  print("If this is not the correct directory, please set the DOT_FILEPATH environtment variable")
  DOT_FILEPATH = PWD
  
INSTALL_DIR = HOME
  
# Python 3 handles Unicode!
CHECK_MARK="✔"
X_MARK="✘"

# Add shell-specific linkings -- If you want everything to link in set $SHELL to "all"
if (SHELL == "all"):
  add_bash_linkings()
  add_zsh_linkings()
elif (SHELL.endswith("bash")):
  add_bash_linkings()
elif (SHELL.endswith("zsh")):
  add_zsh_linkings()
else:
  print(SHELL +  " is not set or not supported. Skipping shell linkings")


NEW_DIRECTORIES = extract_new_directories (DOT_FILES.values())

# Create any directories which need to be created
for directory in NEW_DIRECTORIES:
  path = INSTALL_DIR + "/" + directory
  if not os.path.lexists(path):
    # Stackoverflow points out that there is a race between checking and creating the directory
    # if the directory is created after checking but before creating. Don't do that.
    print("Creating " + directory)
    os.makedirs(path)

# Finally create the links
for dot_file in DOT_FILES.keys():
  src = DOT_FILEPATH + "/" + dot_file
  dest = INSTALL_DIR + "/" + DOT_FILES[dot_file]
  
  if os.path.lexists(dest):
    print("Refusing to trample " + dest)
  else:
    print("Creating link " + src + " -> " + dest)
    os.symlink(src, dest)
