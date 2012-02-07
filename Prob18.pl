#! usr/bin/perl
#Matthew Digman
use bigint;
my $product=1;
for(1..100){
	$product*=$_;
}
my @digits=split(/(\d)/,  $product);
print "@digits\n";
my $sum;
$sum+=$_ for(@digits);
print "$product\n\n$sum\n";