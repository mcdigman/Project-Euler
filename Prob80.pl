#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bignum(p=>-200);
my $sum=0;
for(my $itr=2; $itr<=100; $itr++){
	my $dec=sqrt $itr;
	print "$itr\n";
	next if($dec=~/\.0+$/);
	print "survived\n";
	$dec=~s/(\d)\.//;
	$sum+=$1;
	my @digits=split '', $dec;
	for(my $itr=0; $itr<99; $itr++){
		$sum+=$digits[$itr];
	}
}
print $sum;
	