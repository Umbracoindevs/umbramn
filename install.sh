#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*      Umbra Masternode       *"
echo "*           SETUP             *"
echo "*                             *"
echo "*******************************"
echo && echo && echo

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

IP==$(curl -s4 icanhazip.com)
echo -e "${GREEN}Please enter your private key: (Copy from Windows and right click to paste and press enter)${NC}"
read KEY


sudo apt-get update -y 
echo -e "${GREEN}Completion: 1%...${NC}"
sudo apt-get upgrade -y 
echo -e "${GREEN}Completion: 2%...${NC}"
sudo apt-get install libboost-all-dev libevent-dev software-properties-common -y 
echo -e "${GREEN}Completion: 3%...${NC}"
sudo add-apt-repository ppa:bitcoin/bitcoin -y 
echo -e "${GREEN}Completion: 4%...${NC}"
sudo apt-get update 
echo -e "${GREEN}Completion: 4%...${NC}"
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
echo -e "${GREEN}Completion: 5%...${NC}"
sudo apt-get install libpthread-stubs0-dev -y 
echo -e "${GREEN}Completion: 6%...${NC}"
sudo apt-get install libzmq3-dev -y 
echo -e "${GREEN}Completion: 7%...${NC}"
sudo apt install -y make build-essential libtool software-properties-common autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev \
libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git curl libdb4.8-dev \
bsdmainutils libdb4.8++-dev libminiupnpc-dev libgmp3-dev ufw pkg-config libevent-dev libdb5.3++ unzip libzmq5
echo -e "${GREEN}Completion: 15%...${NC}"
cd /var
echo -e "${GREEN}Completion: 20%...${NC}"
sudo touch swap.img 
echo -e "${GREEN}Completion: 22%...${NC}"
sudo chmod 600 swap.img 
echo -e "${GREEN}Completion: 30%...${NC}"
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000 
echo -e "${GREEN}Completion: 33%...${NC}"
sudo mkswap /var/swap.img 
echo -e "${GREEN}Completion: 40%...${NC}"
sudo swapon /var/swap.img echo -e "${GREEN}Completion: 40%...${NC}"
sudo free 
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
echo -e "${GREEN}Completion: 44%...${NC}"
cd
echo -e "${GREEN}Completion: 50%...${NC}"
sudo apt-get install -y ufw
echo -e "${GREEN}Completion: 55%...${NC}"
sudo ufw allow ssh/tcp 
echo -e "${GREEN}Completion: 60%...${NC}"
sudo ufw limit ssh/tcp echo -e "${GREEN}Completion: 40%...${NC}"
sudo ufw allow 18878/tcp echo -e "${GREEN}Completion: 40%...${NC}"
sudo ufw logging on 
echo -e "${GREEN}Completion: 66%...${NC}"
echo "y" | sudo ufw enable 
echo -e "${GREEN}Completion: 77%...${NC}"
sudo chmod +x /root/umbramn/umbrad /root/umbramn/umbra-cli
echo -e "${GREEN}Completion: 78%...${NC}"
sudo mv /root/umbramn/umbrad /root/umbramn/umbra-cli /usr/local/bin
echo -e "${GREEN}Completion: 80%...${NC}"
sudo mkdir /root/.umbra
echo -e "${GREEN}Completion: 88%...${NC}"
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /root/.umbra/umbra.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /root/.umbra/umbra.conf
echo "rpcallowip=127.0.0.1" >> /root/.umbra/umbra.conf
echo "listen=1" >> /root/.umbra/umbra.conf
echo "server=1" >> /root/.umbra/umbra.conf
echo -e "${GREEN}Completion: 90%...${NC}"
echo "daemon=1" >> /root/.umbra/umbra.conf
echo "maxconnections=250" >> /root/.umbra/umbra.conf
echo "masternode=1" >> /root/.umbra/umbra.conf
echo "masternodeaddr$IP:18878" >> /root/.umbra/umbra.conf
echo "externalip$IP:18878" >> /root/.umbra/umbra.conf
echo "masternodeprivkey=$KEY" >> /root/.umbra/umbra.conf
echo -e "${GREEN}Completion: 99%...${NC}"
cd /root
sudo mv /root/umbramn/blocks /root/.umbra
echo -e "${GREEN}Completion: 99.99%...${NC}"
sudo umbrad
echo -e "${GREEN}Completion: 100%...${NC}"
echo -e "Thank you for installing the Umbra wallet.  Please move onto the ${RED}NEXT${NC} step."
echo -e "${GREEN}Completion: 110%...${NC}"

