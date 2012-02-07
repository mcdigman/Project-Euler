#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use 5.10.0;
sub digit_to_length{
	my $num=shift;
	given($num){
		return 3 when($num==1||$num==2||$num==6);
		return 4 when($num==4||$num==5||$num==9);
		return 5 when($num==3||$num==7||$num==8);
		default{
			return 0;
		}
	}
}
sub ten_to_length{
	my $num=shift;
	my $return;
	given($num){
		$return=3 when($num==10);
		$return=6 when($num==11||$num==12);
		$return=7 when($num==15||$num==16);
		$return=8 when($num==13||$num==14||$num==18||$num==19);
		$return=9 when($num==17);
		default{
			given(my $num2=substr($num,0,1)){
				$return=5 when($num2==4||$num2==5||$num2==6);
				$return=6 when($num2==2||$num2==3||$num2==8||$num2==9);
				$return=7 when($num2==7);
				default{
					$return=0;
				}
			}
			$return+=digit_to_length(substr($num,1,1));		
		}
	}
	$return;
}
my $sum=0;
for(1..1000){
	my $hundreds=0;
	my $tens=0;
	my $ones=0;
	if($_>999){
		$sum+=11;
	}
	if($_>99&&$_<1000){
		$hundreds+=7+digit_to_length(substr $_,-3,1);
		if($_%100){
			$hundreds+=3;
		}
	}
	if($_>9&&$_<1000){
		$tens+=ten_to_length(substr($_,-2,2));
	}else{
		$ones=digit_to_length($_);
	}
	print "$_ ",$hundreds+$tens+$ones,"\n";
	$sum+=$hundreds+$tens+$ones;
}
print "$sum\n";