> **Note**
> Backup All config before rebrand the software

> **Note**
> This Script already tested on Rocky 8.6-8.7

> **Warning**
> This Script Contain modification on /etc/os-release. Check this file when update something


## Cockpit Rebrand

Make Sure that Cockpit already installed and running
```sh
sudo dnf install cockpit -y
systemctl status cockpit
```


```sh
cd ~
git clone  https://github.com/Adekabang/RISS-branding.git
cd ~/RISS-branding
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
