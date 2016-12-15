#! /usr/bin/perl

open(IN,"$ARGV[0]")||die "Couldn't open file $ARGV[0]";

print "num\tmean\tmin\tq25\tq50\tq75\tmax\n";
$num = 1;
while(<IN>){
	$i = 1;
	$mean = 0;
	$min = 100;
	$max = 0;
	$q25 = 0;
	$q75 = 0;
	$q50 = 0;
	$seq = <IN>;
	<IN>;
	$quality = <IN>;
	chomp($quality);
	@quality = split("",$quality);
	foreach(sort @quality){
		$Q = ord($_)-33;
		$mean += $Q;
		$min = $Q>$min?$min:$Q;
		$max = $Q>$max?$Q:$max;
		if($i == int(length($quality)/4)){
		$q25 = $Q;
		}
		if($i == int(length($quality)/2)){
		$q50 = $Q;
		}
		if($i == int(length($quality)/4)*3){
		$q75 = $Q;
		}
		$i++;
	}
	$mean = int($mean/length($quality));
	print "$num\t$mean\t$min\t$q25\t$q50\t$q75\t$max\n";
	$num++;
}
