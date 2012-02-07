#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %triangle_nums;
$triangle_nums{(.5*$_*($_+1))}=1 for(1..30);
open FILE, 'words.txt' or die "unable to open file: $!";
my $string=<FILE>;
my @words=split ',', $string;
print "@words\n";
my $count=0;
for(@words){
	s/"//g;
	my @chars=split '',$_;
	my $sum;
	for(@chars){
		$sum+=ord ($_)-64;
	}
	if(exists $triangle_nums{$sum}){
		$count++;
	}
}
print $count;