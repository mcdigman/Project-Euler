#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %permutations;
for(my $itr=0; 1; $itr++){
	my $num=$itr**3;
	my $digits= join '', (sort split '', $num);
	push @{$permutations{$digits}}, $num;
	if($#{$permutations{$digits}}==4){
		print "@{$permutations{$digits}}";
		last;
	}
}