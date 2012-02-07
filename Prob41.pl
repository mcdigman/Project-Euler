#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub sieve{
	my @nums=(2..10000);
	my @primes;
	while(@nums){
		my $prime=shift @nums;
		if(defined $prime){
			push @primes, $prime;
			for(my $itr=$prime-1; $itr<@nums;$itr+=$prime){
				if(defined $nums[$itr]){
					$nums[$itr]=undef;
				}
			}
		}
	}
	@primes;
}
my @small_primes=sieve;
sub is_prime{
	my $test=shift;
	unless($test%2){
		return 0;
	}
	for(@small_primes){
		if($_**2>$test){
			return 1;
		}
		unless($test%$_){
			return 0;
		}
	}
	1;
}
sub is_pandigital{
	my $num=shift;
	for(1..length $num){
		return 0 unless($num=~/$_/);
	}
	print "$num is pandigital\n";
	return 1;
}
for(my $itr=7654321;$itr>=1; $itr--){
	if(is_pandigital($itr)&&is_prime($itr)){
		print "$itr\n";
		exit;
	}
}