#!/bin/bash

dotfiles_dir=$(realpath "$0" | sed 's|\(.*\)/.*|\1|')

link_file_or_dir() {
	if [ ! $1 ]; then 
		echo "Source file/dir not passed."
		exit;
	elif [ ! $2 ]; then
		echo "Target file/dir not passed."
		exit;
	fi

	file_source="$dotfiles_dir/$1"
	file_target="$2"
	
	if [ ! -e "$file_target" ]; then
		ln -s $file_source $file_target
		echo "Linked $file_source to $file_target"
	else
		echo "$file_target already exists, skipping."
	fi
}

# bash_aliases
link_file_or_dir ".bash_aliases" "/home/$USER/.bash_aliases"

# nvim config
link_file_or_dir ".config/nvim" "/home/$USER/.config/nvim"
