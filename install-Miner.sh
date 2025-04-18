apt update
apt upgrade -y
pkg install git -y
pkg install wget -y
pkg install proot -y
pkg install cmake -y
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build && cd xmrig/build 
cmake .. -DWITH_HWLOC=OFF && make 
./xmrig -o rx.unmineable.com:3333 -u DOGE:YourAddress.MinerWorker -p x -k -a rx/0 -t 5
