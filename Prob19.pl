#! usr/bin/perl
#Matthew Digman
use warnings;
use strict;
use Benchmark;

timethis(1000,\&calc_triangle);
sub calc_triangle{
my @num_triangle;
my @sum_triangle;
open FILE, '<triangle.txt' or die "unable to open file for input: $!";
my $row=0;
for(<FILE>){
	chomp;
	my @row=split ' ',$_;
	$num_triangle[$row]=\@row;
	$row++;
}
close FILE;
$sum_triangle[0]->[0]=$num_triangle[0]->[0];
$row=0;
for($row=1; $row<@num_triangle; $row++){
	for(my $col=0;$col<@num_triangle&&defined($num_triangle[$row]->[$col]); $col++){
		my $max_sum=0;
		if(defined ($sum_triangle[$row-1]->[$col-1])&&defined ($sum_triangle[$row-1]->[$col])){
			$max_sum=max($sum_triangle[$row-1]->[$col],$sum_triangle[$row-1]->[$col-1])+$num_triangle[$row]->[$col];
		}elsif(defined( $sum_triangle[$row-1]->[$col])){
			$max_sum=$sum_triangle[$row-1][$col]+$num_triangle[$row]->[$col];
		}else{
			$max_sum=$sum_triangle[$row-1][$col-1]+$num_triangle[$row]->[$col];
		}
		$sum_triangle[$row]->[$col]=$max_sum;
	}
}
$row=@num_triangle-1;
my $max_found=0;
for(my $col=0;$col<@num_triangle&&defined($sum_triangle[$row]->[$col]); $col++){
	$max_found=max($max_found,$sum_triangle[$row]->[$col]);
}
}
sub max{
	my $arg1=shift;
	my $arg2=shift;
	if($arg1>$arg2){
		return $arg1;
	}
	return $arg2;
}
#print "$max_found\n";