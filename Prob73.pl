#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub gcd {
  my ($a, $b) = @_;
  ($a,$b) = ($b,$a) if $a > $b;
  while ($a) {
    ($a, $b) = ($b % $a, $a);
  }
  return $b;
}
my $count;
for(my $itr1=5; $itr1<=12000; $itr1++){
	my $itr2=$itr1/3-1;
	$itr2=~s/\.\d*$//;
	while(($itr2/$itr1)<(1/2)){
		if($itr2/$itr1>1/3&&gcd ($itr1,$itr2)==1){
			$count++;
		}
		$itr2++;
	}
}
print "$count";