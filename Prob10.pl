#! usr/bin/perl
#Matthew Digman
use strict;
my @nums=(2..2000000);
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
my $sum;
$sum+=$_ for(@primes);
print $sum;