#!/bin/bash
## banyak berkas di blog ranking yang terdaftar tidak sesuai format yang diberikan sebelumnya, maka diperlukan editing terhadap file ranking sebelumnya
## kode ini hanya dicocokan untuk sesuai format yang berlaku dimana  diawali dengan nomor urut dan dipisahkan dengan spasi ex: 01. [U1-01] http:xxx
for  f in RK-*.txt; do
  cat $f |
  egrep "\[U.*]" |
  tr -d '[].' |
  sed -e "s/\-/ /g" |
  sed 's/U/U /g' |
  awk 'NF' |
  awk 'NR<=40 {printf "%s %s %.2d %.2d\n",$2,$3,$4,$1}' >> XHASIL.txt
# awk '{NR = sprintf("%02d",NR); print NR " " $0}' > XHASIL.txt jika tdk ada nomor urutan
done 
awk  '{ print $0 }' XHASIL.txt | sort > YHASIL.txt
awk  '{a[$1FS$2FS$3]=a[$1FS$2FS$3]" "$NF } END {for (i in a) print i""a[i]}' YHASIL.txt | sort > ZHASIL.txt

