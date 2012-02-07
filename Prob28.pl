#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my $side_limit=1001;
my $sum=1;
my $side=2;
my $itr=1;
while($itr<$side_limit**2){
	for(my $ctrl=0; $ctrl<4; $ctrl++){
		$itr+=$side;
		$sum+=$itr;
	}
	$side+=2;
}
print $sum;