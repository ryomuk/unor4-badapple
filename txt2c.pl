#!/usr/bin/perl

print "const unsigned long bmp[] = {\n";

#00000000000011111111111122222222
#22223333333333334444444444445555
#55555555666666666666777777777777
$n = 0;
$s = "";
$topcomma = " ";
while(<>){
    chomp;
    $s .= $_;
    if($n == 7){
	printf("%s0x%08x\n", $topcomma, oct('0b'.substr($s,0, 32)));
	printf(",0x%08x\n", oct("0b".substr($s,32, 32)));
	printf(",0x%08x\n", oct("0b".substr($s,64, 32)));
#	printf("%s%s", $topcomma, "0b".substr($s,0, 32)."\n");
#	printf(",%s", "0b".substr($s,32, 32)."\n");
#	printf(",%s", "0b".substr($s,64, 32)."\n");
	$topcomma = ",";
	$n = 0;
	$s = "";
    } else {
	$n++;
    }
}
print "};";
