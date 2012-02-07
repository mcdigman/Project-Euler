#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my %available;
$available{$_}=1 for(1..9);
my @five_gons;
for(my $goal=12; $goal<15; $goal++){
	&generate_5gon(0,$goal,"C**","***","***","***","***");
}
@five_gons=sort @five_gons;
print "$_\n"for(@five_gons);

sub generate_5gon{
	my $pos=shift;
	my $goal=shift;
	my @current_full=@_;
	my @block=split '', $current_full[$pos];
	$block[0]=10 if($block[0] eq 'C');
	my @available=keys %available;
#	print "GOAL: $goal BLOCK: $current_full[$pos] FULL:@current_full @available \n" if($pos==4);
	OUTERMOST:for(my $itr1=0; $itr1<@available; $itr1++){
		OUTER:for(my $itr2=0; $itr2<@available; $itr2++){
			next if($itr2==$itr1&&$pos!=4);
			for(my $itr3=0; $itr3<@available; $itr3++){
				next if(($itr3==$itr2||$itr3==$itr1)&&$pos!=4);
				my ($num1,$num2,$num3)=($available[$itr1],$available[$itr2],$available[$itr3]);
				$num1=$block[0] if($block[0] ne '*');
				$num2=$block[1] if($block[1] ne '*');
				$num3=$block[2] if($block[2] ne '*');
				my $sum=$num1+$num2+$num3;
				next if($sum !=$goal);
				delete $available{$available[$itr1]} if($block[0] eq '*');
				delete $available{$available[$itr2]} if($block[1] eq '*');
				delete $available{$available[$itr3]} if($block[2] eq '*');
				$current_fu+ll[-1]=~s/\*\*\*/**$num2/ if($pos==0);
				if(defined $current_full[$pos+1]){
					my $orig1=$current_full[$pos];
					my $orig2=$current_full[$pos+1];
					$current_full[$pos]="$num1$num2$num3";
					$current_full[$pos+1]=~s/(.)\*(.)/$1$num3$2/;
					generate_5gon($pos+1, $goal, @current_full);
					$current_full[$pos+1]=$orig2;
					$current_full[$pos]=$orig1;
				}else{	
					my $orig=$current_full[$pos];
					$current_full[$pos]="$num1$num2$num2";
					my @loc;
					for(0..4){
						if($current_full[$_]=~/^6/){
							push @loc, $current_full[$_];
							for(my $itr=$_+1; $itr!=$_; $itr++){
								$itr=0 if($itr==5);
								push @loc, $current_full[$itr];
							}
						}
					}
					push @five_gons, join '', @loc;
					#print "$goal: $five_gons[-1]\n";
					$current_full[$pos]=$orig;
				}
				$current_full[-1]='***' if($pos==0);
				for(@available){	
					$available{$_}=1;
				}
			}
		}
	}
	1;
}

			