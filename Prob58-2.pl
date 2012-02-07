#! usr/bin/perl
#Matthew Digman
use warnings;
use strict;
sub is_prime{
	my $test=shift;
	unless($test%2){
		return 0;
	}
	for(my $itr=3; $itr<sqrt $test; $itr+=2){
		unless($test%$itr){
			return 0;
		}
	}
	1;
}
my $prime_counter=1;
my $itr;

for($itr=1; $prime_counter>=(.4*$itr+.1);$itr++){
	$prime_counter-- if($itr==1);
	my ($num1,$num2,$num3)=((4*$itr**2+2*$itr+1),(4*$itr**2+1),(4*$itr**2-2*$itr+1));
	$prime_counter++ if(is_prime($num1));
	$prime_counter++ if(is_prime($num2));
	$prime_counter++ if(is_prime($num3));
}
print 2*$itr+1;	