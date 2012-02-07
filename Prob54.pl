#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
use Games::Cards::Poker;
sub suit_to_lower{
	my $hand=shift;
	$hand=~s/H/h/g;
	$hand=~s/C/c/g;
	$hand=~s/S/s/g;
	$hand=~s/D/d/g;
	$hand;
}
open FILE, 'poker.txt' or die "unable to open poker file: $!";
my @player1_hands;
my @player2_hands;
for(<FILE>){
	chomp;
	push @player1_hands, substr($_,0,14);
	push @player2_hands, substr($_,15,14);
}
my $count=0;
for(my $itr=0; $itr<=$#player1_hands; $itr++){
	my @p1=split ' ', (suit_to_lower($player1_hands[$itr])); 
	my @p2=split ' ', (suit_to_lower($player2_hands[$itr]));
	print "@p1 vs @p2\n";
	if(ScoreHand(@p1)<ScoreHand(@p2)){
		$count++;
		print "Player 1 wins\n";
	}
}
print $count;
	