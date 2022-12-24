# linux commands reference  
## prompt / if / for / while / case 
## basic commands
- hardware
  - dmidecode / fdisk / lspci / lshw / dmesg
- system
  - uname / hostnamectl / shutdown / reboot / uptime / service / systemctl / su / sudo / getenforce / journalctl / sosreport
- time
  - date / timedatectl / localectl / chronyc
- package manage
  - rpm / dpkg / yum / dnf
- storage
  - pvdisplay / lvdisplay / df / (u)mount / fuse / lsblk
- directory control
  - pwd / cd / mkdir / rmdir / ls / du
- file control
  - file / cat / head / tail / vi / view / less / more / find / rm / tee / (un)zip / chmod / 
- process
  - crontab / grep / awk / sed / tr / cut / wc / diff / sort / unique
- network control
  - ip / traceroute / tcpdump / nc / nmap / ss / netstat / nmap
- DNS
  - nslookup / dig / whois
- web
  - curl / wget
- shell
  - ssh / export / sh / xargs / eval
## unit test shell
## server_build
- Web
- NFS(NFS/CIFS)
- DB
- DNS
- LDAP

## prompt
if prompt displays "sh-4.2 $" (ex. Amazon EC2)  
```
export PS1="[\u@\h \W] $ "
```
ex. 
```
sh-4.2$ export PS1="\n[\u@\h \W] $ "
[ssm-user@ip-10-99-99-12 bin] $
```

## if
```
A=B
if [ $A = "B" ]; then
  echo "hello, world."
fi
```
```
if [ $A = "B" ]; then echo "hello, world."; fi

```
## for
```
A="a 
b 
c "
for i in $A
do 
    echo "### $i ###"
    echo "hello $i"
done
```
```
for i in $A; do echo "### $i ###"; echo "hello $i "; done
```
## while
```
while :; do ls -l;sleep 2;echo; done
```
```
echo -e "aaa\nbbb" |while read line; do echo "### ${line} ###"; done
```
## case
```
A=a
case $A in
    "a")
        echo A ;;
    "b")
        echo B ;;
esac
```
```
case $A in "a") echo A ;; "b") echo B ;; esac
```
## comment out
```
<< COMMENTOUT
echo "Hi, Jiro!"
echo "Hi, Saburo!"
COMMENTOUT
```
