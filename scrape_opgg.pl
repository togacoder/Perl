use strict;
use warnings;
use Web::Scraper;
use URI;
use Encode qw/encode_utf8/;

my $scraper = scraper {
	process('div.SummonerName >a ',
			'name[]' => 'TEXT');
};

print "userName: ";
my $userName = <>; chomp $userName;
print "--wait--\n";
my $url = 'http://jp.op.gg/summoner/userName=' . $userName;
my $uri = new URI($url);
my $res = $scraper->scrape($uri);

my %hash;
foreach (@{$res->{name}}) {
	$hash{$_}++;
}

my @userList = ('ZouSenpai', 'ぽよ氏', 'saruma1031', 'YwHALwY', 'Boosted Support', 'ｍｃｃｎ', 't4pu', 'make it', 'ソリアゲ王者ハサキング', 'うらぷろＨＪＭ', 'コリアンオッパ', 'るっかるん', 'るっかだゆ', 'MilkyBerry', 'Rivelia', 'kokou', '岸下コロンビア', 'Amy to Niv', 'John Doe', '睡魔ちゃん', 'IO', '月影まゆ', 'silent or mute', 'King of Player', 'けんかはやめろ', 'Sailor Saturn', 'demichaaan', 'とろぴ', 'EmilieDeRochefor', 'kotosinokabu', 'KTAP', 'AtTwilight', 'Purimichang', 'Pokémon Master', 'Asesinato', 'Timmy', 'Qcoco', 'marukatsu', 'Kurl', 'bunyaa');

foreach my $key (@userList) {
	if((defined $hash{$key})and(0 < $hash{$key})) {
		print encode_utf8 "$hash{$key}\n";
	}
}

exit;
