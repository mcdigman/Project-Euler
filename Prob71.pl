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
my $closest_found=0;
my $numerator=0;
for(my $itr1=950000; $itr1<1000000; $itr1++){
	my $itr2=$itr1*2.9999/7+1;
	$itr2=~s/\..*$//;
	while(($itr2/$itr1)<(3/7)){
		if(gcd ($itr1,$itr2)==1){
			if($itr2/$itr1>$closest_found){
				print "$itr2 / $itr1\n";
				$closest_found=$itr2/$itr1;
				$numerator=$itr2;
			}
		}
		$itr2++;
	}
}
print "$numerator";