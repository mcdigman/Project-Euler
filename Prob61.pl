#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @polygonal;
for(3..8){
	my %poly;
	for(my $itr=1; $itr<200; $itr++){
		$poly{.5*$itr*(($_-2)*$itr-($_-4))}=1;
	}
	$polygonal[$_]=\%poly;
}
my @keys= sort {$a<=>$b}keys %{$polygonal[8]};
print "@keys\n";
my %needed=(3=>1,4=>1,5=>1,6=>1,7=>1,8=>1);
my $init_prefix;
for($init_prefix=10; $init_prefix<100; $init_prefix++){
	last if(&find_cyclic($init_prefix, ""));
}
sub find_cyclic{
	my $prefix=shift;
	my $full_seq=shift;
	for(my $suffix=10; $suffix<100; $suffix++){
		my $num="$prefix$suffix";
		for(my $gon=3; $gon<=8; $gon++){
			if(exists ${$polygonal[$gon]}{$num}){
				if(exists $needed{$gon}){
					print keys %needed,"\n";
					delete $needed{$gon};
					my $seq=$full_seq;
					$seq.=" $num";
					if((keys %needed)==0){
						print "$seq\n";
						if($suffix==$init_prefix){
							return 1;
						}
					}elsif(find_cyclic($suffix,$seq)){
						return 1;
					}
					$needed{$gon}=1;
				} 
			}
		}
	}
}
sub sum{
	my $sum;
	$sum+=$_ for(@_);
	$sum;
}
