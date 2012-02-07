#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %nums;
for(my $itr1=2; $itr1<=5; $itr1++){
	for(my $itr2=2; $itr2<=5; $itr2++){
		$nums{$itr1**$itr2}=1;
	}
}
my @seq=keys %nums;
print $#seq;