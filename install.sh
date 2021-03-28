#!/bin/bash
# ========================================
# install.sh
#
# Dotfile setup, with backup of existing files
# ========================================

# Set variables
# ========================================
dotfiles=~/dotfiles                         # dotfile directory
old_dotfiles=~/dotfiles/dotfiles_old        # existing dotfile backup
files=".bashrc .bashrc.local .bash_profile .vimrc .vim .tmux.conf .dircolors .inputrc .config"       # list of files to symlink


# Create backup
# ========================================
echo -e "Creating a backup directory for existing dotfiles:\n\t--> $old_dotfiles\n"
mkdir -p $old_dotfiles

cd $dotfiles
for file in $files; do
    echo "$file"

    # backup
    if [ -f ~/$file ] || [ -d ~/$file ]; then
        if [ -h ~/$file ]; then
            echo -e "\tBackup: Existing file is a link, no backup created"
        else
            echo -e "\tBackup: --> $old_dotfiles/$file"
            mv ~/$file $old_dotfiles
        fi
    else
        echo -e "\tBackup: --> No existing file to backup"
    fi

    # symlink
    if [ "$(readlink ~/$file)" = "$dotfiles/$file" ]; then
        echo -e "\tSymlink: --> Already linked to dofiles!"
    else
        echo -e "\tSymlink: --> ~/$file"
        ln -s $dotfiles/$file ~/$file
    fi
done

