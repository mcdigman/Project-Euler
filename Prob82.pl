#! usr/bin/perl 
#Matthew Digman
use strict;
use warnings;
open FILE, 'matrix2.txt' or die "unable to open file for input: $!";
my @matrix;
for(<FILE>){
	chomp;
	my @row=split ',', $_;
	push @matrix,\@row;
}
my @sums;
for(my $row=0; $row<@matrix; $row++){
	$sums[$row]->[0]=$matrix[$row]->[0];
}
sub min{
	return $_[0] if($_[0]<$_[1]);
	$_[1];
}
sub get_min_path{
	my $row=shift;
	my $col=shift;
	my $min_top=shift;
	my $left=$sums[$row]->[$col-1];
	my $min=min($min_top,$left);
	if($row==$#matrix){
		$sums[$row]->[$col]=$min+$matrix[$row]->[$col];
		return $min;
	}
	my $bottom=get_min_path ($row+1,$col,$min+$matrix[$row]->[$col]);
	$min=min($min,$bottom);
	$sums[$row]->[$col]=$min+$matrix[$row]->[$col];
	return $min+$matrix[$row]->[$col];
}
for(my $col=1; $col<@matrix;$col++){
	get_min_path (0,$col,200**200);
}
my $min_found=$sums[0]->[$#sums];
for(my $row=1; $row<@sums; $row++){
	$min_found=min($min_found,$sums[$row][$#sums]);
}
#for(my $row=0; $row<@sums; $row++){
#	print "@{$sums[$row]}\n";
#}
print $min_found;