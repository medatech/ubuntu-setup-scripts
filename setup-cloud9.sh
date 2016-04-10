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
echo "cd c9sdk && nohup node server.js --a ubuntu:ubuntu -w /home/ubuntu/projects/ &" > /home/ubuntu/startCloud9.sh
chmod +x /home/ubuntu/startCloud9.sh
{ crontab -l ; echo -e "\n@reboot /home/ubuntu/startCloud9.sh" ; } | crontab
