#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my $num=1;
my $exponent=2**128;
for(my $itr=0; $itr<78304500; $itr+=128){
	$num*=$exponent;
	if(length $num>50){
		$num=substr($num, (length $num)-10, 10);
	}
}
$num*=2**57;
$num*=28433;
$num+=1;
print substr $num, (length $num)-10,10;