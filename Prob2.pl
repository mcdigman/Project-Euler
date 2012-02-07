#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my $first=1;
my $second=2;
my $sum=2;
while($second<=4000000){
	for(0..2){
		my $temp=$second;
		$second=$first+$second;
		$first=$temp;
	}
	if($second<=4000000){
		$sum+=$second;
	}
}
print $sum;