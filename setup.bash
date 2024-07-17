#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install \
	openvpn \
	golang \
	docker.io \
	docker-compose \
	sqlite3 \
	wget \
	gpg

sudo systemctl enable docker --now
sudo usermod -aG docker $USER

sudo apt-get install 
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

sudo apt install \
	audacity \
	steghide \
	stegseek \
	ghidra \
	gobuster

sudo gem install zsteg
wget https://out7.hex-rays.com/files/idafree84_linux.run
chmod +x idafree84_linux.run
./idafree84_linux.run

git clone https://github.com/devploit/nomore403
cd nomore403
go get
go build

sudo git clone -q https://github.com/ticarpi/jwt_tool /opt/jwt_tool
cd /opt/jwt_tool
sudo python3 -m pip install -q termcolor cprint pycryptodomex requests 2>&1 >/dev/null
echo 'alias jwt_tool="python3 /opt/jwt_tool/jwt_tool.py"' >> ~/.bashrc

cd /usr/share/wordlists/
sudo gzip -d rockyou.txt.gz

reboot