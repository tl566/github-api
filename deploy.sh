# deploy.sh
curl https://deb.nodesource.com/setup_16.x > setup_16.x | bash -;
apt install wget xz-utils vim git nodejs -y;
echo -e "set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936\nset termencoding=utf-8\nset encoding=utf-8" > ~/.vimrc
npm config set prefix /usr/local
npm i -g cnpm
cnpm config set prefix /usr/local
cnpm i -g typescript ts-node @types/node tslib pm2

cd ~
wget http://soft.vpser.net/lnmp/lnmp1.8.tar.gz -cO lnmp1.8.tar.gz && tar zxf lnmp1.8.tar.gz && cd lnmp1.8 && LNMP_Auto="y" ./install.sh nginx
curl https://raw.fastgit.org/JDHelloWorld/jd_cookie/main/nginx.conf > /usr/local/nginx/conf/nginx.conf
/etc/init.d/nginx restart

cd /home/wwwroot/default
git clone https://github.com/JDHelloWorld/jd_cookie

cd server
cnpm i
pm2 start bin/www
