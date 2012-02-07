#! usr/bin/perl
#Matthew Digman
use strict;
my @num_grid;
open FILE, 'NumGrid.txt' or die "Unable to open file $!";
my $control=0;
for(<FILE>){
	chomp;
	$num_grid[$control]=[split ' ', $_];
	$control++;
}
my $max_product=0;
my $max_start;
for(my $row=0; $row<20; $row++){
	for(my $col=0; $col<20; $col++){
		my $product=$num_grid[$row][$col];
		my $product2=$product;
		my $product3=$product;
		my $product4=$product;
		for(my $local=1; $local<4; $local++){
			if($row+4<20){
				$product4*=$num_grid[$col+$local][$row];
			}
			if($col+4<20){
				$product*=$num_grid[$row][$col+$local];
				if($row+4<20){
					$product2*=$num_grid[$row+$local][$col+$local];
				}
			}
			if($col>=4&&$row+4<20){
				$product3*=$num_grid[$row+$local][$col-$local];
			}
		}
		my @possibles=sort {$b<=>$a}($product,$product2,$product3,$product4);
		if($possibles[0]>$max_product){
			$max_product=$possibles[0];
			$max_start="$row, $col ($product,$product2,$product3,$product4)";
		}
		print "$num_grid[$row][$col] ";
	}
	print "\n";
}
print "$max_product $max_start\n";