#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my $sum;
my $num;
for(my $itr=1; $itr<=1000; $itr++){
	$sum+=$itr**$itr;
}
print "$sum\n";
my $start=(length $sum)-10;
print substr($sum,$start,10),"\n";