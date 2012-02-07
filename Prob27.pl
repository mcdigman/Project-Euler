#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
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
my %primes;
my $max_length=0;
my $ans;
$primes{$_}=1 for(@primes);
for(my $itr1=-999; $itr1<1000; $itr1++){
	unless(exists $primes{abs $itr1}){
		next;
	}
	for(my $itr2=-999; $itr2<1000; $itr2++){
		unless(exists $primes{abs $itr2}){
			next;
		}	
		my $count;
		for($count=0; exists $primes{$count**2+$itr1*$count+$itr2}; $count++){
			1;
		}
		if($count>$max_length){
			$max_length=$count;
			$ans=$itr1*$itr2;
		}
	}
}
print "$max_length $ans\n";