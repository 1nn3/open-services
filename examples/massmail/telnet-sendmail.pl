#!/usr/bin/perl
# swaks --to "<rcpt>" --server <addr> --body @/tmp/message

use Env;
use Getopt::Std;
$Getopt::Std::STANDARD_HELP_VERSION = 1;
use File::Temp;
my ($fh, $filename) = File::Temp::tempfile();
use Net::Telnet;

our %opts;
# read the command-line-options
getopts( "", \%opts )
    || die "Error on processing of command-line-options";

my $t = new Net::Telnet (Timeout => 10, Input_log => $filename );
$t->errmode("die");

$t->open(Host => $ARGV[0], Port => 25);
if ($t->errmsg){
    die $t->errmsg;
}

for (<DATA>) {
    #my $ok = $t->put($_);
    my @lines = $t->cmd($_);
    print @lines;
}

# Register an END block to delete the file at program exit
END {
    unlink $filename if -e $filename;
}

# Telnet AUTH method (PLAIN LOGIN DIGEST-MD5 CRAM-MD5): using CRAM-MD5
__DATA__
EHLO example.com
AUTH CRAM-MD5
MAIL FROM:<johndoe@anonymous.net>
RCPT TO:<user@example.net>
DATA
Subject: Anonymous
From: "Anonymous" <johndoe@anonymous.net>
To:
.
QUIT

