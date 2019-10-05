#!/bin/bash

# the name of virtualenv to be created
MY_VENV='mlenv'

set -x
# change source
if [ -r /etc/apt/sources.list ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources_init.list
    sudo rm /etc/apt/sources.list
fi
cp ./sources.list /etc/apt/
sudo apt-get -y update
sudo apt-get -y upgrade

set -e
# install tools for c/c++, python3, pip3
sudo apt-get -y install build-essential cmake python3-dev
sudo apt-get -y install python3-pip
sudo apt-get -y install tmux
sudo apt-get -y install openssh-server openssh-client
sudo apt-get -y install cloc curl autojump
# change the source of pip3
mkdir ~/.pip
cp ./pip.conf ~/.pip/
sudo pip3 install --upgrade pip
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper

cat ./bashrc-append >> ~/.bashrc
source ~/.bashrc


# install vim and vim plugins
sudo apt-get -y install vim
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
