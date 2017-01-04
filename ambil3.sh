#!/bin/bash
for  f in RK-*.txt; do
  cat $f |
  sed -n "/RANKING ULASAN1\/ULASAN2 PESERTA OS 2016-2/,/-------------------------------------------/p" | 
  sed  "/RANKING ULASAN1\/ULASAN2 PESERTA OS 2016-2/d" | sed "/-------------------------------------------/d" |
  sed "s/[\.U\[\]]/ /g" |
  sed -e "s/\-/ /g" |
  awk '{printf("%.02d ",NR,$0)}' > test.txt
  
done 
