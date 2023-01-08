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

echo '添加Passwall软件源'
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
cat feeds.conf.default |grep passwall
echo '=========Add feed source OK!========='

echo '添加lwz322的K3屏幕插件'
rm -rf package/luci-app-k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/luci-app-k3screenctrl
echo '=========Add k3screen plug OK!========='

echo '移除bcm53xx中的其他机型'
sed -i '421,453d' target/linux/bcm53xx/image/Makefile
sed -i '140,412d' target/linux/bcm53xx/image/Makefile
sed -i 's/$(USB3_PACKAGES) k3screenctrl/luci-app-k3screenctrl/g' target/linux/bcm53xx/image/Makefile
sed -n '140,146p' target/linux/bcm53xx/image/Makefile
echo '=========Remove other devices of bcm53xx OK!========='
