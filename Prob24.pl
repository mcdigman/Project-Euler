#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @nums=(0..9);
my $value=2.75573192;
my $ans;
sub keep_all_but{
	my $digit=shift;
	my @copy;
	for(@nums){
		unless($_==$digit){
			push @copy, $_;
		}
	}
	print "removed $digit from @copy \n";
	@copy;
}
for(0..9){	
	my $digit=substr($value,0,1);
	$ans.=$nums[$digit];
	@nums=keep_all_but($nums[$digit]);
	$value-=$digit;
	$value*=9-$_;
}
print "$value $ans\n";