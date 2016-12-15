#! /usr/bin/perl

open(IN,"$ARGV[0]")||die "Couldn't open file $ARGV[0]";

while(<IN>){
	$meanQ = 0;
	$seq = <IN>;
	<IN>;
	$quality = <IN>;
	chomp($quality);
	@quality = split("",$quality);
	foreach(@quality){
		$meanQ += ord($_)-33;
	}
	$meanQ = int($meanQ/length($quality));
	$hash{$meanQ}++;
}
foreach(sort keys %hash){
	print "$_\t$hash{$_}\n";
}