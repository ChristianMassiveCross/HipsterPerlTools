#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Getopt::Long;

my %config;

$config{'CVSUser'} = "docT";
$config{'CVSPass'} = "12345";
$config{'CVSServer'} = "lalal.de";
$config{'CVSPath'} = "/usr/local/cvs";

GetOptions (
  "help|h"             => sub{ Usage(); },
  "version|v=s"        => \$config{'Version'},
);

if ( $config{'Version'} ){
	getCVS();
	doCleanUp();
	doGit();
}

sub getCVS {
	print "### get cvs Version:$config{'Version'} ###\n";
	my  $CVSlogin = sprintf(
		"cvs -d :pserver:%s:%s@%s:%s login",
		$config{'CVSUser'},
		$config{'CVSPass'},
		$config{'CVSServer'},
		$config{'CVSPath'}

	);
	
	print $CVSlogin."\n";
	print " checkout branch\n";
	#system("mkdir test");
}
sub doCleanUp{
	print "### cleanUp CVS checkout ###\n";
	print "remove c binaries\n";
	print "remove training\n";
	print "remove RnD\n";

}
sub doGit {
	print "### sync to git ###\n";
	print "git -A\n";
	print "git commit -m '$config{'Version'}'\n";
	print "git push origin master\n";
}

1;
