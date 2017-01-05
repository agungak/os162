#!/bin/bash
## (c)2016 Atung Ahmad K -- This is free software
## kode ini hanya dicocokan untuk sesuai format yang berlaku dimana  diawali dengan nomor urut dan dipisahkan dengan spasi ex: 01. [U1-01] http:xxx
## kode ini membaca semeua isi file RK-* dan mengubah format AA. [UB-CC] menjadi U B CC AA lalu disimpan ke XHASIL.txt
## lalu XHASIL.txt di sort secara asc dan disimpan di YHASIL.txt
## selanjutnya file YHASIL.txt dimerge apa bila  U X YY * menjadi satu baris. kemudain disimpan di ZHASIL.txt
file="XHASIL.txt"
if [ -f $file ] ; then
    rm $file
fi
for  f in RK-*.txt; do
  cat $f |
  egrep "\[U.*]" |
  awk -F "." '{print $1 " " $2}' |
  awk '{ if (length($2) > 7 ) print $1 " " substr($2,2); else print $1 " " $2 ;}'|
  grep "-" |
  tr -d '[]' |
  sed -e "s/\-/ /g" |
  awk -F "U" '{print $1$2}' |
  awk 'NF' |
  awk '{print "U " $0}' |
  awk 'NR<=40 {printf "%s %s %.2d %.2d\n",$1,$3,$4,$2}' >> XHASIL.txt
done
awk  '{ print $0 }' XHASIL.txt | sort > YHASIL.txt
awk  '{a[$1FS$2FS$3]=a[$1FS$2FS$3]" "$NF } END {for (i in a) print i""a[i]}' YHASIL.txt | sort > ZHASIL.txt
