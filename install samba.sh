#samba:
echo '[global]' >> /etc/samba/smb.conf
#samba:
echo 'usershare path = /var/lib/samba/usershares' >> /etc/samba/smb.conf
#samba:
echo 'usershare max shares = 100' >> /etc/samba/smb.conf
#samba:
echo 'usershare allow guests = yes' >> /etc/samba/smb.conf
#samba:
echo 'usershare owner only = yes' >> /etc/samba/smb.conf
#samba:
(  echo $pass 
   echo $pass ) | sudo smbpasswd -a $username
#samba:
sudo usermod -g users -G wheel $username
#samba:
sudo mkdir /var/lib/samba/usershares
#samba:
sudo chown root:users /var/lib/samba/usershares
#samba:
sudo chmod 1770 /var/lib/samba/usershares
#samba:
sudo gpasswd users -a $username
#samba:
sudo systemctl enable smb
#samba:
sudo systemctl enable nmb
