#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @nums=(11..20);
my @primes=(2,3,5,7,11,13,17,19);
my $prime_product=1;
$prime_product*=$_ for(@primes);
my $product=1;
$product*=$_ for (@nums);
print "$product\n";
print "$prime_product\n";
for(my $itr=$prime_product; $itr<=$product; $itr+=$prime_product){
	for(@nums){
		if($itr%$_){
			last;
		}
		if($_==20){
			print "$itr\n";
			exit;
		}
	}
}
print "$product\n";