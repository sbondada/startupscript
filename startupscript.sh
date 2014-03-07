#!/bin/bash
#
# START UP INSTALATION SCRIPTS
# the script installs all the required softwares with a certain installation
# the only way to install is change the permissions of the file and sh startupscript.sh


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

printf "Installing and setting Ubuntu one Client.....\n"

sudo add-apt-repository ppa:noobslab/apps >> ${LOG} 2>>${ERR} #adding the rpositoreis
sudo apt-get update
sudo apt-get install -y  ubuntuone-client ubuntuone-control-panel ubuntuone-client-proxy ubuntuone-control-panel-qt 

printf "Installing Filezilla .....\n"

sudo apt-get -y install filezilla >> ${LOG} 2>>${ERR}

printf "Installing Git .....\n"

sudo apt-get -y  install git >> ${LOG} 2>>${ERR}

printf "Installing smplayer\n"

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

sudo apt-get -y install nodejs >> ${LOG} 2>>${ERR}

printf "Installing VIM ....\n"

sudo apt-get -y install vim >> ${LOG} 2>>${ERR}

sudo apt-get update >> ${LOG} 2>>${ERR}
sudo apt-get upgrade >> ${LOG} 2>>${ERR}

printf "installing openconnect....\n"

sudo apt-get -y install network-manager-openconnect-gnome

'
cd ${DOWNLOAD}
printf "getting cisco open connect\n"

curl 'https://download.acsu.buffalo.edu/techtools/linux/anyconnect-predeploy-linux-64-3.1.02043-k9.tar.gz' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Host: download.acsu.buffalo.edu' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: https://download.acsu.buffalo.edu/index.php?sw=linux/anyconnect-predeploy-linux-64-3.1.02043-k9.tar.gz' -H 'Cookie: _shibsession_64656661756c7468747470733a2f2f646f776e6c6f61642e616373752e62756666616c6f2e6564752f73686962626f6c6574682d7370=_e8773c5700053aac4d10fec5fd03290a; __utma=99522061.1699040314.1383418044.1383434362.1383437581.3; __utmb=99522061.6.10.1383437581; __utmc=99522061; __utmz=99522061.1383437581.3.3.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)' -H 'Connection: keep-alive' --compressed >> anyconnect-predeploy-linux-3.1.02043-k9.tar.gz
tar -xzvf anyconnect-predeploy-linux-3.1.02043-k9.tar.gz
rm anyconnect-predeploy-linux-3.1.02043-k9.tar.gz
cd anyconnect-3.1.02043/vpn
printf "installing anyconnect\n"
sudo ./vpn_install.sh
rm -r anyconnect-3.1.02043

printf "updating the certificates\n"
curl 'https://download.acsu.buffalo.edu/techtools/linux/AddTrust_External_Root.pem' -H 'If-None-Match: "600e-5f1-f40a1100"' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Host: download.acsu.buffalo.edu' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: https://download.acsu.buffalo.edu/index.php?sw=linux/AddTrust_External_Root.pem' -H 'Cookie: _shibsession_64656661756c7468747470733a2f2f646f776e6c6f61642e616373752e62756666616c6f2e6564752f73686962626f6c6574682d7370=_e8773c5700053aac4d10fec5fd03290a; __utma=99522061.1699040314.1383418044.1383434362.1383437581.3; __utmc=99522061; __utmz=99522061.1383437581.3.3.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)' -H 'Connection: keep-alive' -H 'If-Modified-Since: Wed, 08 Aug 2012 19:16:52 GMT' -H 'Cache-Control: max-age=0' --compressed >> ${DOWNLOAD}/AddTrust_External_Root.pem
curl 'https://download.acsu.buffalo.edu/techtools/linux/COMODOHigh-AssuranceSecureServerCA.pem' -H 'If-None-Match: "604e-6fd-f51cb980"' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Host: download.acsu.buffalo.edu' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: https://download.acsu.buffalo.edu/index.php?sw=linux/COMODOHigh-AssuranceSecureServerCA.pem' -H 'Cookie: _shibsession_64656661756c7468747470733a2f2f646f776e6c6f61642e616373752e62756666616c6f2e6564752f73686962626f6c6574682d7370=_e8773c5700053aac4d10fec5fd03290a; __utma=99522061.1699040314.1383418044.1383437581.1383440305.4; __utmb=99522061.3.10.1383440305; __utmc=99522061; __utmz=99522061.1383437581.3.3.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)' -H 'Connection: keep-alive' -H 'If-Modified-Since: Wed, 08 Aug 2012 19:17:10 GMT' -H 'Cache-Control: max-age=0' --compressed >> ${DOWNLOAD}/COMODOHigh-AssuranceSecureServerCA.pem
curl 'https://download.acsu.buffalo.edu/techtools/linux/UTN_USERFirst_Hardware_Root_CA.pem' -H 'If-None-Match: "6010-646-f4842300"' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Host: download.acsu.buffalo.edu' -H 'Accept-Language: en-US,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: https://download.acsu.buffalo.edu/index.php?sw=linux/UTN_USERFirst_Hardware_Root_CA.pem' -H 'Cookie: _shibsession_64656661756c7468747470733a2f2f646f776e6c6f61642e616373752e62756666616c6f2e6564752f73686962626f6c6574682d7370=_e8773c5700053aac4d10fec5fd03290a; __utma=99522061.1699040314.1383418044.1383437581.1383440305.4; __utmb=99522061.2.10.1383440305; __utmc=99522061; __utmz=99522061.1383437581.3.3.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)' -H 'Connection: keep-alive' -H 'If-Modified-Since: Wed, 08 Aug 2012 19:17:00 GMT' -H 'Cache-Control: max-age=0' --compressed >> ${DOWNLOAD}/UTN_USERFirst_Hardware_Root_CA.pem
sudo mv AddTrust_External_Root.pem /opt/.cisco/certificates/ca/
sudo mv COMODOHigh-AssuranceSecureServerCA.pem /opt/.cisco/certificates/ca/
sudo mv UTN_USERFirst_Hardware_Root_CA.pem /opt/.cisco/certificates/ca/
cd $CURRENT

#unable to get the java standard edition with the wget command
<<COMMENT 
'
printf "installing java......\n"
wget http://javadl.sun.com/webapps/download/AutoDL?BundleId=81812 -O jre-7u45-linux-x64.tar.gz
tar -xzvf jre-7u45-linux-x64.tar.gz
rm jre-7u45-linux-x64.tar.gz
mv jre1.7.0_45 /usr/lib/jvm/java-7-openjdk-amd64
sudo update-alternatives --remove-all javac
sudo update-alternatives --remove-all java
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java 10
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-7-openjdk-amd64/bin/javac 10
COMMENT



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

cd ${DOCUMENTS}/
git clone https://github.com/sbondada/dotfiles.git
git clone https://github.com/sbondada/GeeksforGeeks-A2Z.git
git clone https://github.com/sbondada/AlgoEra.git
    
cd ~
ln -s ${DOCUMENTS}/dotfiles/vimrc.txt .vimrc
ln -s ${DOCUMENTS}/dotfiles/tmux.conf.txt .tmux.conf

echo "alias tmux='tmux -2'" >> .bashrc

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf
~/.config/fontconfig/conf.d/

cd ${DOWNLOAD}/
printf "downloading matlab......\n"

scp sbondada@chatsubo.cse.buffalo.edu:/vpml/share/software/R2013b_UNIX.iso ${DOWNLOAD}




