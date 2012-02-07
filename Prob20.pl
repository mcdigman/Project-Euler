#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my $num1=1;
my $num2=1;
my $depth=2;
while(length $num2<1000){
	my $temp=$num1;
	$num1=$num2;
	$num2=$num1+$temp;
	$depth++;
}
print "$num2\n$depth\n";