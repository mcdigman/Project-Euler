#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %perimeters;
for(my $s1=1;$s1<1000;$s1++){
	for(my $s2=1;$s2<1000;$s2++){
		my $s3=sqrt($s1**2+$s2**2);
		unless($s3=~/\D/){
			my $perimeter=$s1+$s2+$s3;
			if($perimeter<=1000){
				my @solution =sort ($s1,$s2,$s3);
				push @{$perimeters{$perimeter}}, \@solution;
			}
		}
	}
}
my @keys= keys %perimeters;
@keys=sort {$#{$perimeters{$b}}<=>$#{$perimeters{$a}}} @keys;
print "$keys[0]\n";
for(@{$perimeters{$keys[0]}}){
	print "@{$_}\n";
}