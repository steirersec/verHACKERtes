cd /etc/ssh/
sudo mkdir default_kali_keys
sudo mv ssh_host_* default_kali_keys/
sudo dpkg-reconfigure openssh-server
apt-get clean
apt-get update 
apt-get upgrade -y 
apt-get dist-upgrade -y
#system settings
setxkbmap -layout de
sudo passwd
#FOLDERS
cd /home/kali/Desktop
mkdir 01_TOOLS
mkdir 02_HTBs
mkdir /home/kali/Desktop/02_HTBs/VPNS/
mkdir 03_CHECKS
cd 01_TOOLS
mkdir /home/kali/Desktop/01_TOOLS/github/
mkdir /home/kali/Desktop/01_TOOLS/github/windows/
mkdir /home/kali/Desktop/01_TOOLS/github/linux/
cd /home/kali/Desktop/03_CHECKS
#CHROOTKIT
apt-get install chkrootkit
cat /etc/hostname > /home/kali/Desktop/03_CHECKS/hostname
cat /etc/hosts > /home/kali/Desktop/03_CHECKS/hosts
updatedb
cat /etc/shadow | awk -F: '($2==""){print $1}' > /home/kali/Desktop/03_CHECKS/no_password_users.txt
#CHROOTKIT
echo Running chkrootkit. Wait!
sudo chkrootkit > /home/kali/Desktop/03_CHECKS/chkrootkit_log.txt
#LYNIS
apt-get install lynis -y
apt-get -f install
apt-get install lynis -y
echo Running lynis. Wait! 
lynis audit system > /home/kali/Desktop/03_CHECKS/lynis_log.txt
netstat -tulpn > /home/kali/Desktop/03_CHECKS/open_ports_log.txt
echo Close Unwanted Ports using: iptables -A INPUT -p tcp --dport PORT_NUMBER -j DROP 
iptables -L -n -v > /home/kali/Desktop/03_CHECKS/iptables_log.txt
#RKHUNTER
apt-get install rkhunter -y
rkhunter --update
rkhunter -c
#tools to install
apt install apt-transport-https -y
apt install neo4j -y
apt install bloodhound -y
apt install powershell -y
apt install crackmapexec -y
apt install eyewitness
#github tools
cd /home/kali/Desktop/01_TOOLS/github/windows/
#DSINTERNALS
git clone https://github.com/MichaelGrafnetter/DSInternals.git
#powersploit -> includes powerview
git clone https://github.com/PowerShellMafia/PowerSploit.git
#sysinternals
wget https://download.sysinternals.com/files/SysinternalsSuite.zip
cd /home/kali/Desktop/01_TOOLS/github/linux/
wget https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php
#impacket
git clone https://github.com/SecureAuthCorp/impacket.git
#pip install .

#responder
git clone https://github.com/lgandx/Responder.git
#autosploit
git clone https://github.com/NullArray/AutoSploit.git
#printer exploitation tools
git clone https://github.com/RUB-NDS/PRET.git

#evilwinrm
git clone https://github.com/Hackplayers/evil-winrm.git
#apt --fix-broken install
#apt autoclean -y
#apt autoremove -y

