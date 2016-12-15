#! /usr/bin/perl

open(IN,"$ARGV[0]")||die "Couldn't open file $ARGV[0]";

while(<IN>){
	$seq = <IN>;
	<IN>;
	$quality = <IN>;
	chomp($quality);
	@quality = split("",$quality);
	foreach(@quality){
		print(ord($_)-33);
		print("\t");
	}
	print "\n";
}