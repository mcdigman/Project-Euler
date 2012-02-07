#! usr/bin/perl
#Matthew Digman
use strict;
my @nums=(2..1000);
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
my %primes;
$primes{$_}=1 for(@primes);
my %rotational;
for(@primes){
	unless(exists $rotational{$_}){
		rotate($_);
	}
}
my @keys =sort{$a<=>$b} keys %rotational;
print "$#keys in @keys\n";
sub rotate{
	my $num=shift;
	my @rotations=($num);
	for(1..(length $num)-1){
		my $digit=substr($num,0,1);
		my $rest=substr($num,1,(length $num)-1);
		$rest.=$digit;
		if(exists $primes{$rest}){
			$num=$rest;
			push @rotations, $num;
		}else{
			return 0;
		}
	}
	for(@rotations){
		$rotational{$_}=1;
	}
}