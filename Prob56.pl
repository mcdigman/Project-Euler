#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
sub sum{
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
my $max_sum=0;
for(my $base=1; $base<100; $base++){
	for(my $exponent=1; $exponent<100; $exponent++){
		my $num=$base**$exponent;
		my $sum=sum(split '', $num);
		if($sum>$max_sum){
			$max_sum=$sum;
		}
	}
}
print $max_sum;