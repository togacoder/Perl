use v6;
use Cro::HTTP::Router;
use Cro::HTTP::Server;

my $host = '127.0.0.1';
my $port = 10000;
my $application = route {
	get -> {
		say "Hello Cro!";
		content 'text/html', 'Hello Cro!';
	}
	
	# GET /test
	get -> 'test', {
		say 'Hello Cro!';
		content 'text/html', 'Hello Cr!';
	}
}

my Cro::Service $service = Cro::HTTP::Server.new(
	:host($host), :port($port), :$application
);

say $host ~ ":" ~ $port;
$service.start;
say "start!";

react whenever signal(SIGINT) {
	say "Server stop!";
	$service.stop;
	exit;
}
