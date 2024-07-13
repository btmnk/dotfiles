#!/bin/bash

dotfiles_dir=$(realpath "$0" | sed 's|\(.*\)/.*|\1|')

link_file_or_dir() {
	if [ ! $1 ]; then 
		echo "Source file/dir not passed."
		exit;
	elif [ ! $2 ]; then
		echo "Target dir not passed."
		exit;
	fi

	relative_source_path=$1
	full_source_path=$dotfiles_dir/$relative_source_path
	target_dir_path=$2
	full_target_path=$target_dir_path/$relative_source_path
	full_target_dir_path="$(dirname $full_target_path)"

	if [ -L $full_target_path ]; then
		echo "[$relative_source_path] The target file $full_target_path is already a symlink, skipping."
		echo "----"
		return
	fi

	# create target directory if it doesnt exist
	if [ ! -e $full_target_dir_path ]; then
		mkdir -p $full_target_dir_path
		echo "[$relative_source_path] created target dir $full_target_dir_path"
	fi

	# if target file exists we remove it so it can be overridden
	if [ -e $full_target_path ]; then
		echo "[$relative_source_path] override existing target $full_target_path"
		rm $full_target_path
	fi
	
	ln -s $full_source_path $full_target_path
	echo "[$relative_source_path] linked $full_source_path to $full_target_path"
	echo "----"
}

#
#	INSTALL BASH ALIASES
#

link_file_or_dir ".bash_aliases" "$HOME"

#
#	INSTALL NVIM CONFIG
#

link_file_or_dir ".config/nvim" "$HOME"

#
#	INSTALL ZSH CONFIG
#

if zsh --version &> /dev/null
then
	# zshrc config
	link_file_or_dir ".zshrc" "$HOME"
	# install powerlevel10k theme
	p10k_dir=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	if [ -d "$p10k_dir" ]; then
                echo "p10k already installed, skip"
        else
		echo "install p10k..."
        	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        fi
else
	echo "zsh not yet installed, skipping link"
fi

