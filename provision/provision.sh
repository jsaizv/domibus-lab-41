sudo groupadd -g 8000 pnr
sudo useradd -m -d /home/pnr -u 8000 -g pnr -s /bin/bash -c "Usuario aplicacion" pnr
sudo mkdir /servicio
sudo cp -p /etc/sudoers /etc/sudoers.orig && sudo cp /provision/sudoers /etc/sudoers
sudo su - pnr
cd /servicio 
sudo wget -q --no-check-certificate https://ec.europa.eu/cefdigital/artifact/content/repositories/public/eu/domibus/domibus-distribution/4.1.3/domibus-distribution-4.1.3-tomcat-full.zip -P /servicio
unzip domibus-distribution-4.1.3-tomcat-full.zip
mv domibus domibus-4.1.3
ln -s domibus-4.1.3 domibus
sudo dnf install -y mysql
cd /provision
sudo dnf install -y jre-8u241-linux-x64.rpm mysql-connector-java-8.0.17-1.el8.noarch.rpm mysql-server
sudo cp /usr/share/java/mysql-connector-java.jar /servicio/domibus/lib/
sudo systemctl stop firewalld && sudo systemctl disable firewalld
sudo cp -p /servicio/domibus/bin/setenv.sh /servicio/domibus/bin/setenv.sh.orig
sudo cp -p /servicio/domibus/conf/domibus/domibus.properties /servicio/domibus/conf/domibus/domibus.properties.orig
sudo cp /provision/setenv.sh /servicio/domibus/bin/setenv.sh
sudo cp /provision/domibus.properties /servicio/domibus/conf/domibus/domibus.properties
sudo sed -i 's/blue_gw/"$1"/g' /servicio/domibus/conf/domibus/domibus.properties
sudo chmod a+x /servicio/domibus/bin/*.sh
sudo mkdir /servicio/domibus/conf/domibus/keystores && cd /servicio/domibus/conf/domibus/keystores
sudo keytool -genkey -alias $1 -keyalg RSA -keystore gateway_keystore.jks -dname "cn=test, ou=pnr, o=Madrid, c=ES" -storepass test123 -keypass test123
sudo keytool -export -alias $1 -file client.cer -keystore gateway_keystore.jks -storepass test123 -keypass test123
sudo keytool -import -trustcacerts -alias $1 -file client.cer -keystore gateway_truststore.jks -storepass test123 -noprompt
sudo chown -R pnr:pnr /servicio/
cd /servicio/sql-scripts
sudo systemctl start mysqld && sudo systemctl enable mysqld
sudo mysqladmin password "test123"
sudo mysql -h localhost -u root --password=test123 -e "create schema domibusdb; alter database domibusdb charset=utf8 collate=utf8_bin; create user pnr@localhost identified by 'pnr123'; grant all on domibusdb.* to pnr@localhost;"
sudo mysql -h localhost -u root --password=test123 domibusdb < mysql5innoDb-4.1.2.ddl
sudo mysql -h localhost -u root --password=test123 domibusdb < mysql5innoDb-4.1.2-data.ddl
sudo /servicio/domibus/bin/setenv.sh && sudo /servicio/domibus/bin/startup.sh