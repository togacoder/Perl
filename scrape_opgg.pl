use strict;
use warnings;
use Web::Scraper;
use URI;
use Encode qw/encode_utf8/;

my $scraper = scraper {
	process('div.SummonerName >a ',
			'name[]' => 'TEXT');
};

print "summoner name: ";
my $summonerName = <>; chomp $summonerName;
print "-- wait --\n";
my $url = 'http://jp.op.gg/summoner/userName=' . $summonerName;
my $uri = new URI($url);
my $res = $scraper->scrape($uri);

my %hash;
foreach (@{$res->{name}}) {
	$hash{$_}++;
}

print "-- get summoners --\n";
foreach my $key (keys %hash) {
	print encode_utf8 "$key: $hash{$key}\n";
}

my @summonerList = ('ZouSenpai', 'ぽよ氏', 'saruma1031', 'YwHALwY', 'Boosted Support', 'ｍｃｃｎ', 't4pu', 'make it', 'ソリアゲ王者ハサキング', 'うらぷろＨＪＭ', 'コリアンオッパ', 'るっかるん', 'るっかだゆ', 'MilkyBerry', 'Rivelia', 'kokou', '岸下コロンビア', 'Amy to Niv', 'John Doe', '睡魔ちゃん', 'IO', '月影まゆ', 'silent or mute', 'King of Player', 'けんかはやめろ', 'Sailor Saturn', 'demichaaan', 'とろぴ', 'EmilieDeRochefor', 'kotosinokabu', 'KTAP', 'AtTwilight', 'Purimichang', 'Pokémon Master', 'Asesinato', 'Timmy', 'Qcoco', 'marukatsu', 'Kurl', 'bunyaa');

print "-- match summoners --\n";
foreach my $key (@summonerList) {
	if((defined $hash{$key})and(0 < $hash{$key})) {
		print encode_utf8 "$hash{$key}\n";
	}
}

exit;
