#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub sum{
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
sub is_pandigital{
	my $num=shift;
	return 0 if($num=~/0/);
	return 0 if($num<100000000);
	for(1..length $num){
		return 0 unless($num=~/$_/);
	}
	return 1;
}
my %pandigital_products;
for(my $itr1=4; $itr1<=58; $itr1++){
	for(my $itr2=150; $itr2<=2000; $itr2++){
		my $product=$itr2*$itr1;
		my $catted=$itr1.$itr2.$product;
		if(is_pandigital($catted)&& ! exists $pandigital_products{$product}){
			$pandigital_products{$product}=1;
		}
	}
}
my @pandigital=keys %pandigital_products;
print "@pandigital\n";
print sum @pandigital;