#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub sum{
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
sub sieve{
	my @nums=(2..1000000);
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
my @primes=sieve;
my %primes=map{$_=>1} @primes;
shift @primes for(1..4);
my @truncatable;
OUTER:for(@primes){
	my $prime=$_;
	for(1..(length $prime)-1){
		unless(exists $primes{substr ($prime, 0,(length ($prime)-$_))}){
			next OUTER;
		}
		unless(exists $primes{substr ($prime,$_,(length( $prime)-$_))}){
				next OUTER;
		}
	}
	push @truncatable, $prime;
}
print "@truncatable\n";
print sum @truncatable;