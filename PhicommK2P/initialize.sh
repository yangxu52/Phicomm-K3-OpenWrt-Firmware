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

echo '添加passwall软件源'
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
cat feeds.conf.default
echo '=========Add feed source OK!========='

echo '添加small-5的adblock-plus插件'
rm -rf package/lean/luci-app-adblock-plus
git clone -b 18.06 https://github.com/small-5/luci-app-adblock-plus.git package/lean/luci-app-adblock-plus
echo '=========Add adblock-plus OK!========='
