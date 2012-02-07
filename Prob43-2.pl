#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use List::Permutor;
my $perm=new List::Permutor (0..9);
my $sum;
my @small_primes=(0,2,3,5,7,11,13,17);
for(my $itr=0; $itr<362880; $itr++){
	$perm->next;
}
OUTER:while(1){
	my @num=$perm->next;
	my $num=join '', @num;
	last if(length $num!=10);	
	for(my $itr=7; $itr>0; $itr--){
		my $substring=substr ($num,$itr,3);
		next OUTER if($substring%$small_primes[$itr]);
	}
	$sum+=$num;
}
print $sum;