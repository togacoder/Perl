use v6;
use Cro::HTTP::Client;

my $client = Cro::HTTP::Client.new(
	headers => [
		User-agent => 'Cro'
	]
);

my $url = 'https://www.perl6.org/';
my $resp = await Cro::HTTP::Client.get("$url");
my $body = await $resp.body;

say $body;
