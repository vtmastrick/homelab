#run updates and installs first
apt-get update -y
apt-get upgrade -y
apt autoremove -y
apt-get -y install perl
apt-get -y install ansible
apt-get -y install sudo

#wipe and reinitialize ansible user
deluser --remove-home --quiet ansible
adduser --disabled-password --gecos "" ansible
usermod -a -G sudo ansible

mkdir /home/ansible/.ssh
touch /home/ansible/.ssh/authorized_keys

#get the public ansible command server key
rm id_rsa.pub -f
wget https://raw.githubusercontent.com/vtmastrick/ansible-pi/master/setup/id_rsa.pub

#set permissions
cat id_rsa.pub >> /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/authorized_keys
chmod 700 /home/ansible/.ssh
chown ansible:ansible /home/ansible/.ssh -R

#ansible needs no password
#echo "%ansible ALL=NOPASSWD: ALL" | tee /etc/sudoers.d/ansible

#cleanup
rm id_rsa.pub
