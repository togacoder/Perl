package opgg;

use strict;
use warnings;
use Web::Scraper;
use URI;
use Encode qw/encode_utf8/;

my ($hash) = &summonerNameList('togaerror');

sub summonerNameList {
	my ($name) = shift;
	my $scraper = scraper {
		process('div.SummonerName > a', 'name[]' => 'TEXT');
	};
	# print "summoner name: ";
	# my $summonerName = <>; chomp $summonerName;
	# my $url = 'http://jp.op.gg/summoner/userName=' . $summonerName;
	my $url = 'http://jp.op.gg/summoner/userName=' . $name;
	my $uri = new URI($url);
	my $res = $scraper->scrape($uri);

	my %hash;
	foreach (@{$res->{name}}) {
		$hash{$_}++;
	}

	return (\%hash);
}

1;
__END__
