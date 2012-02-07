#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
#use bigint;
my %valid;
my @squares;
my @cubes;
for(my $itr1=1; $itr1<50000; $itr1++){
	$squares[$itr1]=$itr1**2;
	$cubes[$itr1]=$itr1**3 if($itr1<5000);
}
for(my $square=2; $square<30000; $square++){
	for(my $cube=2; $cube<1000; $cube++){
		my $num=$squares[$square]+$cubes[$cube];
		if($valid{$num}){
			$valid{$num}++;
			if($valid{$num}==4){
				print "Found $num\n";
			}
			print "$valid{$num}st palindromic: $num from $squares[$square] $square and $cubes[$cube] $cube\n";
		}elsif($num==reverse $num){
			$valid{$num}++;
			#print "palindromic: $num from $squares[$square] and $cubes[$cube]\n";
		}
	}
	#my @keys=sort{$a<=>$b} keys %valid;
	#for(my $itr=0; $itr<=$#keys&&$keys[$itr]<$squares[$square]; $itr++){
	#	delete $valid{$keys[$itr]};
	#}
}
my @keys=sort {$a<=>$b} keys %valid;
my $sum;
my $count;
for(@keys){
	if($valid{$_}==4){
		print "added: $_\n";
		$sum+=$_;
		$count++;
		if($count==5){
			print "$sum\n";
			exit;
		}
	}
}
		