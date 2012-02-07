#! usr/bin/perl
#Matthew Digman
use strict;
use warnings;
open FILE, '<triangles.txt' or die "unable to open file: $!";
my @triangles;
for(<FILE>){
	chomp;
	push @triangles, $_;
}
my $count;
for(@triangles){
	my ($vertice1,$vertice2,$vertice3)=m/([\d-]+,[\d-]+)/g;
	my @vertice1=split ',', $vertice1;
	my @vertice2=split ',', $vertice2;
	my @vertice3=split ',', $vertice3;
	my $s1=(($vertice1[1]-$vertice2[1])/(($vertice1[0]-$vertice2[0])||.0000001));
	my $i1=$vertice1[1]-$s1*$vertice1[0];
	my $s2=(($vertice1[1]-$vertice3[1])/(($vertice1[0]-$vertice3[0])||.0000001));
	my $i2=$vertice1[1]-$s2*$vertice1[0];
	my $s3=(($vertice2[1]-$vertice3[1])/(($vertice2[0]-$vertice3[0])||.0000001));
	my $i3=$vertice2[1]-$s3*$vertice2[0];
	#print "$vertice1 $vertice2 $vertice3\n";
	#print "$s1 $i1\n$s2 $i2\n$s3 $i3\n";
	if(($vertice3[1]-($vertice3[0]*$s1+$i1))>0==(0-$i1)>0){
		if(($vertice2[1]-($vertice2[0]*$s2+$i2))>0==(0-$i2)>0){
			if(($vertice1[1]-($vertice1[0]*$s3+$i3))>0==(0-$i3)>0){
				$count++;
			}
		}
	}
}
print $count;
