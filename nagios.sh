sudo apt-get update
sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.2 libgd-dev

cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz
tar xzf nagioscore.tar.gz

cd /tmp/nagioscore-nagios-4.4.5/
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all

sudo make install-groups-users
sudo usermod -a -G nagios www-data

sudo make install

sudo make install-daemoninit

sudo make install-commandmode

sudo make install-config

sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi

sudo ufw allow Apache
sudo ufw reload

sudo htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin abcd@1234
sudo systemctl restart apache2.service
sudo systemctl start nagios.service

sudo apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext

cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz

cd /tmp/nagios-plugins-release-2.2.1/
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install

sudo systemctl stop nagios.service
sudo systemctl enable nagios.service
sudo systemctl start nagios.service
