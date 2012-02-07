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
$primes{$_}=1 for(@primes);
for(@primes){	
	if(/(.).*?(\1).*?(\1)/){
		if($1<3){
			my $count=1;
			my $num=$_;

			my $replacement_num=$1;
			my $orig=$num;
			$num=~s/$replacement_num/*/g;
			while($replacement_num<9){
				$replacement_num++;
				my $copy=$num;
				$copy=~s/\*/$replacement_num/g;
				$count++ if(exists $primes{$copy});
			}
			if($count==8){
				print "$_\n";
				last;
			}
		}
	}
}