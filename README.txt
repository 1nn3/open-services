Find open services

Nmap Skriptscan und Skripte, um den Scan auszuwerten. Dabei wird nach
offenen Mail-Relays, HTTP- und SOCKS-Proxys gesucht.

# Scan starten
nice xargs -a ./targets.txt -I{} -P8 ./find-open-services {}

# Fortschritt anzeigen
watch ./show-progress

# Resultate auswerten
find ./results -empty -delete
./eval-results
tail -f found-* # Output verfolgen

NOTES

* https://en.wikipedia.org/wiki/Email_spoofing
* http://www.jetmore.org/john/code/swaks/

