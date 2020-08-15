#!/system/bin/sh

[ "$(whoami)" != "root" ] && { echo "root required"; exit 1; }
config=/data/misc/wifi/WifiConfigStore.xml
SSID=($(grep 'name="SSID"' $config | sed "s/.*>&quot;//;s/&quot;.*//;s/ /-_-/g"))
PSK=($(grep 'name="PreSharedKey"' $config | sed "s/<null.*/\e[01;30mNONE\e[00;37;40m/;s/.*>&quot;/\e[01;32m/;s/&quot;.*/\e[00;37;40m/;s/ /-_-/g"))

echo -e "\033[91mWiFi_Password_Viewer			\033[92mCreated_By :\033[34mAl_Tasin"
echo -e ''
echo -e 'Wifi_Pass-list'
for i in ${!SSID[@]}; do
  echo "\e[01;37m${SSID[$i]}\e[00;37;40m - ${PSK[$i]}" | sed "s/-_-/ /g"
done
