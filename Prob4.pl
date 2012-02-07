#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %nums;
for(my $num1=100; $num1<1000; $num1+=1){
	for(my $num2=100; $num2<1000; $num2+=1){
	my $product=$num1*$num2;
		$nums{($product)}="$num1 $num2";
	}
}
my @nums=sort{$a<=>$b} keys %nums;
for(@nums){
	if($_==reverse $_){
		print "$_ $nums{$_}\n";
	}
}