#! usr/bin/perl
#Matthew Digman
use warnings;
use bignum (p=>-2000);
my $max_found=5;
for(my $itr=1; $itr<1000; $itr++){
	my $num=1/$itr;
	if($num=~/(.{10,}?)(\1)/){
		print "$itr, ",length $1,"\n";
	}
}
print $max_found-1;