clear
sudo apt update
sudo apt upgrade -y
sudo apt install figlet -y
sudo apt install git -y
sudo apt install wget -y
sudo apt install proot -y
sudo apt install cmake -y
sudo git clone https://github.com/xmrig/xmrig.git
sudo mkdir xmrig/build && cd xmrig/build 
sudo cmake .. -DWITH_HWLOC=OFF && sudo make
cd ..
cd ..
bash start.sh