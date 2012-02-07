#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
open PRIMES, '<Primes10m.txt' or die "unable to open primes: $!";
my @primes=split ' ', <PRIMES>;
close PRIMES;
sub is_permutation{
	my @digits1=split '', $_[0];
	my @digits2=split '', $_[1];
	return 0 if($#digits1!=$#digits2);
	my %counts1;
	my %counts2;
	$counts1{$_}+=1	for(@digits1);
	$counts2{$_}+=1 for(@digits2);
	for(keys %counts1){
		if(!exists $counts2{$_}||$counts1{$_}!=$counts2{$_}){
			return 0;
		}
	}
	1;
}
my %tot;
my %powers;
for(my $itr=0; $itr<@primes&&$primes[$itr]<10000000; $itr++){
	my $orig=$primes[$itr];
	$tot{$orig}=$orig-1;
	my $num1=$orig;
	my $num2=$orig**2;
	while($num2<10000000){
		$tot{$num2}=$num2-$num1;
		$powers{$num2}=$orig;
		$num2*=$orig;
		$num1*=$orig;
	}
}
my @base=sort {$a<=>$b} keys %tot;
$tot{1}=1;
&multiply(0,1);
@base=sort{$a<=>$b}keys %tot;
#for(@base){
#	print "$_ => $tot{$_}\n";
#}
my $min_rat=10000000;
my $min;
shift @base;
for(@base){
	if(is_permutation($_,$tot{$_})){
		my $rat=$_/$tot{$_};
		print "Candidate: $_ $tot{$_} $rat\n";
		if($rat<$min_rat){
			$min_rat=$rat;
			$min=$_;
		}
	}
}
print "$min with ratio $min_rat and phi $tot{$min}\n";
sub multiply{
	my $floor=shift;
	my $product=shift;
	for(my $itr=$floor; $itr<@base; $itr++){
		my $new_product=$base[$itr]*$product;
		return 1 if($new_product>=10000000);
		if(!(exists $tot{$new_product}||(exists $powers{$base[$itr]}&&!($product%$powers{$base[$itr]})))){
#			if($new_product==70512||$new_product==624||$new_product==48){
#				print "Number: $new_product Base: $base[$itr] Tot Base: $tot{$base[$itr]} Power Base: $powers{$base[$itr]} Product: $product Tot Product: $tot{$product} Power Product: $powers{$product}\n";
#			}
			$tot{$new_product}=$tot{$base[$itr]}*$tot{$product} ;
			
		}
		if(exists $tot{$new_product}){
			&multiply($itr+1,$new_product);
		}
	}
	return 1;
}
