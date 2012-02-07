#! usr/bin/perl
#Matthew Digman
use bigint;
use strict;
use warnings;
my $num=2**1000;
my $sum;
for(0..(length $num)-1){
	$sum+=substr $num, $_,1;
}
print $sum;
