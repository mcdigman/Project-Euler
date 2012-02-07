#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
open CIPHER, 'cipher1.txt' or die "unable to read cipher: $!";
my $cipher=<CIPHER>;
chomp $cipher;
my @cipher=split ',', $cipher;
open WORDS, 'words.txt' or die "unable to read dictionary: $!";
my $words=<WORDS>;
chomp $words;
my @words=split ',', $words;
s/"//g for(@words);
$_=lc $_ for (@words);
print $_ for(@words);
my $best_match;
my $max_count=0;
for(my $itr1=97; $itr1<=122; $itr1++){
	for(my $itr2=97; $itr2<=122; $itr2++){
		for(my $itr3=97; $itr3<=122; $itr3++){
			my @deciphered;

			for(my $itr4=0; $itr4<=$#cipher; $itr4++){
				if($itr4%3==0){
					$deciphered[$itr4]=$cipher[$itr4]^$itr1;
				}elsif($itr4%3==1){
					$deciphered[$itr4]=$cipher[$itr4]^$itr2;
				}else{
					$deciphered[$itr4]=$cipher[$itr4]^$itr3;
				}
			}
			my @plain_text=map{chr $_} @deciphered;
			my $plain_text=join '', @plain_text;
			my $count=0;
			for(@words){
				if($plain_text=~/($_)/i){
					$count++;
				}
			}
			if($count>$max_count){
				$max_count=$count;
				$best_match=$plain_text;
			}
		if($plain_text=~/^[a-zA-Z0-9 ]*$/){
			print "$plain_text\n";
			$best_match=$plain_text;
		}
		}
	}
}
print "$best_match\n";
my $value;
for(split ('', $best_match)){
	$value+=ord $_;
}
print "$value\n";