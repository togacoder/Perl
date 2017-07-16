use strict;
use warnings;
use Data::Dumper;

my $str = <>;
&Caesar($str);

exit;

sub Caesar {
	my ($s) = @_;
	my @str = split //, $s;
	my @num;
	for(my $i = 0; $i <= $#str; $i++) {
		$num[$i] = ord($str[$i]);
	}

	for(my $i = 0; $i < 26; $i++) {
		for(my $j = 0; $j <= $#str; $j++) {
			if((ord("a") <= $num[$j])and($num[$j] <= ord("z"))) {
				if(ord("z") < $num[$j] + $i) {
					print chr($num[$j] + $i - 26);
				} else {
					print chr($num[$j] + $i);
				}
			} elsif((ord("A") <= $num[$j])and($num[$j] <= ord("Z"))) {
				if(ord("Z") < $num[$j] + $i) {
					print chr($num[$j] + $i - 26);
				} else {
					print chr($num[$j] + $i);
				}
			} else {
				print chr($num[$j]);
			}
		}
		print "\n";
	}
}
