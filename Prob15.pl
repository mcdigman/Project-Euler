#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @grid;
for(my $row=0; $row<=20; $row++){
	for(my $col=0; $col<=20; $col++){
		if($row==0||$col==0){
			$grid[$row][$col]=1;
		}else{
			$grid[$row][$col]=$grid[$row-1][$col]+$grid[$row][$col-1];
		}
	}
}
print $grid[20][20];