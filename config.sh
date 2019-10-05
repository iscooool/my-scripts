#!/bin/bash

# the name of virtualenv to be created
MY_VENV='mlenv'

set -e
# change source
if [ -r /etc/apt/sources.list ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources_init.list
    sudo rm /etc/apt/sources.list
fi
cp ./sources.list /etc/apt/
sudo apt-get update
sudo apt-get upgrade

# install tools for c/c++, python3, pip3
sudo apt-get install build-essential cmake python3-dev ubuntu-make
sudo apt-get install python3-pip
sudo apt-get install tmux
sudo apt-get install openssh-server openssh-client
sudo apt-get install cloc curl autojump
# change the source of pip3
mkdir ~/.pip
cp ./pip.conf ~/.pip/
sudo pip3 install --upgrade pip
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper

cat ./bashrc-append >> ~/.bashrc
source ~/.bashrc


# install vim and vim plugins
sudo apt-get install vim
if [ -r ~/.vimrc ]; then
    sudo rm ~/.vimrc
    cp ./.vimrc ~
else
    cp ./.vimrc ~
fi
vim -c 'PluginInstall' -c 'qa!'
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer

# install my custom python virtualenv
mkvirtualenv -p /usr/bin/python3 $MY_VENV
workon $MY_VENV
pip3 install -r ./requirements.txt
deactivate

# configure tmux
[ -r ~/.tmux.conf ] && sudo rm ~/.tmux.conf
cp ./.tmux.conf ~/
