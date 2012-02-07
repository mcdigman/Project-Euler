#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub is_pandigital{
	my $num=shift;
	for(1..length $num){
		return 0 unless($num=~/$_/);
	}
	return 1;
}
my $max_found=0;
for(my $itr=1; $itr<=100000; $itr++){
	my $num;
	my $depth=1;
	while(length $num<9){
		$num.=$itr*$depth;
		$depth++;
	}
	if(((length $num)==9)&&is_pandigital($num)&&$num>$max_found){
		$max_found=$num;
	}
}
print $max_found;