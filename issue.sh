#/bin/bash
rm -rf /etc/issue
echo "gby custom image" >> /etc/issue
for i in `ip add |grep ens| grep mtu|  awk  '{print  $2}'  | cut -d ':' -f  1`; do echo $i=`ip add |grep inet  |grep $i |awk  '{print  $2}' `; done >>/etc/issue
