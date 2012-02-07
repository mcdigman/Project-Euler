#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bignum;
use Math::BigInt;
use bigint;
my @seq;
my $ans;
for(my $k=1; $k<=50; $k++){
	push @seq, (1,2*$k,1);
}
shift @seq;
my @nums=(1);
sub expand{
	#print "\n";
	my $expr=shift;
	my $depth=shift (@_)+1;
	my $next=shift @seq;
	push @nums, $next;
	$expr=~s#/(\d+)(\)*)$#/\($1+1/$next$2#;
	my $frac=frac($expr);
	$frac=~m#^\d+/#;
	my $numerator=$&;
	#print "$expr\n $depth $numerator\n";
	if($depth<99){
		expand($expr,$depth);
	}else{
		$ans=substr $numerator, 0, (length $numerator)-1;
		return 1;
	}
	1;
}
my $num=0;
sub frac{
	my $expr=shift;
	#print "expr is $expr\n";
	$expr=~s#/(\d+)$##;
	my $denom=$1;
	#print "denom is $denom\n";
	$expr=~s/\+(\d+)$//;
	$num=Math::BigInt->new($1);
	#print "numerator is $num\n";
	$expr=~s#\+1/\((\d+)$##;
	my $add=$1;
	#print "add is $add\n";
	$num+=$add*$denom;
	while($expr){
		$expr=~s#(\+1/\()?(\d+)$##;
		$add=$2;
		my $temp=$denom;
		$denom=$num;
		$num=$temp;
		$num=$num+$add*$denom;
		#print "numerator is $num\n";
	}
	"$num/$denom";
}

expand ('2+1/1',1);
sub sum{
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
print sum split '', $ans;

