sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install libxslt1-dev libxslt1.1 libxml2-dev libxml2 libssl-dev libffi-dev python-pip python-pip2 python-dev libssl-dev git -y

sudo apt-get install build-essential -y
wget http://rarlab.com/rar/unrarsrc-5.2.7.tar.gz
tar -xvf unrarsrc-5.2.7.tar.gz
cd unrar
sudo make -f makefile
sudo install -v -m755 unrar /usr/bin

sudo pip install pyopenssl
sudo git clone https://github.com/SickRage/SickRage.git /opt/sickrage
sudo chown $USER -R /opt/sickrage
cd /opt/sickrage
sudo pip2 install -U pip
sudo pip2 install -U setuptools distutils
sudo pip2 install -r /opt/sickrage/requirements.txt

python /opt/sickrage/SickBeard.py -d

#Install SickRage Ubuntu 14.04 and Newer
#sickrageSickRage is a hot new fork of the classic Sickbeard for periodic media shows. It uses multiple databases to resolve scene naming issues found in Sickbeard. You can use torrents and usenet to download your media and it is quite customizable. It can be valuable addition for your automated home media server. This SickRage guide was created on a fresh install of Ubuntu 14.04.
#If you are looking for an Ubuntu 15.x guide see here

#Install SickRage Ubuntu

#Update repositories first
#sudo apt-get update
#Now upgrade existing packages
#sudo apt-get upgrade -y
#Install SickRage dependencies
#sudo apt-get install libxslt1-dev libxslt1.1 libxml2-dev libxml2 libssl-dev libffi-dev python-pip python-dev libssl-dev git -y

#Build the latest unrar from source
#sudo apt-get install build-essential -y
#wget http://rarlab.com/rar/unrarsrc-5.2.7.tar.gz
#tar -xvf unrarsrc-5.2.7.tar.gz
#cd unrar
#sudo make -f makefile
#sudo install -v -m755 unrar /usr/bin

#Install pyOpenSSL
#sudo pip install pyopenssl==0.13.1
#If you get a 509 error install a newer version of pyOpenSSL
#sudo pip intall pyeopenssl==0.14

#Git clone the SickRage installation
#sudo git clone https://github.com/SickRage/SickRage.git /opt/sickrage
#Change ownership to your username
#sudo chown username:username -R /opt/sickrage
#Test to see if you can run SickRage

#python /opt/sickrage/SickBeard.py -d

#You may get this error about handlers
#No handlers could be found for logger "sickbeard". We’ll fix that.
#You may also see this error.
#Datadir must be writeable '/opt/sickrage'
#The upstart script below solves this error too
#You should be able to access SickRage at http://ip.address:8081 after running the upstart script.
#Autostart SickRage
#Choose either the init.d script or upstart script. Upstart can have some issues so it’s advised to try the init.d script first.
#SickRage init.d Script
#Create the SickRage default file for Ubuntu
#sudo nano /etc/default/sickrage
#Paste this code, change username to the user you want to run SickRage as
#SR_USER=username
#SR_HOME=/opt/sickrage
#SR_DATA=/opt/sickrage
#SR_PIDFILE=/home/username/.sickrage.pid
#Copy the default SickRage init.d script
#sudo cp /opt/sickrage/init.ubuntu /etc/init.d/sickrage
#If you get an error the SickRage script may have moved in their git repo, find it with this command
#sudo find / -name init.ubuntu
#It told me it was here
#/opt/sickrage/runscripts/init.ubuntu
#So the new copy command to get the init script is this, source location is first
#sudo cp /opt/sickrage/runscripts/init.ubuntu /etc/init.d/sickrage
#Make the SickRage init.d script executable
#sudo chmod +x /etc/init.d/sickrage
#Update the SickRage init.d script defaults
#sudo update-rc.d sickrage defaults
#Start SickRage like this
#sudo service sickrage start
#SickRage Upstart Script
#If you have the init.d script working there is no reason to use the upstart script.
#Install upstart even though it should be included on Ubuntu
#sudo apt-get install upstart
#Create the SickRage upstart file
#sudo nano /etc/init/sickrage.conf
#Paste this in and replace username with your username.
#author "HTPCGuides.com"
#description "Upstart Script to run SickRage as a service on Ubuntu/Debian based distros"
#Set username for the process. Should probably be what you use for logging in
#setuid username
#start on runlevel [2345]
#stop on runlevel [016]
#respawn
#exec /opt/sickrage/SickBeard.py
#Run the service to see if it works
#sudo service sickrage start
#You should see a message like this
#sickrage start/running, process 14827
#See if it still boots on restart
#sudo reboot

