#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub factorize{
	my $num=shift;
	my %factors;
	for(my $itr=1; $itr<=sqrt $num; $itr++){
		unless($num%$itr){
			$factors{$itr}=1;
			unless($itr==1){
				$factors{($num/$itr)}=1;
			}
		}
	}
	keys %factors;
}
sub sum{
	my $sum=0;
	$sum+=$_ for(@_);
	if($sum<=1){
		return undef;
	}
	$sum;
}
my %divisors;
for(1..10000){
	$divisors{$_}=sum(factorize($_));
}
print "Here\n";
my %amicable;
for(keys %divisors){
	my $sum=$divisors{$_};
	if(defined $sum&&defined $divisors{$sum}&&$sum!=$_){
		if($divisors{$sum}==$_){
			$amicable{$sum}=$_;
		}
	}
	if(defined $sum){
		$divisors{$_}=undef;
	}
}
my $sum;
for(sort {$a<=>$b} keys %amicable){
	$sum+=$_+$amicable{$_};
	print "$_ => $amicable{$_}\n";
	my @f1=factorize($_);
	my $s1=sum(@f1);
	my @f2=factorize($amicable{$_});
	my $s2=sum(@f2);
	print "@f1\n$s1\n$s2\n@f2\n";
}
print "$sum\n";