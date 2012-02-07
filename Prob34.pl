#! usr/bin/perl
#Matthew Digman
sub factorial{
	my $num=shift;
	my $ans=1;
	while($num>1){
		$ans*=$num;
		$num--;
	}
	$ans;
}
my @factorials;
$factorials[$_]=factorial($_) for(0..9);
my $num;
print "@factorials\n";
for(3..100000){
	my @nums=split '', $_;
	my $sum;
	my $we=$_;
	for(@nums){
		$sum+=$factorials[$_]; 
		if($we==40585){
			print "$sum\n";
		}
	}
	if($sum==$_){
		$num+=$_;
	}
}
print $num;