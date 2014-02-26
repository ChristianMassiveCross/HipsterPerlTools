#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Getopt::Long;

my %config;

$config{'CVSUser'} = "docT";
$config{'CVSPass'} = "12345";

GetOptions (
  "help|h"             => sub{ Usage(); },
  "version|v=s"        => \$config{'Version'},
);

if ( $config{'Version'} ){
	getCVS();
	doGit();
}

sub getCVS {
	print "get cvs Version:$config{'Version'} \n";
}

sub doGit {
	print "git -A\n";
	print "git commit -m '$config{'Version'}'\n";
	print "git push origin master\n";
}

1;
