#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
open FILE, '<sudoku2.txt' or die "unable to read puzzles: $!";
my @puzzles;
my $current_puzzle;
for(<FILE>){
	chomp;
	next if(/Grid/);
	$current_puzzle.=$_;
	if(length $current_puzzle>=80){
		push @puzzles, $current_puzzle;
		$current_puzzle="";
	}
}
my $sum;
for(@puzzles){
	my $solved=`java PlaySudoku $_`;
	my @nums=split ' ', $solved;
	my $num;
	$num.=shift @nums for(1..3);
	$sum+=$num;
}
print "sum $sum";