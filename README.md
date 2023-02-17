> **Note**
> Backup All config before rebrand the software


## Cockpit Rebrand

Make Sure that Cockpit already installed and running
```sh
sudo dnf install cockpit -y
systemctl status cockpit
```


```sh
cd /root
pkg install -y git bash vim
git clone --branch rebrand-only https://github.com/Adekabang/RISS-isg.git
cd /root/RISS-isg
```

if you want only RISS
```sh
mv images/default-logo-original.svg images/default-logo.svg
```

change file permission for execution

```sh
chmod 777 rebrand.sh
./rebrand.sh
```

```sh
reboot
```

after finish then remove clone folder (keep if you want to auto rebrand after update)
```sh
rm -rf RISS-isg
```

## UI Messy after Rebrand
you can open /conf/config.xml and edit some line
```sh
vim /conf/config.xml

# change this line
<theme>opnsense</theme>
# to this
<theme/>
```

## How to Update
### Before Update
SSH or Console to RISS ISG and execute:
```sh
sed -i '' -e 's|"product_id":.*|"product_id": "opnsense"|,' /usr/local/opnsense/version/core 
sed -i '' -e 's|enabled: no|enabled: yes|' /usr/local/etc/pkg/repos/OPNsense.conf
```

### Execute update via WEB GUI or CLI
WEB GUI
```sh
https://<IP:port>/ui/core/firmware#updates
```
or

CLI via Console or SSH
```sh
Enter an option: 12
```

### After Update
SSH or Console to RISS ISG and execute:
```sh
sed -i '' -e 's|"product_id":.*|"product_id": "RISS-ISG"|,' /usr/local/opnsense/version/core 
sed -i '' -e 's|enabled: yes|enabled: no|' /usr/local/etc/pkg/repos/OPNsense.conf
reboot
```
