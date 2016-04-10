echo "What user is this being install under?"
read username

echo "What cloud9 username would you like to use?"
read c9username

echo "What cloud9 password would you like to use?"
read -s c9password

echo "Installing Node"

sudo apt-get update
sudo apt-get install -y curl build-essential git
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Install Cloud9"

cd
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
sudo scripts/install-sdk.sh

echo "Running Cloud9 on reboot"
echo "cd c9sdk && nohup node server.js --a $c9username:$c9password -w /home/$username/projects/ &" > /home/$username/startCloud9.sh
chmod +x /home/$username/startCloud9.sh
{ crontab -l ; echo -e "\n@reboot /home/$username/startCloud9.sh" ; } | crontab
