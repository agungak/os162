#!/bin/bash
## (c)2016 Agung Ahmad K -- This is free software
## kode ini hanya dicocokan untuk sesuai format yang berlaku dimana  diawali dengan nomor urut dan dipisahkan dengan spasi ex: 01. [U1-01] http:xxx
## kode ini membaca semeua isi file RK-* dan mengubah format AA. [UB-CC] menjadi U B CC AA lalu disimpan ke XHASIL.txt
## lalu XHASIL.txt di sort secara asc dan disimpan di YHASIL.txt
## selanjutnya file YHASIL.txt dimerge apa bila  U X YY * menjadi satu baris. kemudain disimpan di ZHASIL.txt

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

