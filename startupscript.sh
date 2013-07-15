#!/bin/bash
#
# START UP INSTALATION SCRIPTS
# the script installs all the required softwares with a certain installation
# the only way to install is change the permissions of the file and sh startupscript.sh


printf "Instalation initializating....\n"

sudo apt-get update
sudo apt-get -y  upgrade

CURRRENT="."
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

printf "installing deluge bit torrent client......\n"

sudo apt-get -y install deluge >> ${LOG} 2>>${ERR}

printf "Installing Google earth \n....."

sudo apt-get -y install google-earth-stable >> ${LOG} 2>>${ERR}

printf "Installing Google chrome.......\n"

cd ${DOWNLOAD}/
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 2>>${ERR}
dpkg -i  ${DOWNLOAD}/google-chrome-stable_current_amd64.deb >> ${LOG} 2>>${ERR}
cd -

printf "Installing TeamViewer......\n"

sudo apt-get -y install lib32asound2
cd ${DOWNLOAD}/
wget -q download.teamviewer.com/download/teamviewer_linux_x64.deb 2>>${ERR}
dpkg -i ${DOWNLOAD}/teamviewer_linux_x64.deb >> ${LOG} 2>>${ERR}
cd -

printf "Installing startupdisk creator........\n"

sudo apt-get -y install usb-creator-common >> ${LOG} 2>>${ERR}

printf "Installing Spotify .....\n"

cd /etc/apt/
echo "deb http://repository.spotify.com stable non-free" >> sources.list 2>>${ERR}
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
sudo apt-get -y  install spotify-client >> ${LOG} 2>>${ERR}

printf "Installing Dropbox.....\n"

sudo apt-get -y  install nautilus-dropbox >> ${LOG} 2>>${ERR}

printf "Installing Filezilla .....\n"

sudo apt-get -y install filezilla >> ${LOG} 2>>${ERR}

printf "Installing Git .....\n"

sudo apt-get -y  install git >> ${LOG} 2>>${ERR}

printf "Installing smplayer"

sudo apt-get -y install smplayer >> ${LOG} 2>>${ERR}

printf "Setting the parameters\n"

git config --global user.name "sbondada"
git config --global user.email "sbondada@buffalo.edu"
if [ ! -f /home/kaushal/.ssh/id_rsa.pub ] || [ ! -f /home/kaushal/.ssh/id_rsa.pub ] ; then
  ssh-keygen -t rsa -C "sbondada@buffalo.edu"
fi

printf "Installing meld.....\n"

sudo apt-get -y install meld >>${LOG} 2>>${ERR}

printf "Installing ssh Open Server.....\n"

sudo apt-get -y install openssh-server >>${LOG} 2>>${ERR}

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

printf "Installing Node ......\n"

sudo apt-get -y install nodejs

printf "Installing VIM ....\n"

sudo apt-get -y install vim

sudo apt-get update
sudo apt-get upgrade

printf "Installing Node.js.......\n"

sudo apt-get install python g++ make checkinstall
mkdir ~/src && cd $_
wget -N http://nodejs.org/dist/node-latest.tar.gz
tar xzvf node-latest.tar.gz && cd node-v*
rm node-latest.tar.gz
./configure
checkinstall #(remove the "v" in front of the version number in the dialog)
sudo dpkg -i node_*

printf "Installing heroku.....\n"

cd ${DOWNLOAD}/
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh >>${LOG} 2>>${ERR}
heroku login
heroku keys:add

printf "downloading matlab......\n"

scp sbondada@chatsubo.cse.buffalo.edu:/vpml/share/software/R2013a_UNIX.iso ${DOWNLOAD}




