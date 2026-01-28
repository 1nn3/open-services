#!/usr/bin/env perl
use feature 'say';
use Geo::IP; # libgeo-ip-perl
my $db = "/usr/share/GeoIP/GeoIP.dat";
my $gi = Geo::IP->open($db, GEOIP_STANDARD);
for (<>) {
    my ($ip, $host, $ports) = split("\t", $_);
    my $code = $gi->country_code_by_addr($ip);
    say "IP: ", $ip, "\t", "Country: ", $code || "n/a";
}

