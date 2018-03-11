#!/usr/bin/env perl


# morbo path ~/.plenv/versions/5.26.1/bin/morbo
use strict;
use warnings;
use Mojolicious::Lite;
#use lib './';
use lib qw{ ./ };
require 'scrape_opgg2.pm';

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
% my ($summoner) = opgg::summonerNameList($name);
% my ($champion) = opgg::championNameList($name);
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
			% foreach (sort {$summoner->{$b} <=> $summoner->{$a}} keys %$summoner) {
				<tr>
					<td> <a href = "http://jp.op.gg/summoner/userName=<%= $_ %> " target = "_blank">
							<%= $_ %> 
						</a> </td>
					<td> <%= $summoner->{$_} %> </td>
				</tr>
			% }
			<tr>
				<td> CN </td>
				<td> Matting </td>
			</tr>
			% foreach (sort {$champion->{$b} <=> $champion->{$a}} keys %$champion) {
				<tr>
					<td> <%= substr($_, 0, length($_)/2) %> </td>
					<td> <%= $champion->{$_} %> </td>
				</tr>
			% }
		</table>
	</body>
</html>
