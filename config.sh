#!/bin/bash

# the name of virtualenv to be created
MY_VENV='mlenv'

# change source
if [ -r /etc/apt/sources.list ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources_init.list
    sudo rm /etc/apt/sources.list
fi
sudo cp ./sources.list /etc/apt/
sudo apt-get -y update
sudo apt-get -y upgrade

# install tools for c/c++, python3, pip3
sudo apt-get -y install build-essential cmake python3-dev python
sudo apt-get -y install python3-pip
sudo apt-get -y install tmux
sudo apt-get -y install ctags silversearcher-ag 
sudo apt-get -y install openssh-server openssh-client
sudo apt-get -y install cloc curl
sudo apt-get -y install openssl
sudo apt-get -y install libcurl4-openssl-dev libssl-dev
# change the source of pip3
mkdir ~/.pip
cp ./pip.conf ~/.pip/
sudo pip3 install --upgrade pip
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper

# install autojump
git clone git://github.com/wting/autojump.git
cd autojump
python3 install.py
cd ..

cat ./bashrc-append >> ~/.bashrc
echo "alias "${MY_VENV}'="source '\
'${HOME}/.virtualenvs/'${MY_VENV}'/bin/activate"' >> ~/.bashrc
source ~/.bashrc


# install vim and vim plugins
sudo apt-get -y install vim
if [ -r ~/.vimrc ]; then
    sudo rm ~/.vimrc
    cp ./.vimrc ~
else
    cp ./.vimrc ~
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'
python3  ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

# install my custom python virtualenv
mkvirtualenv -p /usr/bin/python3 $MY_VENV
workon $MY_VENV
pip3 install -r ./requirements.txt
deactivate

# configure tmux
[ -r ~/.tmux.conf ] && sudo rm ~/.tmux.conf
cp .tmux.conf ~
