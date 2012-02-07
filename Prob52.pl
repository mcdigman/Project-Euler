#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my $itr=0;
OUTER:while(1){
	$itr++;
	my @digits=split '', $itr;
	for(2..6){
		my $num=$_*$itr;
		if(length $num!=length $itr){
			next OUTER;
		}
		for(@digits){
			unless($num=~/$_/){
				next OUTER;
			}
		}
	}
	print $itr;
	last OUTER;
}