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
my @primes=sieve;
my %primes;
for(@primes){
	$primes{$_}=1;
}
my @odd_comp;
for(3..10000){
	if($_%2){
		unless(exists $primes{$_}){
			push @odd_comp, $_;
		}
	}
}
for(@odd_comp){
	my $num=$_;
	my $found;	
	for(1..100){
		last if($_>$num-1);
		if(exists $primes{$num-2*($_**2)}){
			$found=1;
			last;
		}
	}
	unless(defined $found){
		print "$num\n";
		last;
	}
}
print "done\n";
