#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
open FILE, "<Primes1m.txt" or die "unable to read primes";
my @primes=split ' ', <FILE>;
my %all;
for(my $itr1=0; $itr1<910; $itr1++){
	my $num=$primes[$itr1]**2;
	last if($num>=50000000);
	for(my $itr2=0; $itr2<73; $itr2++){
		my $num2=$num+($primes[$itr2]**3);
		last if($num>=50000000);
		for(my $itr3=0; $itr3<23; $itr3++){
			my $num3=$num2+($primes[$itr3]**4);
			last if($num3>=50000000);
			$all{$num3}=1;
		}
	}
}
my @keys=keys %all;
print $#keys;