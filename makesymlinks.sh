#!/bin/bash
################
# makesymlink.sh -- Thanks to michaeljsmalley for providing this method!
# Creates symlinks from home directory to dotfiles located in ~/dotfiles
################

dir=~/dotfiles		# location of dotfiles
olddir=~/dotfiles_old		# location of backup/old dotfiles
files="bashrc vimrc Xresources"	# files that require symlinks

echo "Making $olddir to store existng dotfiles..."
mkdir -p $olddir
echo "done."

echo "Moving existing dotfiles to $olddir..."
for file in $files; do
	mv ~/.$file ~/dotfiles_old/
done
echo "done."

echo "Changing directory to $dir and creating symlinks..."
cd $dir
for file in $files; do
	ln -s $dir/$file ~/.$file
done
echo "done."
