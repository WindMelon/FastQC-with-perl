#! /usr/bin/perl

open(IN,"$ARGV[0]")||die "Couldn't open file $ARGV[0]";

while(<IN>){
	$seq = <IN>;
	<IN>;
	$quality = <IN>;
	chomp($seq);
	$GC = $seq =~ tr/GCgc/GCgc/;
	$GC = int(100*($GC/length($seq)));
	$hash{$GC}++;
}

foreach(sort keys %hash){
	print "$_\t$hash{$_}\n";
}