#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub factorize{
	my $num=shift;
	my %factors;
	for(my $itr=2; $itr<=sqrt $num; $itr++){
		unless($num%$itr){
			if(&is_prime($itr)){
				$factors{$itr}=1;
			}
			unless($itr==1){
				if(&is_prime($num/$itr)){
					$factors{($num/$itr)}=1;
				}
			}
		}
	}
	keys %factors;
}
sub is_prime{
	my $test=shift;
	if($test==2){
		return 1;
	}
	unless($test%2){
		return 0;
	}
	for(my $itr=3; $itr<=sqrt $test; $itr+=2){
		unless($test%$itr){
			return 0;
		}
	}
	1;
}
my $count=4;
my $num;
for(my $itr=2;!defined $num;$itr++){
	for(0..$count-1){
		last if(factorize ($itr+$_)!=$count);
		if($_==$count-1){
			$num=$itr;
		}
	}
}
my @factors=factorize($num);
print "$num @factors";
	
	