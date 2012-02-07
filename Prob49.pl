#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub sieve{
	my @nums=(2..9999);
	my %primes;
	while(@nums){
		my $prime=shift @nums;
		if(defined $prime){
			$primes{$prime}=undef;
			for(my $itr=$prime-1; $itr<@nums;$itr+=$prime){
				if(defined $nums[$itr]){
					$nums[$itr]=undef;
				}
			}
		}
	}
	%primes;
}
my %primes=sieve;
my @keys=sort{$a<=>$b} keys %primes;
shift @keys for(1..168);
for(@keys){
	my $num=$_;
	my @permutations;
	my @chars=split '',$num;
	if(defined $num){
	OUTER:for(@keys){
		unless($_==$num){
			if(defined $_){
				my $num2=$_;
				for(@chars){
					unless($num2=~/($_)/){
						next OUTER;
					}
				}
				my @chars2=split '',$_;
				for(@chars2){
					unless($num=~/($_)/){
						next OUTER;
					}
				}
				push @permutations, $num2;				
			}
		}
	}
	}
	$primes{$num}=\@permutations;
}
my %matches;
for(@keys){
	if(defined $primes{$_}&&@{$primes{$_}}>1){
		my @primes=@{$primes{$_}};
		push @primes, $_;
		@primes=sort @primes;
		$matches{$primes[0]}=@primes;
	}
}
for(sort keys %matches){
	my @primes=@{$primes{$_}};
	for(my $itr1=0; $itr1<@primes-2; $itr1++){
		for(my $itr2=1; $itr2<@primes-1; $itr2++){
			for(my $itr3=2; $itr3<@primes; $itr3++){
				if($primes[$itr3]-$primes[$itr2]==$primes[$itr2]-$primes[$itr1]&&$itr1!=$itr2&&$itr3!=$itr1&&$itr3!=$itr2){
					print "$primes[$itr1] $primes[$itr2] $primes[$itr3]\n";
				}
			}
		}
	}
}
