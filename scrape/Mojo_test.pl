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
	<style>
		table {
			border-collapse: collapse;
		}
		td {
			border: solid 1px;
			padding: 0.5em;
		}
	</style>
	<body>
		<h1>Summoner Names: matting count</h1>
		<table>
			<tr>
				<td> SN </td>
				<td> Matting </td>
			</tr>
		% foreach (sort {$hash->{$b} <=> $hash->{$a}} keys %$hash) {
			<tr>
				<td> <%= $_ %> </td>
				<td> <%= $hash->{$_} %> </td>
			</tr>
		% }
		</table>
	</body>
</html>
