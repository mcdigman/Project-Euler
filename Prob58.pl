#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use bigint;
my %primes;
sub sieve{
	my @nums=(2..10000000);
	while(@nums){
		my $prime=shift @nums;
		if(defined $prime){
			$primes{$prime}=1;
			for(my $itr=$prime-1; $itr<@nums;$itr+=$prime){
				if(defined $nums[$itr]){
					$nums[$itr]=undef;
				}
			}
		}
	}
	1;
}
my @right;
my @left;
my $num=1;
my $side=0;
sieve;
for(my $itr=0; $itr<10000000; $itr++){
	$side+=2;
	$num+=$side;
	push @right,$num;
	$num+=$side;
	push @left,$num;
	$num+=$side;
	push @right, $num;
}
my @right_divisors;
for(@right){
	last if($_>10000000);
	push @right_divisors, $_ if(exists $primes{$_});
}
my @left_divisors;
for(@left){
	last if($_>10000000);
	push @left_divisors, $_ if(exists $primes{$_});
}
sub is_left_prime{
	my $num=shift;
	my $stop=sqrt $num;
	for(@left_divisors){
		return 0 unless ($num%$_);
		last if($_>$stop);
	}
	1;
}
sub is_right_prime{
	my $num=shift;
	my $stop=sqrt $num;
	for(@right_divisors){
		return 0 unless ($num%$_);
		last if($_>$stop);
	}
	1;
}
my $itr1=0;
my $itr2=0;
my $count_num=1;
my $count_prime=0;
print "Entered Block\n";
while(($count_prime==0||$count_prime/$count_num>=.10)&&$count_num<10000000){
	$count_num+=4;
	if(is_left_prime($left[$itr1])){
		$count_prime++;
	}
	if(is_right_prime($right[$itr2])){
		$count_prime++;
	}
	if(is_right_prime($right[$itr2+1])){
		$count_prime++;
	}
	$itr1++;
	$itr2+=2;
}
print $itr2+1,"\n";