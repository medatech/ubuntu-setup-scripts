# Create user ubuntu and add to sudo list
sudo useradd -d /home/ubuntu -m ubuntu
sudo passwd ubuntu
sudo usermod -a -G sudo ubuntu

# Use Bash by default
sudo usermod -s /bin/bash ubuntu
