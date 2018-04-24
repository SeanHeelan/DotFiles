#!/usr/bin/env bash

# Install/update pathogen and all plugins

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
		local RES=$(git -C $TARGET pull 2>&1)
		if [ ! $? ]; then
			echo $RES
			echo "Failed to pull $TARGET"
			return 1
		fi
	else
		echo -e "\tInstalling $NAME..."
		local RES=$(git clone $REPO $TARGET 2>&1)
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

if ! get_vim_plugin "git@github.com:xolox/vim-misc.git" \
	$VIM_BUNDLE/vim-misc \
	"vim-misc"; then
	exit 1
fi

if ! get_vim_plugin "git@github.com:xolox/vim-easytags.git" \
	$VIM_BUNDLE/vim-easytags \
	"vim-easytags"; then
	exit 1
fi

if ! get_vim_plugin "git@github.com:scrooloose/nerdtree.git" \
	$VIM_BUNDLE/nerdtree \
	"nerdtree"; then
	exit 1
fi

if ! get_vim_plugin "git@github.com:nvie/vim-flake8.git" \
	$VIM_BUNDLE/vim-flake8 \
	"vim-flake8"; then
	exit 1
fi

if ! get_vim_plugin "git@github.com:tpope/vim-obsession.git" \
	$VIM_BUNDLE/vim-obsession \
	"vim-obsession"; then
	exit 1
fi
