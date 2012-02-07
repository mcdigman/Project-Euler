#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my @digits;
my @small_primes=(2,3,5,7,11,13,17);
my @nums;
for(my $itr=0; $itr<=6; $itr++){
	my $num=$small_primes[$itr];
	my @multiples;
	while($num<1000){
		push @multiples, $num;
		$num+=$small_primes[$itr];
	}
	$nums[$itr]=\@multiples;
}
for(my $itr=0; $itr<5; $itr++){
	my %num1_suffixes;
	for(@{$nums[$itr]}){
		$num1_suffixes{substr $_, 1,2}=1;
	}
	my %num2_prefixes;
	for(@{$nums[$itr+1]}){
		$num2_prefixes{substr $_,0,2}=1;
	}
	my @new_1;
	my @new_2;
	for(@{$nums[$itr]}){
		if(exists $num2_prefixes{substr $_,1,2}&&!/(.).*(\1)/){
			push @new_1,$_;
		}
	}
	for(@{$nums[$itr]}){
		if(exists $num1_suffixes{substr $_,0,2}&&!/(.).*(\1)/){
			push @new_2, $_;
		}
	}
	$nums[$itr]=\@new_1;
	$nums[$itr+1]=\@new_2;
}
sub attempt_cat{
	my $d=shift;
	my $cume_num=shift;
	if(length $d==2){
		$d="0$d";
	}
	if(length $cume_num>2&&substr ($cume_num,(length $cume_num)-2,2)!=substr($d,0,2)){
		return 0;
	}
	if(length $cume_num>2&&length $cume_num<8){
		$d=substr $d,2,1;
	}
	$cume_num.=$d;
	if($cume_num=~/(.).*(\1)/){
		$cume_num=substr $cume_num,0,1;
		return 0;
	}
	return $cume_num;
}
my $sum;
my @p;
for(my $itr=1; $itr<10; $itr++){
	my $cume_num=$itr;
	for(@{$nums[0]}){
		my $result=attempt_cat($_,$cume_num);
		if($result){
			$cume_num=$result;
		}else{
			next;
		}
		for(@{$nums[1]}){
			my $result=attempt_cat($_,$cume_num);
			if($result){
				$cume_num=$result;
			}else{
				next;
			}
			for(@{$nums[2]}){
				my $result=attempt_cat($_,$cume_num);
				if($result){
					$cume_num=$result;
				}else{
					next;
				}
				for(@{$nums[3]}){
					my $result=attempt_cat($_,$cume_num);
					if($result){
						$cume_num=$result;
					}else{
						next;
					}
					for(@{$nums[4]}){
						my $result=attempt_cat($_,$cume_num);
						if($result){
							$cume_num=$result;
						}else{
							next;
						}
						for(@{$nums[5]}){
							my $result=attempt_cat($_,$cume_num);
							if($result){
								$cume_num=$result;
							}else{
								next;
							}
							for(@{$nums[6]}){
								my $result=attempt_cat($_,$cume_num);
								if($result){
									$cume_num=$result;
									push @p,$cume_num;
									$sum+=$cume_num;
								}else{
									next;
								}
								$cume_num=substr($cume_num,(length $cume_num)-3,3);
							}
							$cume_num=substr($cume_num,(length $cume_num)-1,1);
						}
						$cume_num=substr($cume_num,(length $cume_num)-1,1);						
					}
					$cume_num=substr($cume_num,(length $cume_num)-1,1);					
				}
				$cume_num=substr($cume_num,(length $cume_num)-1,1);			
			}
			$cume_num=substr($cume_num,(length $cume_num)-1,1);			
		}
		$cume_num=substr($cume_num,(length $cume_num)-1,1);		
	}
}
for(@p){
	print "$_\n";
}
print "answer: $sum\n";
