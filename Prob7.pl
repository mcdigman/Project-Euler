#! usr/bin/perl
#Matthew Digman
use strict;
my @nums=(2..200000);
my @primes;
while(@primes<10001){
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
print pop @primes;