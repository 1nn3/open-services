#!/usr/bin/env perl
use feature 'say';
use GeoIP2::Database::Reader; # libgeoip2-perl
my $reader = GeoIP2::Database::Reader->new(
    file => '/usr/share/GeoIP/GeoLite2-Country.mmdb'
);
for (<>) {
    my ($ip, $host, $ports) = split("\t", $_);
    my $country = $reader->country( ip => $ip );
    say "IP: ", $ip, "\t", "Country: ", $country->country->iso_code;
}

