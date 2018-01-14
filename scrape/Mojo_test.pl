use strict;
use warnings;
use Mojolicious::Lite;
use lib './';
require 'scrape_opgg.pm';

get '/' => sub {
	my $self = shift;
	$self->render('index');
};
app->start;

__DATA__
@@ index.html.ep
% my ($hash) = opgg::summonerNameList();
<html>
	<head>
		<title>Index</title>
	</head>
	<body>
		% foreach (keys %$hash) {
			<dt><%= $_ %></dt>
		% }
	</body>
</html>
