echo "What username would you like to configure?"
read username

# Create user ubuntu and add to sudo list
sudo useradd -d /home/$username -m $username
sudo passwd $username
sudo usermod -a -G sudo $username

# Use Bash by default
sudo usermod -s /bin/bash $username
