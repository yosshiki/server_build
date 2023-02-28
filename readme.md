# linux commands reference  
## prompt / if / for / while / case / select
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
hello, world.
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
\### a ###  
hello a  
\### b ###   
hello b  
\### c ###  
hello c  

## while
monitor command result with log ≒ watch
```
while :; do ls -l;sleep 2;echo; done
```
### if line with space
```
COMMAND | while read line; do echo ${line}; done
```
```
echo "aaa bbb  
ccc" | while read line; do echo ${line}; done
```
aaa bbb  
ccc

```
echo -e "aaa\nbbb" |while read line; do echo "### ${line} ###"; done
```
\### aaa ###  
\### bbb ###
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
A  
```
A=b;case $A in "a") echo A ;; "b") echo B ;; esac
```
B  
## comment out
```
<< COMMENTOUT
echo "Hi, Jiro!"
echo "Hi, Saburo!"
COMMENTOUT
```
(no output)

## select
```
echo '#!/bin/bash
# single columned
COLUMN=1
PS3="select your answer: "
select VAR in "aaa AAA" \
"bbb BBB" \
"ccc CCC" \
"ddd DDD" \
"eee EEE"
do
    echo ${REPLY}")" ${VAR}
    exit
done' > select.sh
chmod 755 select.sh
./select.sh
```
1\) aaa AAA  
2\) bbb BBB  
3\) ccc CCC  
4\) ddd DDD  
5\) eee EEE  
select your answer: 2  
2\) bbb BBB  

