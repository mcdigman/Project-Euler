#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
for(my $itr=1010101010; $itr<sqrt(1929394959697989990); $itr+=10){
	if($itr**2=~/1.2.3.4.5.6.7.8.9.0/){
		print $itr;
		exit;
	}
	#if($itr%1000){
	#	print "$itr\n";
	#}
}
print "Failed\n";