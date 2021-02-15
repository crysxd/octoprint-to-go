echo "Let's create a user to secure your OctoPrint"
read -p "Choose a user name: " USER
read -sp "Choose a password: " PASSWORD
echo
echo "Done! You can change the user and password by running this script again!"
printf "$USER:$(openssl passwd -crypt $PASSWORD)\n" > nginx/.htpasswd
echo
echo
echo
echo "Let's setup noip so you can reach your OctoPrint remotely"
sudo docker run -ti -v "${PWD}/noip:/usr/local/etc/" hypriot/rpi-noip noip2 -C
echo
echo
echo
echo
echo "Let's generate certificates for HTTPS encryption"
read -p "Please enter the host name from no-ip [e.g. xxx.ddns.net]: " HOST
read -p "Please enter your 2-letter country code [e.g. US, DE, NL, ...]: " COUNTRY
mkdir -p nginx/certs
sudo openssl req -x509 -nodes -days 10000 -newkey rsa:2048 -subj "/C=$COUNTRY/CN=$HOST" -addext "subjectAltName = DNS:$HOST"
sed -i "s/%%%HOST%%%/$HOST/g" nginx/conf.d/octoprint.conf
echo "Last step! This may take up to 15 minutes on older Pi!"
sudo openssl dhparam -out nginx/certs/dhparam.pem 2048
echo "Ok, now this is really the last step. Downloading and starting OctoPrint and nginx"
sudo docker-compose up -d
echo "READY! Open https://$HOST in your browser! " 
echo "Everything starts automatically after your Pi boots!"
