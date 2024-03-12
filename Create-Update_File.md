# txt
## echo
```
ls file01.txt  
echo aaa > file01.txt  
cat file01.txt  
```

## echo 2
```
ls file02.txt  
echo "aaa
bbb
ccc" > file02.txt  
cat file02.txt  
```


## cat
```
ls file03.txt  
cat <<EOL >> file03.txt
line 1
line 2
line 3
EOL
cat file03.txt
```

## cat with variable
```
ls file04.txt  
USERNAME=AAA
PASSWORD=BBB
cat <<EOL >> file04.conf
user=${USERNAME}
pass=${PASSWORD}
cat file04.txt
EOL
```

## cat without variable
```
ls file05.conf
USERNAME=AAA
PASSWORD=BBB
cat <<'EOL' >> file05.conf
user=${USERNAME}
pass=${PASSWORD}
cat file05.conf
EOL
```



# script
```
ls script01.sh  
cat <<EOL >> script01.sh
!#/bin/bash
line 1
line 2
line 3
EOL
cat script01.sh
```
