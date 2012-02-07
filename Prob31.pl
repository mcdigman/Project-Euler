#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @denom=(1,5,10,25,50,100,200);
my @ways=(1);
for(@denom){
	for(my $itr=$_;$itr<=200; $itr++){
		$ways[$itr]+=$ways[$itr-$_];
	}
}
print "$ways[200]\n";