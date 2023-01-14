# **K3-OpenWrt-Firmware-Action** [Please Star⚝ ↗]
Phicomm K3 OpenWrt Firmware CI by Github Actions  
[![LICENSE](https://img.shields.io/badge/license-apache--2.0-green.svg?style=flat-square&label=LICENSE)](https://github.com/yangxu52/K3-OpenWrt-Firmware-Action/blob/main/LICENSE)&nbsp;
![GitHub Stars](https://img.shields.io/github/stars/yangxu52/K3-OpenWrt-Firmware-Action.svg?style=flat-square&label=Stars&logo=github)&nbsp;
![GitHub Forks](https://img.shields.io/github/forks/yangxu52/K3-OpenWrt-Firmware-Action.svg?style=flat-square&label=Forks&logo=github)
&emsp;
## **1. Instruction | 介绍**  
### **1.1 Source Code | 源码使用**  

- [LEDE @coolsnowwf](https://github.com/coolsnowwolf/lede)  

- [Application passwall @xiaoruoji](https://github.com/xiaorouji/openwrt-passwall ) 

- [Luci theme Argon @jerrykuku](https://github.com/jerrykuku/luci-theme-argon)  

- [K3 Screen Deive and Controller @lwz322](https://github.com/lwz322/k3screenctrl_build)  

- ······  

### **1.2 Major Modifications | 主要修改**  

- **Remove all USB support**  
USB interface only has charging function. **Important !**  

- **Network Turbo ACC**  
Base on Qualcomm Short-FE, significantly improve forwarding ability. 

- **Add IPv6 full support**  

- **Add Phicoomm K3's LCD screen full support**  

- **Add UPNP & DDNS support**  

- **Add KMS Server**  

- **Add Syncdial & mwan3**  
Support multi-wan access and load balancing,suport PPPoE and others.   

- **Add ~~Passwall~~** proxy  
Only include Xray-core, so only support vmess,vless and trojan protocol.  

- **Add ServerChan**  
Send a router status through the WeChat official account (named "方糖")  

- **Add UnblockNeteaseMusic**   
Use others repository to unblock music which can't listen in Netease Music.

- **Add WiFi Schedule**  
Schedule open/close wireless feature through un/mount wireless k-mod.  

- **Others**  
&emsp;

## **2. Use Guide | 使用指南**  
### **2.1 Language | 语言**  
1.Open [Web Admin](http://192.168.1.1) (default: 192.168.1.1) in your browser and login (default: `root` `password`).  
2.Open Menu `(系统|System)` -> `(系统|System)`, swith tab `(语言和界面|Language and Style)`  
3.Change the `Language` select's option. (auto=English)  
4.Click the `(保存&应用|SAVE&APPLY)` button to save. Finally,refresh browser.   
&emsp;

### **2.2 Wireless Power | 无线功率**  
1.Open [Web Admin](http://192.168.1.1) (default: 192.168.1.1) in your browser and login (default: `root` `password`).  
2.Open Menu `(系统|System)` -> `(启动项|Startup)`, slide to the bottom.  
3.Add some shell command in `(本地启动脚本|Local Startup Script)`, before `exit 0`  
```shell
iwconfig wlan0 txpower 23
iwconfig wlan1 txpower 23
```  
The `wlan0` represent 2.4G,`wlan1` represent 5G. `23` reresent submit power (max:`31`).  
Recommend: Between `23` and `27`.Power is proportional to signal and inversely proportional to wireless throughput.  
4.Click the `(保存&应用|SAVE&APPLY)` button to save. Finally,refresh browser.  
&emsp;

### **2.3 Network Turbo ACC | 网络加速**  
1.Open [Web Admin](http://192.168.1.1) (default: 192.168.1.1) in your browser and login (default: `root` `password`).  
2.Open Menu (网络|Network) -> (Turbo ACC Center|Turbo ACC 网络加速).  
3.Selected the `Shortcut-FE flow offloading | Shortcut-FE 流量分载` and `BBR CCA | BBR 拥塞控制算法`.Change `FullCone NAT | 全锥型 NAT`'s Option to `High Performing Mode | 高性能模式`  
4.Click the `(保存&应用|SAVE&APPLY)` button to save.  
&emsp;

## **3. Tanks | 致谢**
- [coolsnowwolf](https://github.com/coolsnowwolf) [Lienol](https://github.com/Lienol) [jerrykuku](https://github.com/jerrykuku) [lwz322](https://github.com/lwz322) [P3TERX](https://github.com/P3TERX)
- Others
