#!/bin/bash
## (c)2016 Atung Ahmad K -- This is free software
## Dengan bantuan google, stackoverflow
## http://stackoverflow.com/questions/3061036/how-to-find-whether-or-not-a-variable-is-empty-in-bash-script
## http://stackoverflow.com/questions/11162049/using-a-count-variable-in-a-file-name-bash
## https://www.cyberciti.biz/faq/bash-for-loop-array/
#########################################################
## Script ini mengambil kata ke 2(ID) dan ke 3(LINK) dari file ranking.txt
## lalu mengecheck apakah link bisa di dump atau tidak,
## jika  bisa maka hasil dump dimasukan ke RK-XX.txt, jika gagal buat file text kosong RK-XX-GAGAL.txt
ID="$(awk '{print $2}' ranking.txt)"
LINK="$(awk '{print $3}' ranking.txt)"
arrID=()
arrLINK=()
for val in $ID ; do
   arrID+=("$val")
done
for val2 in $LINK ; do
   arrLINK+=("$val2")
done
for  (( i=0; i<${#arrID[@]}; i++ )) ; do 
       var="$(w3m -dump ${arrLINK[i]})"
       if [ -z "$var" ]; then
	  touch "${arrID[i]}-GAGAL.txt"
       else
       w3m -dump -cols 1000 ${arrLINK[i]} > "${arrID[i]}.txt" 
       fi 	  
done 
