#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my @palindromic;
sub are_equal{
	my $a1=shift;
	my $a2=shift;
	my @array1=@{$a1};
	my @array2=@{$a2};
	for(0..$#array1){
		unless($array1[$_]==$array2[$_]){
			return 0;
		}
	}
	return 1;
}
for(1..600000){
	my @nums=split '', $_;

	my @revers=reverse @nums;
	if(are_equal(\@nums,\@revers)){
		my @base2;	
		my $start=1;
		my $index=0;
		$start*=2 while($start<$_);
		if($start!=$_){
			$start/=2;
		}
		my $num=$_;
		while($start>=1){
			my $digit=$_/$start;
			if($digit<1){
				$digit=0;
			}elsif($digit>=2){
				$digit=0;
			}else{
				$digit=1;
			}
			$base2[$index]=$digit;
			$_-=$start if($_>=$start);
			$start/=2;
			$index++;
		}
		@revers=reverse @base2;	
		if(are_equal(\@revers,\@base2)){
			print "$num to @revers in base 2\n";
			push @palindromic,$num;
		}
	}
}
sub sum{
	my $sum;
	for(@_){
		$sum+=$_;
	}
	$sum;
}
print "@palindromic\n";
print "$#palindromic+1\n";
my $sum=sum @palindromic;
print "$sum\n";