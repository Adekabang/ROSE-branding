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
git clone  https://github.com/Adekabang/RISS-branding.git
cd /root/RISS-branding
```

change file permission for execution

```sh
chmod +x rebrand-cockpit.sh
./rebrand-cockpit.sh
```

```sh
systemctl status cockpit
```

after finish then remove clone folder 
```sh
rm -rf RISS-branding
```
