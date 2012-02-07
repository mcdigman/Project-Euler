#! usr/bin/perl
#Matthew Digman
use bigint;
use strict;
use warnings;
my $count=0;
OUTER:for(my $itr1=1; $itr1<10000; $itr1++){
	my $num1=$itr1;
	for(my $itr2=0; $itr2<50; $itr2++){
		my $num2=reverse $num1;
		$num2=~s/^0*//;
		$num1+=$num2;
		if($num1==reverse $num1){
			next OUTER;
		}
	}
	$count++;
}
print $count;