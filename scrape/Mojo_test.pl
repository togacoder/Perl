use strict;
use warnings;
use Mojolicious::Lite;
use lib './';
require 'scrape_opgg.pm';

get '/' => sub {
	my $self = shift;
	$self->render('index');
};

get 'user' => sub {
	my $self = shift;
	my $name = "togaerror";
	$self->render('user', 'name' => $name);
};
app->start;

__DATA__
@@ index.html.ep
<html>
	<head>
		<title> Index </title>
	</head>
	<body>
		<b>Summoner Name: </b> <%= text_field 'name' %><br>
	</body>
</html>

@@ user.html.ep
% my $name = stash('name');
% my ($hash) = opgg::summonerNameList($name);
<html>
	<head>
		<title> User </title>
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
		<table>
			<tr>
				<td> SN </td>
				<td> Matting </td>
			</tr>
		% foreach (sort {$hash->{$b} <=> $hash->{$a}} keys %$hash) {
			<tr>
				<td> <a href = "http://jp.op.gg/summoner/userName=<%= $_ %> >" target = "_blank">
						<%= $_ %> 
					</a> </td>
				<td> <%= $hash->{$_} %> </td>
			</tr>
		% }
		</table>
	</body>
</html>
