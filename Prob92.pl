#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %known;
my $count;
$known{1}=1;
$known{89}=89;
for(my $itr=1; $itr<=567; $itr++){
	my @buffer;
	my $num=$itr;
	while(!exists $known{$num}){
		push @buffer, $num;
		my @digits=split '', $num;
		$num=0;
		$num+=$_**2 for(@digits);
	}
	if($known{$num}==89){
		$count+=$#buffer+1;
	}
	for(@buffer){
		$known{$_}=$known{$num};
	}
}
for(my $itr=568; $itr<10000000; $itr++){
	my @digits=split '', $itr;
	my $num=0;
	$num+=$_**2 for(@digits);	
	if($known{$num}==89){
		$count++;
	}
}
print $count;