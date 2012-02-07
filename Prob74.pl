#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %known=(169=>3,363601=>3,1454=>3,871=>2,45361=>2,872=>2,45362=>2,2=>1,1=>1,145=>1,40585=>1);
my $count;
my @factorials=(1,1,2,6,24,120,720,5040,40320,362880);
for(my $itr=3; $itr<1000000; $itr++){
	next if(exists $known{$itr});
	my @chain;
	my $working_num=$itr;
	until(exists $known{$working_num}){
		unshift @chain, $working_num;	
		my @digits=split '', "$working_num";
		$working_num=0;
		$working_num+=$factorials[$_] for(@digits);
	}
	my $length=$known{$working_num};
	while(@chain){
		$length++;
		$count++ if($length==60);
		my $num=shift @chain;
		$known{$num}=$length;
	}
}
print $count;