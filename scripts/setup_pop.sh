#!/bin/bash

# sudo apt update
# sudo apt upgrade -y
# sudo apt autoremove

# configure git
if  [ ! -f ~/.gitconfig ]; then
	echo -e "Configuring git variables... \n"
	git config --global color.ui auto
	git config --global user.name debboutr
	git config --global user.email debboutr@gmail.com
	git config -l
else
  echo "git is already configured"
fi

# clone the vimwiki
if ! [ -d ~/vimwiki ]
then
	git clone https://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@github.com/debboutr/vimwiki.git
else
  echo "vimwiki is already installed."
fi

# add vim plugins TODO: configure in the dotfiles!
if  [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo -e "configuring vim... \n"
    sudo apt install -y curl vim-gui-common vim-runtime > /dev/null 2>&1
    curl -flo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# install batcat to be used as `bat`
if ! [ -x "$(command -v batcat)" ]
then
  sudo apt install -y batcat
  mkdir ~/.local/bin
  ln -s $(which batcat) ~/.local/bin/bat
  echo 'export PATH="/home/rick/.local/bin:$PATH"' >> ~/.bashrc
else
  echo "batcat is already installed."
fi

# install QGIS TODO: see comment below?
if ! [ -x "$(command -v qgis)" ]
then
  sudo apt install -y gnupg software-properties-common
  wget -qO - https://qgis.org/downloads/qgis-2021.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
  sudo chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg
  sudo add-apt-repository -y "deb [arch=amd64] https://qgis.org/ubuntu `lsb_release -c -s` main"
  sudo apt install -y qgis qgis-plugin-grass
else
  echo "qgis is already installed."
fi

# Starting GRASS GIS...
# WARNING: GRASS GUI not found. Please check your installation.
# Switching to text based interface mode.
# 
# Hit RETURN to continue.
# 
# 
# ERROR: </home/rick> is not a valid GRASS Location because PERMANENT Mapset is missing
# Exiting...

# install docker...TODO check docker-compose gets installed and docker command can be used without sudo
if ! [ -x "$(command -v docker)" ]; then
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/docker-ce-archive-keyring.gpg > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-ce-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce
    # need to restart after these below
    sudo groupadd docker
    sudo usermod -aG docker rick
    # TODO: get most recent version in URL below
    sudo curl -SL "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/lib/docker/cli-plugins/docker-compose
    sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
else
    echo "docker is already installed."
fi

# install gparted
if ! [ -x "$(command -v gparted)" ]; then
    sudo apt install gparted -y
    sudo apt install exfatprogs -y
    sudo umount /dev/sdd1
    sudo apt install exfat-utils exfat-fuse -y
else
  echo "gparted is already installed."
fi

# install tmux
if ! [ -x "$(command -v tmux)" ]; then
    sudo apt install -y tmux
else
  echo "tmux is already installed."
fi

# install brave
if ! [ -x "$(command -v brave-browser)" ]; then
	sudo apt install -y apt-transport-https
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install -y brave-browser
else
  echo "brave is already installed."
fi

install_miniconda () {
	mkdir -p ~/miniconda3
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
	bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
	rm -rf ~/miniconda3/miniconda.sh
	~/miniconda3/bin/conda init bash
}

if ! [ -x "$(command -v conda)" ]; then
	install_miniconda >> ~/miniconda_install.log
else
  echo "miniconda is already installed."
fi
