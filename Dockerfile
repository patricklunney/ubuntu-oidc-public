FROM ubuntu:16.04

# Install Apache and a bunch of dependencies
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install php -y
RUN apt-get install libapache2-mod-php -y
RUN apt-get install libcurl3 -y
RUN apt-get install libjansson4 -y
RUN apt-get install wget -y

# Install mod_auth_openidc
RUN wget http://ftp.us.debian.org/debian/pool/main/liba/libapache2-mod-auth-openidc/libapache2-mod-auth-openidc_1.6.0-1_amd64.deb
RUN dpkg -i libapache2-mod-auth-openidc_1.6.0-1_amd64.deb
RUN a2enmod auth_openidc

# Add index.php to /var/www/html/
COPY index.php /var/www/html/.
RUN  rm /var/www/html/index.html

# Add OIDC config
COPY apache2.conf /etc/apache2/
# remember to add the hosts /etc/hosts

CMD /usr/sbin/apache2ctl start && tail -f /var/log/apache2/error.log