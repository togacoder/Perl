use strict;
use warnings;

#16400以下の場合
$_ = <>;
chomp $_;
if((2 ** ($_ - 1) % $_ == 1) or ($_ == 2)) {
	print "$_は素数\n";
} else {
	print "$_は素数ではない\n";
} 

exit;
