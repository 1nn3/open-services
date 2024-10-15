Find open services

Nmap scan and scripts to evaluating the resutls for searching open
mail-relays, HTTP- and SOCKS-proxys and anonymous FTP.

# start the scan
shuf ./targets.txt | nice xargs -I{} -P8 ./scan {}

# watch the progress
watch ./show-progress

# evaluating the results; this creates the found-*.txt files
./evaluating-results
tail -f found-*.txt

NOTES

* https://en.wikipedia.org/wiki/Email_spoofing
* http://www.jetmore.org/john/code/swaks/
* cut -f 1 found-ftp-anon.txt | xargs -I{} ./lsftp {} >topsites.txt 2>&1 # grep <RE> topsites.txt

