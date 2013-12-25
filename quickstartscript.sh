printf "Instalation initializating....\n"

sudo apt-get update
sudo apt-get -y  upgrade

CURRENT=$(pwd)
DOWNLOAD="/home/kaushal/Downloads"

cd ${DOWNLOAD}

LOG="${DOWNLOAD}/startup.log"
ERR="${DOWNLOAD}/startup.err"

printf "Confif File created"
touch startup.log startup.err

printf "Installing Ubuntu Requirements....\n"

sudo apt-get -y install build-essential
sudo apt-get -y install ubuntu-restricted-essentials
sudo apt-get -y install wine1.4
printf "installing Eclipse .....\n"

sudo apt-get -y install eclipse >> ${LOG} 2>>${ERR}
sudo apt-get -y install eclipse-cdt >> ${LOG} 2>>${ERR}
sudo apt-get -y install eclipse-egit >> ${LOG} 2>>${ERR}

printf "Installing Google chrome.......\n"

cd ${DOWNLOAD}/
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 2>>${ERR}
dpkg -i  ${DOWNLOAD}/google-chrome-stable_current_amd64.deb >> ${LOG} 2>>${ERR}
cd -

printf "Installing Dropbox.....\n"

sudo apt-get -y  install nautilus-dropbox >> ${LOG} 2>>${ERR}

printf "Installing and setting Ubuntu one Client.....\n"

sudo add-apt-repository ppa:noobslab/apps >> ${LOG} 2>>${ERR} #adding the rpositoreis
sudo apt-get update
sudo apt-get install -y  ubuntuone-client ubuntuone-control-panel ubuntuone-client-proxy ubuntuone-control-panel-qt 


printf "Installing Git .....\n"

sudo apt-get -y  install git >> ${LOG} 2>>${ERR}

printf "Setting the parameters\n"

git config --global user.name "sbondada"
git config --global user.email "sbondada@buffalo.edu"
if [ ! -f /home/kaushal/.ssh/id_rsa.pub ] || [ ! -f /home/kaushal/.ssh/id_rsa.pub ] ; then
  ssh-keygen -t rsa -C "sbondada@buffalo.edu"
fi

printf " Installing Guake .....\n"

sudo apt-get -y install guake >>${LOG} 2>>${ERR}


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
