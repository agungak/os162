#!/bin/bash
## (c)2016 Atung Ahmad K -- This is free software
##Dengan bantuan google, stackoverflow dan unix.stackexchange.com
##http://unix.stackexchange.com/questions/20573/sed-insert-something-to-the-last-line
##http://stackoverflow.com/questions/16414410/delete-empty-lines-using-sed
##http://stackoverflow.com/questions/16643288/sed-to-extract-text-between-two-strings
##http://unix.stackexchange.com/questions/33110/using-sed-to-get-rid-of-characters
##############################################################################
## Script ini mengextract  list ranking dari website, dengan cara mengambil text diantara ZCZC dan NNNN
w3m -dump -cols 1000 http://os162.vlsm.org/2016/11/ranking-os162.html | 
sed -n "/ZCZC/,/NNNN/p" | 
sed  "/ZCZC/d" | sed "/NNNN/d" |
sed  "/\[DISK\]/d" |
tr -d '[]' |
awk 'NF'  > ranking.txt
