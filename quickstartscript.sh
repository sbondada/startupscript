printf "Instalation initializating....\n"

sudo apt-get update
sudo apt-get -y  upgrade

CURRENT=$(pwd)
DOWNLOAD="/home/kaushal/Downloads"
DOCUMENTS="/home/kaushal/Documents"


cd ${DOWNLOAD}

LOG="${DOWNLOAD}/startup.log"
ERR="${DOWNLOAD}/startup.err"

printf "Confif File created"
touch startup.log startup.err

printf "Installing Ubuntu Requirements....\n"

sudo apt-get -y install build-essential
sudo apt-get -y install lubuntu-restricted-addons
sudo apt-get -y install lubuntu-restricted-extras
printf "installing Eclipse .....\n"

sudo apt-get -y install eclipse >> ${LOG} 2>>${ERR}

printf "Installing Google chrome.......\n"

cd ${DOWNLOAD}/
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 2>>${ERR}
dpkg -i  ${DOWNLOAD}/google-chrome-stable_current_amd64.deb >> ${LOG} 2>>${ERR}
cd -

printf "Installing Git .....\n"

sudo apt-get -y  install git >> ${LOG} 2>>${ERR}

printf "Setting the parameters\n"

git config --global user.name "sbondada"
git config --global user.email "sbondada@buffalo.edu"
if [ ! -f /home/kaushal/.ssh/id_rsa.pub ] || [ ! -f /home/kaushal/.ssh/id_rsa.pub ] ; then
  ssh-keygen -t rsa -C "sbondada@buffalo.edu"
fi

printf "Installing GCC versions.....\n"

sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++

sudo apt-get -y install gcc-4.4 gcc-4.6 gcc-4.7 g++-4.4 g++-4.6 g++-4.7

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 30

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.7 30

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 50
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 50
sudo update-alternatives --set c++ /usr/bin/g++

printf "Installing VIM ....\n"

sudo apt-get -y install vim >> ${LOG} 2>>${ERR}

sudo apt-get update >> ${LOG} 2>>${ERR}
sudo apt-get upgrade >> ${LOG} 2>>${ERR}

printf "Installing VPN......\n"

sudo apt-get -y install network-manager-openconnect-gnome

cd ${DOCUMENTS}/
git clone https://github.com/sbondada/dotfiles.git
git clone https://github.com/sbondada/GeeksforGeeks-A2Z.git
git clone https://github.com/sbondada/AlgoEra.git
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

cd ~
ln -s ${DOCUMENTS}/dotfiles/vimrc.txt .vimrc >> ${LOG} 2>>${ERR}
ln -s ${DOCUMENTS}/dotfiles/tmux.conf.txt .tmux.conf >> ${LOG} 2>>${ERR}


echo "alias tmux='tmux -2'" >> .bashrc


wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/ >> ${LOG} 2>>${ERR}
fc-cache -vf ~/.fonts >> ${LOG} 2>>${ERR}
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/ >> ${LOG} 2>>${ERR}
