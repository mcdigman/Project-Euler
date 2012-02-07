#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my $count;
for(my $itr=0; $itr<10000; $itr++){
	my $base=0;
	my $num=0;
	while(length $num <=$itr){
		$base++;
		$num=$base**$itr;
		if(length $num==$itr){
			$count++;
			print "$count\n";
		}
	}
}
print $count;