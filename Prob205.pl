#! usr/bin/perl
#Matthew Digman
use strict;
#use warnings;
#use bignum;
my @known;
sub func{
	my $s=shift;
	my $n=shift;
	my $k=shift;
	if(defined $known[$s][$n][$k]){
		return $known[$s][$n][$k];
	}
	if($n==1){
		if($k>=1&&$k<=$s){
			$known[$s][$n][$k]=1/$s;
			return 1/$s;
		}
		$known[$s][$n][$k]=0;
		return 0;
	}
	my $sum;
	for(my $itr=1; $itr<=$k-$n+1; $itr++){
		$sum+=func($s,1,$itr)*func($s,$n-1,$k-$itr);
	}
	$known[$s][$n][$k]=$sum;
	return $sum;
}
my $wins_4;
for(100..600){
	my $num1=$_;
	for(150..600){
		my $num2=$_;
		if($num2>$num1){
			$wins_4+=func(6,100,$num1)*func(4,150,$num2);
		}
	}
}
print "Pyramids win $wins_4\n";

