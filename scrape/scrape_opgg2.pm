package opgg;

use strict;
use warnings;
use Web::Scraper;
use URI;
use Encode qw/encode_utf8/;

sub summonerNameList {
	my ($name) = shift;
	my $scraper = scraper {
		process('div.SummonerName > a', 'summoner[]' => 'TEXT');
	};
	my $url = 'http://jp.op.gg/summoner/userName=' . $name;
	my $uri = new URI($url);
	my $res = $scraper->scrape($uri);

	my %hash;
	foreach (@{$res->{summoner}}) {
		$hash{$_}++;
	}

	return (\%hash);
}

sub championNameList {
	my ($name) = shift;
	my $scraper = scraper {
		process('div.ChampionImage', 'champion[]' => 'TEXT');
	};
	my $url = 'http://jp.op.gg/summoner/userName=' . $name;
	my $uri = new URI($url);
	my $res = $scraper->scrape($uri);

	my %hash;
	foreach (@{$res->{champion}}) {
		$hash{$_}++;
	}
	delete($hash{''});
	return (\%hash);

}
1;
__END__
