#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
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
my @small_primes;
my $test=600851475143;
for(my $itr=3; $itr<sqrt $test; $itr+=2){
	if(is_prime $itr){
		push @small_primes, $itr;
	}
}
my @confirmed;
for(@small_primes){
	unless($test%$_){
		push @confirmed, $_;
		if(is_prime($test/$_)){
			print $test/$_,"\n";
		}
	}
}
@confirmed=sort {$a<=>$b} @confirmed;
print (pop @confirmed);

	