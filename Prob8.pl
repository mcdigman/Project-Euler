#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
open FILE, 'ThousandDigit.txt' or die "unable to open file: $!";
my $num;
for(<FILE>){
	chomp $_;
	$num.=$_;
}
my $max=0;
my $seq;
my $start=0;
while($start+5<length ($num)) {
	my $test=substr($num, $start,1);
	for($start+1..$start+4){
		$test=$test*substr($num,$_,1);
	}
	if($test>$max){
		$max=$test;
		$seq=substr($num,$start,5);
	}
	$start+=1;
}
print "$max $seq\n";	