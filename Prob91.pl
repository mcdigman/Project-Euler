#! /usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my $n =1000;
my $tot = 3*$n**2;
my %flagged;
for(my $row_step =1; $row_step<=int($n/2); $row_step++){
	for(my $col_step =1; $col_step<=$n; $col_step++){
		my $row = $row_step;
		my $col = $col_step;
		next if(exists $flagged{"$row $col"});
		while($row<=$n&&$col<=$n){
			my $t_col = $col-$row_step;
			my $t_row = $row+$col_step;
			while($t_col>=0 && $t_row<=$n){
				$tot+=2;
				
#		print "verts are (0,0) ($col,$row) ($t_col,$t_row) $row_step $col_step\n";
				$t_col-=$row_step;
				$t_row+=$col_step;
			}
			$flagged{"$row $col"} = 1;
			$row+=$row_step;
			$col+=$col_step;
		}
	}
}
print "$tot\n";
		
		
		
