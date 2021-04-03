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

#添加garypang13的edge主题
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge package/lean/luci-theme-edge
ls -la package/lean/ |grep luci-theme-edge
echo '====================Add luci-theme-edge OK!===================='

#修改linux内核为5.4分支
sed -i 's/KERNEL_PATCHVER:=4.19/KERNEL_PATCHVER:=5.4/g' target/linux/bcm53xx/Makefile
cat target/linux/bcm53xx/Makefile |grep KERNEL_PATCHVER
echo '====================Alert Kernel Patchver to 5.4 OK!===================='

#添加lwz322的K3屏幕插件
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/lean/luci-app-k3screenctrl
ls -la package/lean/ |grep luci-app-k3screenctrl
echo '====================Add k3screen Plug OK!===================='

#替换lwz322的K3屏幕驱动
rm -rf package/lean/k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/lean/k3screenctrl/
#sed -i 's/@TARGET_bcm53xx_DEVICE_phicomm-k3 +@KERNEL_DEVMEM //g' package/lean/k3screenctrl/Makefile
cat package/lean/k3screenctrl/Makefile |grep DEPENDS
echo '====================Add k3screen Drive OK!===================='

#移除bcm53xx中的其他机型
sed -i '141,385d' target/linux/bcm53xx/image/Makefile
sed -i '150,179d' target/linux/bcm53xx/image/Makefile
sed -i 's/k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
cat target/linux/bcm53xx/image/Makefile |grep DEVICE_PACKAGES
echo '====================Remove other devices of bcm53xx!===================='

#替换K3的无线驱动为ac86u
#wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.ac88u
#mv brcmfmac4366c-pcie.bin.ac88u package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#chmod 0644 package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#echo '====================Replace k3wireless firmware OK!===================='

#替换K3的无线驱动为asus-dhd24
wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.asus-dhd24
mv brcmfmac4366c-pcie.bin.asus-dhd24 package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#chmod 0644 package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
echo '====================Replace k3wireless firmware OK!===================='

#替换K3的无线驱动为69027
#wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.69027
#mv brcmfmac4366c-pcie.bin.69027 package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#chmod 0644 package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#echo '====================Replace k3wireless firmware OK!===================='
