echo "Welcome!"
echo "Let's create a user to secure your OctoPrint"
read -p "Choose a user name: " USER
read -sp "Choose a password: " PASSWORD
echo
echo "Done! You can change the user and password by running this script again!"
printf "$USER:$(openssl passwd -crypt $PASSWORD)\n" > nginx/.htpasswd
