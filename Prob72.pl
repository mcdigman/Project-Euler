#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my %factors;
sub sieve{
	my @nums=(2..8);
	my @primes;
	while(@nums){
		my $prime=shift @nums;
		if(defined $prime){
			push @primes, $prime;
			for(my $itr=$prime-1; $itr<=8;$itr+=$prime){
				push @{$factors{$itr+1}}, $prime;
				if(defined $nums[$itr]){
					$nums[$itr]=undef;
				}
			}
			my $power=$prime*$prime;
			while ($power<=8){
				for(my $itr=$power; $itr<=8; $itr+=$power){
					push @{$factors{$itr}},$prime;
				}
				$power*=$prime;
			}
		}
	}
	@primes;
}
sub combine_like{
	my @nums=keys %factors;
	for(@nums){
		my @factors=@{$factors{$_}};
		my @new_factors;
		for(my $itr=0; $itr<@factors; $itr++){
			my $factor=$factors[$itr];
			my $new_factor=$factors[$itr];
			while(defined $factors[$itr+1]&&$factors[$itr+1]==$factor){
				$itr++;
				$new_factor*=$factor;
			}
			push @new_factors, $new_factor;
		}
		$factors{$_}=\@new_factors;
	}
	1;
}
my @nums=(0,1);
my @primes=sieve;
print "sieve complete\n";
combine_like;
print "like terms combined\n";
my %primes;
$primes{$_}=1 for(@primes);
print "primes numbers calculated\n";
for(@primes){
	$nums[$_]=$_-1;

	my $num1=$_;
	my $num2=$_**2;
	while($num2<=8){
		$nums[$num2]=$num2-$num1;
		$num1*=$_;
		$num2*=$_;
	}
}
print "Powers and Primes done\n";
for(my $itr1=1; $itr1<=8; $itr1++){
	if(!defined $nums[$itr1]){
		my $tot=1;
		my @factors=@{$factors{$itr1}};
		for(@factors){
			$tot*=$nums[$_];
		}
		$nums[$itr1]=$tot;
	}
}
print "Initiating sum\n";
sub sum{
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
print sum (@nums);
	