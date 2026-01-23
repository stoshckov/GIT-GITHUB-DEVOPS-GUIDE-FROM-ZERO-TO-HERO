#!/usr/bin/perl
use strict;
use warnings;

my $state_file = ".course_state";

print "--- PERL OPS COURSE ---\n";
print "Lesson 1: print + strict/warnings\n";
print "Action: Print \"Hello Ops\" and exit.\n";

print "Hello Ops\n";

open my $fh, ">", $state_file or die "Cannot open $state_file: $!";
print $fh "lesson1_complete\n";
close $fh;

print "--- SUCCESS: Lesson 1 Complete ---\n";
