#!/bin/bash

# Lang (support for unicode)
export LANG=en_IN.utf8
export LC_ALL=en_IN.utf8
export LC_CTYPE=en_IN.utf8

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# setup NVM (node version manager)
export NVM_DIR="$HOME/.nvm"                                                                                                                                                                                                               
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm                                                                                                                                                                        
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# setup symbolic links
export DOTFILES_DIR="$HOME/dotfiles"
[ -s "$DOTFILES_DIR/scripts/setup_symlinks.sh" ] && \. "$DOTFILES_DIR/scripts/setup_symlinks.sh" 

# cli-tools setup
[ -s "$DOTFILES_DIR/scripts/setup_cli_tools.sh" ] && \. "$DOTFILES_DIR/scripts/setup_cli_tools.sh" 
