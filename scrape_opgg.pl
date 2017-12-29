use strict;
use warnings;
use Web::Scraper;
use URI;
use Encode qw/encode_utf8/;

my $scraper = scraper {
	process('div.SummonerName >a ',
			'name[]' => 'TEXT');
};

my $url = 'http://jp.op.gg/summoner/userName=togaerror';
my $uri = new URI($url);

my $res = $scraper->scrape($uri);

foreach (@{$res->{name}}) {
	if($_ eq 'dyuma') {
		print encode_utf8($_) . "\n";
	}
}

exit;
