#!/bin/bash

#
#Copyright 2021 yangxu52<https://github.com/yangxu52>
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#

#添加xiaorouji的passwall软件源
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
cat feeds.conf.default |grep passwall
echo '====================Add lienol feed source OK!===================='

#添加garypang13的bypass依赖插件
wget -nv https://raw.githubusercontent.com/garypang13/openwrt-packages/master/lua-maxminddb/Makefile -P package/lean/lua-maxminddb
wget -nv https://raw.githubusercontent.com/garypang13/smartdns-le/main/Makefile -P package/lean/smartdns-le

#添加garypang13的bypass插件
git clone -b main https://github.com/garypang13/luci-app-bypass package/lean/luci-app-bypass
sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' package/lean/luci-app-bypass/Makefile
sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' package/lean/luci-app-bypass/Makefile
ls -la package/lean/ |grep luci-app-bypass
echo '====================Add luci-app-bypass OK!===================='

#添加garypang13的dnsfilter插件
git clone -b main https://github.com/garypang13/luci-app-dnsfilter package/lean/luci-app-dnsfilter
ls -la package/lean/ |grep luci-app-dnsfilter
echo '====================Add luci-app-dnsfilter OK!===================='
