## (c)2016 Atung Ahmad K -- This is free software
##Dengan bantuan google, stackoverflow dan unix.stackexchange.com
##http://unix.stackexchange.com/questions/20573/sed-insert-something-to-the-last-line
##http://stackoverflow.com/questions/16414410/delete-empty-lines-using-sed
##http://stackoverflow.com/questions/16643288/sed-to-extract-text-between-two-strings
##http://unix.stackexchange.com/questions/33110/using-sed-to-get-rid-of-characters

##simpan file html ke format text
w3m -dump -cols 1000 http://os162.vlsm.org/2016/11/ranking-os162.html | 
## extract text di antara kata ZCZC dan NNNN
sed -n "/ZCZC/,/NNNN/p" | 
## delete ZCZC dan NNNN
sed  "/ZCZC/d" | sed "/NNNN/d" |
## delete line yang mengandung kata [DISK]
sed  "/\[DISK\]/d" |
## insert baris pertama
sed '1 i\========================================================== START BERKAS' |
## insert baris terakhir
sed -e '$a\============================================================ STOP BERKAS' |
## delete bracket []
tr -d '[]' |
## hapus baris kosong jika ada jika selesai output disimpan ke ranking.txt
awk 'NF'  > ranking.txt
