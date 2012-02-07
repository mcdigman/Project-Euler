#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
sub min{
	return $_[0] if($_[1]>$_[0]);
	$_[1];
}
open FILE, 'matrix.txt' or die "unable to find input matrix\n";
my @matrix;
for(<FILE>){
	my @nums=split ',',$_;
	push @matrix,\@nums;
}
my @sum;
my $row=0;
$sum[0]->[0]=$matrix[0]->[0];
for(my $col=1; $col<=$#matrix; $col++){
	$sum[$row]->[$col]=$matrix[$row]->[$col]+$sum[$row]->[$col-1];
	$sum[$col]->[$row]=$matrix[$col]->[$row]+$sum[$col-1]->[$row];
}
for(my $row=1; $row<=$#matrix; $row++){
	for(my $col=1; $col<=$#matrix; $col++){
		$sum[$row]->[$col]=min($sum[$row-1]->[$col],$sum[$row]->[$col-1])+$matrix[$row]->[$col];
	}
}
print $sum[$#sum]->[$#sum],"\n";

		