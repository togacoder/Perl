use strict;
use warnings;
&main;
exit;
sub main {
	my @nums = (1..100);
	&FizzBuzz(@nums);
}

sub FizzBuzz {
	my @nums = @_;
	my %mod = ("mod3" => "Fizz",
				"mod5" => "Buzz", 
				"mod15" => "FizzBuzz");
	
	for(my $i = 0; $i <= $#nums; $i++) {
		if($nums[$i] % 15 == 0) {
			print "$mod{mod15}\n";
		} elsif($nums[$i] % 5 == 0) {
			print "$mod{mod5}\n";
		} elsif($nums[$i] % 3 == 0) {
			print "$mod{mod3}\n";
		} else {
			print $nums[$i], $/;
		}
	}
}
