#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @denom=(1..99);
my @ways=(1);
for(@denom){
	for(my $itr=$_;$itr<=100; $itr++){
		$ways[$itr]+=$ways[$itr-$_];
	}
}
print "$ways[100]\n";