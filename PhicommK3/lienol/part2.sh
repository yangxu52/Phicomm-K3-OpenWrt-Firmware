#!/bin/bash

#
#Copyright 2021-2023 yangxu52<https://github.com/yangxu52>
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

# Alter default router IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

echo '修改NTP服务器地址'
sed -i "s/'0.openwrt.pool.ntp.org'/'ntp.aliyun.com'/g" package/base-files/files/bin/config_generate
sed -i "s/'1.openwrt.pool.ntp.org'/'time1.cloud.tencent.com'/g" package/base-files/files/bin/config_generate
sed -i "s/'2.openwrt.pool.ntp.org'/'time.ustc.edu.cn'/g" package/base-files/files/bin/config_generate
sed -i "s/'3.openwrt.pool.ntp.org'/'cn.pool.ntp.org'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep system.ntp.server=
echo '=========Alert NTP server address OK!========='

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='Phicomm-K3'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Alert hostname OK!========='

# echo '修改upnp绑定文件位置'
# sed -i 's/\/var\/upnp.leases/\/tmp\/upnp.leases/g' feeds/packages/net/miniupnpd/files/upnpd.config
# cat feeds/packages/net/miniupnpd/files/upnpd.config |grep upnp_lease_file
# echo '=========Alert upnp binding file directory!========='

echo '添加jerrykuku的argon-mod主题'
rm -rf feeds/luci/themes/luci-theme-argon/
git clone https://github.com/jerrykuku/luci-theme-argon feeds/luci/themes/luci-theme-argon/
echo '=========Add argon-mod OK!
========='

echo '替换lwz322的K3屏幕驱动插件'
rm -rf feeds/other/lean/k3screenctrl/
git clone https://github.com/lwz322/k3screenctrl_build.git feeds/other/lean/k3screenctrl/
#sed -i 's/@TARGET_bcm53xx_DEVICE_phicomm-k3 +@KERNEL_DEVMEM //g' package/lean/k3screenctrl/Makefile
cat feeds/other/lean/k3screenctrl/Makefile |grep DEPENDS
echo '=========Replace k3screen drive plug OK!========='

echo '替换K3的无线驱动为asus-dhd24'
wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.asus-dhd24 -O feeds/other/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#echo '替换K3的无线驱动为ac86u'
#wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.ac88u -O feeds/other/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
#echo '替换K3的无线驱动为69027'
#wget -nv https://github.com/Hill-98/phicommk3-firmware/raw/master/brcmfmac4366c-pcie.bin.69027 -O feeds/other/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
echo '=========Replace k3 wireless firmware OK!========='

#添加主页的CPU温度显示
#sed -i "/<tr><td width=\"33%\"><%:Load Average%>/a \ \t\t<tr><td width=\"33%\"><%:CPU Temperature%></td><td><%=luci.sys.exec(\"sed 's/../&./g' /sys/class/thermal/thermal_zone0/temp|cut -c1-4\")%></td></tr>" feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
#cat feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm |grep Temperature
#echo "Add CPU Temperature in Admin Index OK====================="
