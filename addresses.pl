#! /usr/bin/perl
# Matthew Digman
use strict;
my %people_cost;
my %place_people;
my %people_place;
my %place_sizes;
for(<STDIN>){
	my ($name, $cost, @places) = split ' ', $_;
	$cost=~s/\$//;
	$people_cost{$name}=$cost;
	for(@places){
		push @{$place_people{$_}}, $name;
		${$people_place{$name}}{$_} = 1;
		$place_sizes{$_}++;
	}
}
my @people = keys %people_cost;
my %parents;
my @places;
for(@people){
	my @places =keys  %{$people_place{$_}};
	@places = sort {$place_sizes{$a}<=>$place_sizes{$b}} @places;
	while(@places){
		my $place = shift @places;
		if(! defined $places[0]){
			next;
		}elsif(defined $parents{$place}){
			next if($parents{$place} eq $places[0]);
			print "ambiguous hierarchy\n";
			exit;
		}elsif($place_sizes{$place} == $place_sizes{$places[0]}){
			print "ambiguous hierarchy\n";
			exit;
		}else{
			$parents{$place}=$places[0];
		}
	}
}
my %children;
for(keys %place_sizes){
	next if(! exists $parents{$_});
	push @{$children{$parents{$_}}}, $_;
}
for(sort {$a cmp $b} keys %place_sizes){
	if(! exists $parents{$_}){
		&printtree($_, 0);
	}
}
sub printtree{
	my $me = $_[0];
	my $spaces = $_[1];
	my $prev_ave = $_[2];
	my @children;
	if(! exists $children{$me}){
		@children = ();
	}else{
		@children = @{$children{$me}}; 
	}
	my @people = @{$place_people{$me}};
	my @here_exc;
	my $tot_cost = 0;
	OUTER:for(@people){
		my $person = $_;
		$tot_cost+= $people_cost{$person};
		for(@children){
			next OUTER if(${$people_place{$person}}{$_});
		}
		push @here_exc, $person;
	}
#	print "$_ : NONE : @here_exc\n" if(! exists $children{$_});
	my $ave = $tot_cost/($#people+1);
	my $dev = "";
	if(defined $prev_ave){
		if($prev_ave == $ave){
			$dev = " (average)";
		}else{
			$dev = 	sprintf "%.02f",($ave-$prev_ave);
			$dev = &form_num($dev);
			$dev = " ($dev)";
		}
	}
	my $brick =  " "x($spaces*2);
	printf "$brick".$me." \$%.02f$dev\n", $ave;
	for(sort{$a cmp $b} @here_exc){
		printf "$brick  - $_ \$$people_cost{$_}\n";
	}
	for(sort{$a cmp $b} @children){
		printtree($_,$spaces+1, $ave);
	}
}
sub form_num{
	my $num = $_[0];
	if($num=~/\-/){
		$num=~s/\-/\-\$/;
	}else{
		$num = "+\$$num";
	}
	$num;
}
