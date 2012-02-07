#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bignum;
sub is_increasing{
	my $num=shift;
	my @digits=split '', $num;
	my $last=-1;
	for(@digits){
		return 0 if($_<$last);
		$last=$_;
	}
	return 1;
}
sub is_decreasing{
	my $num=shift;
	my @digits=split '', $num;
	my $last=100;
	for(@digits){
		return 0 if($_>$last);
		$last=$_;
	}
	return 1;
}
my $count=0;
my $itr;
for($itr=99; $itr<10000000; $itr++){
	$count++ if(is_increasing($itr)||is_decreasing($itr));
}
print "$count/$itr\n";