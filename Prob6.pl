#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @nums=(1..100000000);
my $sum_squares;
$sum_squares+=$_**2 for(@nums);
my $sums;
$sums+=$_ for (@nums);
print ($sums**2-$sum_squares);