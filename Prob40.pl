#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my $str;
for(my $itr=1; length $str<1000000;$itr++){
	$str.=$itr;
}	
my $ans=1;
for(my $itr=10;$itr<=1000000; $itr*=10){
	$ans*=substr $str, $itr-1,1; 
}
print "$ans\n";
	