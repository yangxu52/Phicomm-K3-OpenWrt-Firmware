#!/bin/bash

#
#Copyright 2022 yangxu52<https://github.com/yangxu52>
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

#修改NTP设置
#sed -i "s/'0.openwrt.pool.ntp.org'/'ntp1.aliyun.com'/g" package/base-files/files/bin/config_generate
#sed -i "s/'1.openwrt.pool.ntp.org'/'ntp2.aliyun.com'/g" package/base-files/files/bin/config_generate
#sed -i "s/'2.openwrt.pool.ntp.org'/'ntp3.aliyun.com'/g" package/base-files/files/bin/config_generate
#sed -i "s/'3.openwrt.pool.ntp.org'/'ntp4.aliyun.com'/g" package/base-files/files/bin/config_generate
#cat package/base-files/files/bin/config_generate |grep system.ntp.server=
#echo 'Alert NTP Settings OK!====================='

echo '修改主机名'
sed -i "s/hostname='OpenWrt'/hostname='Phicomm-K3'/g" package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Alert hostname OK!========='

echo '移除主页跑分信息显示'
sed -i 's/ <%=luci.sys.exec("cat \/etc\/bench.log") or ""%>//g' package/lean/autocore/files/arm/index.htm
echo '=========Remove benchmark display in index OK!========='

echo '移除主页日志打印'
sed -i '/console.log(mainNodeName);/d' package/lean/luci-theme-argon/htdocs/luci-static/argon/js/script.js
echo '=========Remove log print in index OK!========='

echo '修改upnp绑定文件位置'
sed -i 's/\/var\/upnp.leases/\/tmp\/upnp.leases/g' feeds/packages/net/miniupnpd/files/upnpd.config
cat feeds/packages/net/miniupnpd/files/upnpd.config |grep upnp_lease_file
echo '=========Alert upnp binding file directory!========='

#添加主页的CPU温度显示
#sed -i "/<tr><td width=\"33%\"><%:Load Average%>/a \ \t\t<tr><td width=\"33%\"><%:CPU Temperature%></td><td><%=luci.sys.exec(\"sed 's/../&./g' /sys/class/thermal/thermal_zone0/temp|cut -c1-4\")%></td></tr>" feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
#cat feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm |grep Temperature
#echo "Add CPU Temperature in Admin Index OK====================="
