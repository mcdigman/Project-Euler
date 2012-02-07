#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
#use bigint;
my $count;
my @trailing;
my @leading;
OUTER:for(my $itr=0; $itr<100000000; $itr++){
	my $num2=reverse $itr;
	next if($num2<$itr);
	my $sum=$itr+$num2;
	#print "$sum\n" if($sum=~/\./);
	for(my $itr2=0; $itr2<length $sum; $itr2++){
		next OUTER unless(substr($sum,$itr2,1)%2);
	}
#	print "$itr + $num2 =$sum\n";
#	$trailing[substr($itr, -1,1)]++;
#	$leading[substr($itr,0,1)]++;
	$count+=2;

}
#print "Trailing\tLeading\n";
#for(0..9){
#	print "$_: $trailing[$_]\t$leading[$_]\n";
#}
print "$count\n";