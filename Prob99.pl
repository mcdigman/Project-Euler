#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
print 100**1000,"\n";
open FILE, '<base_exp.txt' or die "unable to open file for input: $!";
my %base_pairs;
for(<FILE>){
	chomp;
	my ($base, $exp)=split ',', $_;
	$base_pairs{($base)}=$exp;
}
#my @keys=sort {$b<=>$a} keys %base_pairs;
#for(@keys){
#	my $test=$_;
#	for(@keys){
#		delete $base_pairs{$_} if($test>$_&&$base_pairs{$test}>=$base_pairs{$_});
#	}
#}
my $max_found=0;
my $max_base;
my @keys=keys %base_pairs;
for(my $itr=0; $itr<=$#keys; $itr++){
	my $base=$keys[$itr];
	my $num=log($base)*$base_pairs{$base};
	print $num,"\n";
	if($num>$max_found){
		$max_found=$num;
		$max_base=$base;
	}
}
print "$max_base^$base_pairs{$max_base}";