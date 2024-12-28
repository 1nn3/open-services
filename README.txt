Find open services

Nmap scan and scripts to evaluating the resutls for searching open
mail-relays, HTTP- and SOCKS-proxys and anonymous FTP server.

# start a tmux session and scan
./tmux.sh

# evaluating the results; this creates the found-*.txt files
./evaluating-results

tail -f found-*.txt

NOTES

http://www.jetmore.org/john/code/swaks/
cut -f 1 found-ftp-anon.txt | xargs -I{} ./lsftp {} >topsites.txt 2>&1 # | grep <RE> topsites.txt

Find Nmap zombies

https://nmap.org/book/idlescan.html
https://nmap.org/nsedoc/scripts/ipidseq.html
https://nmap.org/presentations/CanSecWest03/CD_Content/idlescan_paper/idlescan.html
https://www.oreilly.com/library/view/nmap-network-exploration/9781786467454/5b607ce9-fe67-46ac-9a19-ccc17506f26c.xhtml
https://www.rapid7.com/db/modules/auxiliary/scanner/ip/ipidseq/

