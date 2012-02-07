#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @factorials;
sub factorial{
	my $ans=1;
	my $num=shift;
	for(my $itr=1; $itr<=$num; $itr++){
		$ans*=$itr;
	}
	return $ans;
}
$factorials[$_]=factorial($_) for(0..100);
my $count;
for(my $n=1; $n<=100; $n++){
	my $n_factorial=$factorials[$n];
	for(my $c=1; $c<$n; $c++){
		my $num=$n_factorial/($factorials[$c]*$factorials[($n-$c)]);
		$count++ if($num>1000000);
	}
}
print $count;