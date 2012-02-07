#! usr/bin/perl
#Matthew Digman
my $sum;
for(my $itr=2; $itr<1000000; $itr++){
	my @nums=split '', $itr;
	my $digit_sum;
	$digit_sum+=$_**5 for(@nums);
	if($digit_sum==$itr){
		$sum+=$itr;
	}
}
print $sum;