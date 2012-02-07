#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @nums=(1);
for(my $itr=1; $nums[$itr-1]<2000000; $itr++){
	$nums[$itr]=$nums[$itr-1]+$itr+1;
}
my $closest=0;
my $area;
for(my $itr1=0; $itr1<@nums;$itr1++){
	my $count=0;
	for(my $itr2=0; $count<2000000&&$itr2<@nums; $itr2++){
		$count=$nums[$itr1]*$nums[$itr2];
		if(abs($count-2000000)<abs($closest-2000000)){
			$closest=$count;
			$area=($itr1+1)*($itr2+1);
		}
	}
}
print "$closest $area";