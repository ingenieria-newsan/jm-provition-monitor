#! /bin/bash

m_ok='\033[1;32m OK \033[0m'
m_nok='\033[1;31m NO \033[0m'

#
# DEPENDENCIAS
#

apt-get update
sudo apt-get install figlet
sudo apt-get install python --fix-missing
sudo chmod +x ./monitor.sh ./res/ssdoctor ./res/Theft_Deterrent_client ./res/Theft_Deterrent_guardian ./res/Theft_Deterrent_tpmdaemon .res/theftdeterrentclient-lib.deb

#
# CONFIGURACION PLACA DE RED
#

sudo tee /etc/NetworkManager/conf.d/wifi.scan-rand-mac-address.conf > /dev/null <<EOF
[device]
wifi.scan-rand-mac-address=no
EOF

sudo systemctl restart NetworkManager.service

if [ -f "/etc/NetworkManager/conf.d/wifi.scan-rand-mac-address.conf" ];
	then
		printf "[${m_ok}] Configuración de placa de red correcta."
	else
		printf "[${m_nok}] Falló la configuración de placa de red."
fi

#
# INSTALACION TD+
#

sudo apt-get -y autoremove theftdeterrentclient
sudo apt-get -y autoremove theftdeterrentclient-lib
sudo apt-get -y autoremove theftdeterrentguardian
sudo apt-get -y autoremove theftdeterrentdaemon
sudo rm -fr /opt/TheftDeterrentclient
sudo rm -fr /var/theftdeterren

sudo dpkg -i ./res/theftdeterrentclient-lib.deb
sudo ./res/Theft_Deterrent_tpmdaemon install
sudo ./res/Theft_Deterrent_guardian install
sudo ./res/Theft_Deterrent_client install

sleep 2
nohup /opt/TheftDeterrentclient/client/Theft_Deterrent_client.autorun >>/dev/null 2>&1 &

#
# END
#