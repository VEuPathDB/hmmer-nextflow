#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

my ($input,$output);

&GetOptions("input=s"=> \$input,
            "output=s"=> \$output);

open(my $data, '<', $input) || die "Could not open file $input: $!";
open(OUT,">$output");

while (my $line = <$data>) {
    chomp $line;
    if ($line =~ /^#/) {
        next;
    }
    print OUT "$line\n";
}	
