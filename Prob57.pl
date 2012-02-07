#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my $count=0;
expand ('1+1/2',1);
sub expand{
	my $expr=shift;
	my $depth=shift (@_)+1;
	$expr=~s#2(\)*)$#\(2+1/2\)\1#;
	my $frac=frac($expr);
	$frac=~m#^\d+/#;
	my $numerator=$&;
	$frac=~m#/\d*$#;
	my $denominator=$&;
	if(length $numerator>length $denominator){
		$count++;
	}
	if($depth<1000){
		expand($expr,$depth);
	}
	1;
}
sub frac{
	my $expr=shift;
	my $num=1;
	my $denom=2;
	my $c=$expr=~tr#/#/#;
	for(my $itr=0; $itr<$c-1; $itr++){
		$num+=$denom*2;
		my $temp=$denom;
		$denom=$num;
		$num=$temp;
	}
	$num+=$denom;
	"$num/$denom";
}
	
print "$count\n";
