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
}else{
	Usage();
}
# ---------------------------------------------------------------------
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
# ---------------------------------------------------------------------
sub doCleanUp{
	print "### cleanUp CVS checkout ###\n";
	deletePath('training folders');
	deletePath('RnD folders');
	deletePath('c folders'); 

}
# ---------------------------------------------------------------------
sub deletePath{
	my ($path) = @_;
	print "remove: $path\n";
	print "rm -fR $path \n";
}
# ---------------------------------------------------------------------
sub doGit {
	print "### sync to git ###\n";
	# open Questions:
	# - how make/proof git login
	# - whats about the right repro  Dist::Zilla::Plugin::Git:??
	print "git -A\n";
	print "git commit -m '$config{'Version'}'\n";
	print "git push origin master\n";
}
# ---------------------------------------------------------------------
sub Usage {

print <<END;
Usage:
perl perlSystemTest.pl -v="1.23.4"
check for:
\t cvs stuff
\t git stuff
END
}
1;
