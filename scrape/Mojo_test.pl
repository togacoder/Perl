use strict;
use warnings;
use Mojolicious::Lite;
use lib './';
require 'scrape_opgg.pm';

get '/' => sub {
	my $self = shift;
	$self->render('index');
};

get '/result' => sub {
	my $self = shift;
	my $name = $self->req->param('name');
	$self->stash->{name} = $name;
	$self->render('result');
};
app->start;

__DATA__
@@ index.html.ep
<html>
	<head>
		<title> Index </title>
	</head>
	<body>	
		<form action="/result" method="get">
			<b>Summoner Name:</b>
			<input type="text" name="name"/>
			<input type="submit" value="submit"/>
		</form>
	</body>
</html>

@@ result.html.ep
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
