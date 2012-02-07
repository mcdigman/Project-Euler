#! usr/bin/perl 
#Matthew Digman
use strict;
use warnings;
my %pentagonal;
for(1..50000){
	$pentagonal{$_*(3*$_-1)/2}=1;
}
my @pentagonal = sort{$a<=>$b} keys %pentagonal;
my $d=99999999999999999;
OUTER:for(my $itr1=0; $itr1<3000; $itr1++){
	for(my $itr2=0; $itr2<1200; $itr2++){
		my $num1=$pentagonal[$itr1];
		my $num2=$pentagonal[$itr2];
		if(abs ($num2-$num1)>$d){
			next if($num2<$num1);
			next OUTER;
		}
		next unless(exists $pentagonal{$num1+$num2});
		next unless(exists $pentagonal{abs($num2-$num1)});
		print "$itr1 $itr2 $num1 $num2 and dif ",abs($num2-$num1),"\n";		
		$d=abs($num2-$num1);
	}
}
print $d;