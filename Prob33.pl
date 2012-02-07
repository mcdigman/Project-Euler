#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub unorthodox_cancel{
	my $num1=shift;
	my $num2=shift; 
	if($num1==$num2){
		return 10;
	}
	if(substr ($num1, 0,1)==substr $num2,1,1){
		return ((substr $num1,1,1)/(substr $num2,0,1));
	}
	if(substr ($num2,0,1)==0){
		return 1;
	}
	if((substr ($num1, 1,1)==substr ($num2,0,1))&&substr($num2,1,1)!=0){
		return ((substr ($num1,0,1))/(substr ($num2,1,1)));
	}
	if(substr ($num1, 0,1)==substr $num2,0,1){
		return ((substr $num1,0,1)/(substr $num2,0,1));
	}
	return 10;
}
my @nums;
my $num_product=1;
my @denoms;
my $denom_product=1;
print unorthodox_cancel(49,98);
for(my $num=10; $num<99; $num++){
	for(my $denom=11; $denom<100; $denom++){
		if($denom<=$num){
			next;
		}
		if(unorthodox_cancel($num,$denom)==$num/$denom){
			$num_product*=$num;
			$denom_product*=$denom;
			push @nums, $num;
			push @denoms, $denom;
		}
	}
}
print "@nums\n@denoms\n\n$num_product\n$denom_product\n";
		