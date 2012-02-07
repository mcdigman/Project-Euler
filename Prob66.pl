#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bignum (p=>-10);
my $max_x=0;
my $max_d;
my @squares;
for(my $itr=1; $itr<=10000; $itr++){
	$squares[$itr]=$itr**2
}
my %roots;
for(my $coef=2; $coef<=1000; $coef++){
	my $sqrt=sqrt $coef;
	next unless(($sqrt)=~/\..*[^0]/);
	my $ab=$sqrt=~s/\..*$//;
	my $x=2;
	my $y=2;
	my $m=0;
	my $d=1;
	until($x**2-$coeff*$y**2==1){
		$m=$d*$ab-$m;
		$d=($coeff-$m**2)/$d;
		$ab=($sqrt+$m)/$d;
		$ab=~s/\..*$//;
	}
}
print "$max_d at $max_x\n";