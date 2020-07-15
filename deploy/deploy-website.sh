#!/usr/bin/env bash
export BASH_ENV=/etc/profile
echo $PATH

rm -rf barrel-ui
git clone -b 1.0.0 https://gitee.com/tanxinzheng/barrel-ui.git

cd barrel-ui 

npm -v 
node -v
yarn -v
npm config set registry https://registry.npm.taobao.org
#yarn && npm uninstall husky && yarn add umi-plugin-setting-drawer umi-plugin-antd-theme umi-plugin-pro  && yarn run pro fetch-blocks && npm run site && git checkout . && git clean -df

yarn && yarn build

sudo mv dist /usr/share/nginx/www.new
# bakup old version
echo "....bakup old version...."
sudo mv /usr/share/nginx/www /usr/share/nginx/www.old
echo "....start new version...."
sudo mv /usr/share/nginx/www.new /usr/share/nginx/www

echo "Restart Nginx Service Start...."
sudo systemctl restart nginx
echo "Restart Nginx Service End...."