
echo "Welcome!"
echo "This script will:"
echo "- Install Docker, Docker Compose and Git"
echo "- Guide you through the setup for No-IP (DDNS)"
echo "- Guide you through setting up HTTPS"
echo
echo
echo
echo
echo "Let's install Docker, Docker Compose and Git!"
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
sudo docker run hello-world
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser
sudo apt-get install -y git
sudo pip3 -v install docker-compose
echo
echo
echo
echo
echo "Let's setup Docker Compose to run OctoPrint!"
cd ~
git clone https://github.com/crysxd/octoprint-to-go/
cd octoprint-to-go
echo
echo
echo
echo
./setup.sh
