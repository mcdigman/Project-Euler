#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @names;
sub get_word_value{
	my $value;
	for(split //, shift){
		$value+=ord($_)-64;
	}
	return $value;
}
open FILE, 'names.txt' or die "unable to open file: $!";
for(<FILE>){
	chomp;
	s/"//g;
	@names=split ',';
}
@names=sort @names;
my $sum;
for(my $itr=0;$itr<@names; $itr++){
	$sum+=(get_word_value($names[$itr])*($itr+1));
}
print "$sum\n";

		