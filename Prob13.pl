#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bignum;
open FILE, 'Numbers.txt' or die "unable to open file: $!";
my $sum;
for(<FILE>){
	chomp;
	$sum+=$_;
}
print substr( $sum, 0, 15),"\n";