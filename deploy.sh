# deploy.sh
apt update -y;apt install wget xz-utils vim curl -y;
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -; apt-get install -y nodejs
npm config set prefix /usr/local
npm i -g cnpm
cnpm config set prefix /usr/local

cnpm i -g typescript ts-node @types/node tslib

mkdir test; cd test
curl https://raw.githubusercontent.com/JDHelloWorld/jd_scripts/main/package.json > package.json
cnpm i
curl https://raw.githubusercontent.com/JDHelloWorld/github-api/main/a.ts > a.ts
ts-node a.ts >> a.log
