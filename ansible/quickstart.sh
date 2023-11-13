#run updates and installs first
apt-get update -y
apt-get upgrade -y
apt autoremove -y
apt-get -y install perl
apt-get -y install ansible

#wipe and reinitialize ansible user
deluser --remove-home ansible
useradd ansible
usermod -a -G sudo ansible
mkhomedir_helper ansible

#no password access
sudo passwd -q ansible

mkdir /home/ansible/.ssh
touch /home/ansible/.ssh/authorized_keys

#get the public ansible command server key
rm id_rsa.pub
wget https://raw.githubusercontent.com/vtmastrick/ansible-pi/master/setup/id_rsa.pub

#set permissions
cat id_rsa.pub >> /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/authorized_keys
chmod 700 /home/ansible/.ssh
chown ansible:ansible /home/ansible/.ssh -R

#ansible needs no password
#echo "%ansible ALL=NOPASSWD: ALL" | tee /etc/sudoers.d/ansible
sudo adduser ansible sudo

#cleanup
rm id_rsa.pub
