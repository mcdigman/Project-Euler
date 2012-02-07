#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
chomp (my $ceiling=<STDIN>);
my $sum=0;
for(my $itr=1; $itr<$ceiling; $itr+=1){
	if(!($itr%3)||!($itr%5)){
		$sum+=$itr;
	}
}
print $sum;