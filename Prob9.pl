#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
for(my $num1=1; $num1<400; $num1+=1){
	for(1..400){
		my $num3=sqrt($num1**2+$_**2);
		unless($num3=~m#\.#){
			if($num1+$_+$num3==1000){
				print $num1*$_*$num3," $num1 $_ $num3\n";
			}
		}
	}
}