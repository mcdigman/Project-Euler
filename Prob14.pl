#! usr/bin/perl
#Matthew Digman

my %calculated;
for(my $itr=1; $itr<1000000; $itr++){
	my $depth=0;
	my $copy=$itr;

	while($copy!=1){
		if(exists $calculated{$copy}){
			$depth+=$calculated{$copy};
			last;
		}		
		$depth++;
		if($copy%2){
			$copy=$copy*3+1;
		}else{
			$copy/=2;
		}
	}
	$calculated{$itr}=$depth+1;
}
my @nums= (sort{$calculated{$b}<=>$calculated{$a}} keys %calculated);
my $max=shift @nums;
my $max_count=$calculated{$max};
print "max = $max with depth $max_count";