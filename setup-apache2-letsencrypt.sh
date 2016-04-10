echo "What domain do you want to make HTTPS?"
read domain

sudo apt-get install -y apache2

sudo a2enmod proxy_http

sudo service apache2 restart

cd
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./letsencrypt-auto --help
./letsencrypt-auto --apache -d $domain
