#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
my $year;
my $day_of_month=1;
my $num_days=0;
my @month_lengths=(31,28,31,30,31,30,31,31,30,31,30,31);
my @firsts_of_month;
for($year=1; $year<=100; $year++){
	for(@month_lengths){
		if($_==28&&(!$year%4)){
			if($year!=0){
				push @firsts_of_month,$num_days+29;
				$num_days+=29;
			}else{
				push @firsts_of_month,$num_days+28;
				$num_days+=28;
			}
		}else{
			push @firsts_of_month, $num_days+$_;
			$num_days+=$_;
		}
	}
}
my $first_sundays=grep{!(($_+5)%7)} @firsts_of_month;
print "$first_sundays\n";