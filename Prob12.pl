#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub factorize{
	my $num=shift;
	my %factors;
	for(my $itr=1; $itr<=sqrt $num; $itr++){
		unless($num%$itr){
			$factors{$itr}=1;
			$factors{($num/$itr)}=1;
		}
	}
	keys %factors;
}
my $triangle=0;
my $itr=0;
my @factors;
while(@factors<=500){
	$itr++;
	$triangle+=$itr;
	@factors=sort{$a<=>$b}&factorize($triangle);
}
print "$triangle\n";