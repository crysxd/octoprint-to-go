echo "Welcome!"
echo "Let's create a user to secure your OctoPrint"
read -p "Choose a user name: " USER
read -sp "Choose a password: " PASSWORD
echo
echo "Done! You can change the user and password by running this script again!"
printf "$USER:$(openssl passwd -crypt $PASSWORD)\n" > nginx/.htpasswd

echo "Let's setup noip so you can reach your OctoPrint remotely"
sudo docker run -ti -v "${PWD}/noip:/usr/local/etc/" hypriot/rpi-noip noip2 -C
