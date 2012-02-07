#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub sieve{
	my @nums=(2..10000000);
	my %primes;
	while(@nums){
		my $prime=shift @nums;
		if(defined $prime){
			$primes{$prime}=1;
			for(my $itr=$prime-1; $itr<@nums;$itr+=$prime){
				if(defined $nums[$itr]){
					$nums[$itr]=undef;
				}
			}
		}
	}
	%primes;
}

sub sum{
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
my %primes=sieve;
sub prime_cat{
	my $test=shift;
	my @known=@_;
	for(@known){
		return 0 unless(&is_prime($test.$_)&& &is_prime($_.$test));
	}
	return 1;
}
my @base=();
my @primes=sort{$a<=>$b} keys %primes;
sub is_prime{
	my $test=shift;
	return 1 if($test==2);
	if($test<$primes[-1]){
		return 1 if(exists $primes{$test});
		return 0;
	}
	return 0 unless($test%2);
	for(my $itr=3; $itr<sqrt $test; $itr+=2){
		unless($test%$itr){
			return 0;
		}
	}
	1;
}
for(my $itr1=1; $primes[$itr1]<10000; $itr1++){
	my @base1=($primes[$itr1]);
	#print "@base1\n";
	for(my $itr2=$itr1+1; $primes[$itr2]<10000; $itr2++){
		my @base2=($primes[$itr2],@base1);
		next unless(prime_cat(@base2));
	#	print "@base2\n";
		for(my $itr3=$itr2+1; $primes[$itr3]<10000; $itr3++){
			my @base3=($primes[$itr3],@base2);
			next unless(prime_cat(@base3));
			#print "@base3\n";
			for(my $itr4=$itr3+1; $primes[$itr4]<10000; $itr4++){
				my @base4=($primes[$itr4],@base3);
				next unless(prime_cat(@base4));
			#	print "@base4\n";
				for(my $itr5=$itr4+1; $primes[$itr5]<10000; $itr5++){
					my @base5=($primes[$itr5],@base4);
					next unless(prime_cat(@base5));			
					print "@base5 for sum ",sum(@base5),"\n";
					exit;
				}
			}
		}
	}
}
print "unable to find sequence with current conditions\n";