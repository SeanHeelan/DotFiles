#!/bin/bash

echo "Installing vimrc ..."
cp vim/vimrc $HOME/.vimrc

VIM_BUNDLE=$HOME/.vim/bundle
echo "Installing vim plugins ..."
echo -e "\tInstalling pathogen ..."
mkdir -p ~/.vim/autoload $VIM_BUNDLE && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

get_vim_plugin() {
	local REPO=$1
	local TARGET=$2
	local NAME=$3
	if [ -d $TARGET ]; then
		echo -e "\tUpdating $NAME..."
		local RES=$(git -C $TARGET pull)
		if [ ! $? ]; then
			echo $RES
			echo "Failed to pull $TARGET"
			return 1
		fi
	else
		echo -e "\tInstalling $NAME..."
		local RES=$(git clone $REPO $TARGET)
		if [ ! $? ]; then
			echo $RES
			echo "Failed to clone $TARGET"
			return 1
		fi
	fi
	return 0
}

if ! get_vim_plugin "https://github.com/scrooloose/syntastic" \
	$VIM_BUNDLE/syntastic \
	"syntastic"; then
	exit 1
fi

if ! get_vim_plugin "https://github.com/ervandew/supertab.git" \
	$VIM_BUNDLE/supertab \
	"supertab"; then
	exit 1
fi

if ! get_vim_plugin "git://github.com/tpope/vim-sensible.git" \
	$VIM_BUNDLE/vim-sensible \
	"vim-sensible"; then
	exit 1
fi

if ! get_vim_plugin "https://github.com/fatih/vim-go.git" \
	$VIM_BUNDLE/vim-go \
	"vim-go"; then
	exit 1
fi

if ! get_vim_plugin "https://github.com/rust-lang/rust.vim.git" \
	$VIM_BUNDLE/rust.vim \
	"rust.vim"; then
	exit 1
fi

if ! get_vim_plugin "https://github.com/Shutnik/jshint2.vim.git" \
	$VIM_BUNDLE/jshint2.vim \
	"jshint2.vim"; then
	exit 1
fi

if ! get_vim_plugin "https://github.com/pangloss/vim-javascript.git" \
	$VIM_BUNDLE/vim-javascript \
	"vim-javascript"; then
	exit 1
fi

if ! get_vim_plugin "https://github.com/dag/vim2hs.git" \
	$VIM_BUNDLE/vim2hs \
	"vim2hs"; then
	exit 1
fi

echo "Installing bash aliases ..."
cat shell/aliases >> $HOME/.bashrc
echo "Done"

