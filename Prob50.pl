#! usr/bin/perl
#Matthew Digman
use strict;
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
my %primehash;
my $index=1;
@primehash{@primes}=1;
my $sum1;
my $depth1;
for(@primes){
	my ($sum2,$depth2)=find_highest_from ($_,$depth1);
	if($sum2!=0){
		$sum1=$sum2;
		$depth1=$depth2;
	}
	if($_*$depth2>1000000){
		last;
	}
}
print "$sum1 $depth1\n";
sub find_highest_from{
	my $floor=shift;
	my $ceiling=shift;
	my $sum_at_ceiling;
	my $sum;
	my $depth;
	for(@primes){
		unless($_<$floor){
			$sum+=$_;
			$depth++;
			if($sum>1000000){
				$sum-=$_;
				$depth--;
				return ($sum_at_ceiling,$ceiling);
			}			
			if($depth>=$ceiling&&exists $primehash{$sum}){
				$ceiling=$depth;
				$sum_at_ceiling=$sum;
			}
		}
	}
	$sum;
}
