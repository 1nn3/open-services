#!/usr/bin/awk -f
function join(arr, sep, out, k) {
    for (k in arr)
        out = out (out ? sep : "") arr[k]
    return out
}
function trim(s) {
    sub(/^[[:space:]]+/, "", s)
    sub(/[[:space:]]+$/, "", s)
    return s
}
/^[[:space:]]*$/ {
	ports_begin = 0
}
/^Nmap scan report for/ {
	split($0, a, /[[:space:]]+/)
	if (length(a) > 5) {
		hostname=a[5]
		ip=substr(a[length(a)], 2, length(a[length(a)])-2)
	} else {
		ip=a[5]
	}
}
/^PORT[[:space:]]+STATE[[:space:]]+SERVICE$/ {
	delete ports
	ports_begin = 1
}
{
	if(ports_begin) {
		split($0, a, /[[:space:]]+/)
		if (a[2]=="open") {
			split(a[1], port, "/")
			ports[length(ports)+1] = port[1]
		}
	}
}
/ftp-anon:/ && /Anonymous FTP login allowed/ {
	ports_begin = 0
	print trim(ip), "\t", trim(hostname), "\t", join(ports, " ")
}
