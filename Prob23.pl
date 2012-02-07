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
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
sub is_abundant{
	my $num=shift;
	$num<&sum(&factorize($num));
}
my @abundant;
for(1..28123){
	push @abundant,$_ if is_abundant($_);
}
my %sum_of_abundant;
for(@abundant){
	my $num1=$_;
	for(@abundant){
		$sum_of_abundant{$num1+$_}=1;
	}
}
my @not_sum;
for(1..28123){
	unless(exists $sum_of_abundant{$_}){
		push @not_sum, $_;
	}
}
print sum (@not_sum),"\n";
