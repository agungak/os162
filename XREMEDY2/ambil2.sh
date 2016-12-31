#!/bin/bash
## (c)2016 Atung Ahmad K -- This is free software
##Dengan bantuan google, stackoverflow
##http://stackoverflow.com/questions/3061036/how-to-find-whether-or-not-a-variable-is-empty-in-bash-script
##http://stackoverflow.com/questions/11162049/using-a-count-variable-in-a-file-name-bash
##https://www.cyberciti.biz/faq/bash-for-loop-array/

##assign variable mengambil  kata ke 2(ID) dan ke 3(LINK)
ID="$(awk '{print $2}' ranking.txt)"
LINK="$(awk '{print $3}' ranking.txt)"
##assign variable kosong
arrID=()
arrLINK=()
##mengisi arrID dengan ID
for val in $ID ; do
   arrID+=("$val")
done
##mengisi arrLINK dengan LINK
for val2 in $LINK ; do
   arrLINK+=("$val2")
done

##mengechek semua id apakah bisa di dump atau tidak
##apabila tidak bisa didump akan membuat file txt kosong RK-XX-GAGAL.txt
##jika bisa didump, hasil dump tersebut diisi ke file txt RK-XX.txt 
for  (( i=0; i<${#arrID[@]}; i++ )) ; do 
       var="$(w3m -dump ${arrLINK[i]})"
       if [ -z "$var" ]; then
	  touch "${arrID[i]}-GAGAL.txt"
       else
       w3m -dump -cols 1000 ${arrLINK[i]} > "${arrID[i]}.txt" 
       fi 	  
done 
