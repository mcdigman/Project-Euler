#! usr/bin/perl
#Matthew Digman
use strict;
open FILE,'<keylog.txt' or die "unable to read from file: $!";
my %log_attempts;
for(<FILE>){
	chomp;
	$log_attempts{$_}=1;
}
my @attempts=keys %log_attempts;
sub functionally_identical{
	my $a1=shift;
	my $a2=shift;
	my @array1=@{$a1};
	my @array2=@{$a2};
	OUTER:for(@array1){
		my $seek=$_;
		next unless(defined $seek);
		for(@array2){
			next OUTER if($seek==$_);
		}
		return 0;
	}
	OUTER:for(@array2){
		my $seek=$_;
		next unless(defined $seek);
		for(@array1){
			next OUTER if($seek==$_);
		}
		return 0;
	}
	return 1;
}

my %requirements;
$requirements{$_}=[[],[]] for(0,1,2,3,6,7,8,9);
for(@attempts){
	my @nums=split '', $_;
	push (@{@{$requirements{$nums[0]}}[1]},($nums[1],$nums[2]));
	push (@{@{$requirements{$nums[1]}}[1]},($nums[2]));
	push (@{@{$requirements{$nums[1]}}[0]},($nums[0]));	
	push (@{@{$requirements{$nums[2]}}[0]},($nums[0],$nums[1]));
}
my @needed=keys %requirements;
my @predicted_pass=(undef,undef,undef,undef,undef,undef,undef,undef);
while(@needed){
	for(@needed){
		if (!(defined $requirements{$_}->[0])&&!defined $predicted_pass[7]){
			$predicted_pass[7]=$_;
			$requirements{$_}=undef;
			next;
		}
		if (!(@{$requirements{$_}->[1]})&&!defined $predicted_pass[0]&&!$_==0){
			$predicted_pass[0]=$_;
			$requirements{$_}=undef;
			next;
		}
		my $seek=$_;
		my @left=@{$requirements{$seek}->[0]};
		my @right=@{$requirements{$seek}->[1]};		
		for(my $itr=1; $itr<7; $itr++){
			my @copy=@predicted_pass;
			my @f_left=splice @copy, $itr,0;
			my @f_right=@copy;
			if(functionally_identical(\@left, \@f_left)&&functionally_identical(\@right,\@f_right)){
				$predicted_pass[$itr]=$seek;
				$requirements{$seek}=undef;
				next;
			}
		}
	}
	@needed=keys %requirements;
}
print @predicted_pass;
	