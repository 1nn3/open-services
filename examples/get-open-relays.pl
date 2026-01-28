#!/usr/bin/env perl
# https://metacpan.org/pod/XML::LibXML
# https://metacpan.org/pod/XML::LibXML::NodeList
use feature 'say';
use XML::LibXML;
use XML::LibXML::NodeList;
if ( !@ARGV ) {
    die "No files given!";
}
for (@ARGV) {
    open my $fh, '<', $_ or die "Can't open file: $!";
    binmode $fh;
    eval {
        my $dom = XML::LibXML->load_xml( IO => $fh );
        foreach my $node (
            $dom->findnodes(
'//script[@id="smtp-open-relay" and contains(@output, "Server is an open relay (16/16 tests)")]'
            )->get_nodelist
          )
        {
            my $address = $node->find('../../../address/@addr')->to_literal;
            my $port    = $node->find('../@portid')->to_literal;
            my $hostname =
              $node->find('../../../hostnames/hostname[1]/@name')->to_literal;
            say $address, "\t", $port, "\t", $hostname;
        }
    };
    warn $@ if $@;
}
