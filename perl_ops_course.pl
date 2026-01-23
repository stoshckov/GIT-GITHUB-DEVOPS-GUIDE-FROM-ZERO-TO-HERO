#!/usr/bin/perl
use strict;
use warnings;

my $state_file = ".course_state";
open my $fh_in, "<", $state_file or die;
my $current_state = <$fh_in>;
close $fh_in;
chomp($current_state);
if ($current_state eq "lesson1_complete") {
 my $topic = "Variables + Strings";
 print "--- PERL OPS COURSE ---\n";
 print "Lesson 2: $topic\n";
 print "Action: Assign a string to a variable and print it.\n";
 my $status = "Complete";
 print "Current Status: $status\n";
 print "--- SUCCESS: Lesson 2 Complete ---\n"; open my $fh, ">", $state_file; print $fh "lesson2_complete\n"; close $fh; exit;
}

print "--- PERL OPS COURSE ---\n";
print "Lesson 1 (MAIN): print + strict/warnings\n";
print "Action: Print \"Hello Ops\" and exit.\n";

print "Hello Ops\n";

open my $fh, ">", $state_file or die "Cannot open $state_file: $!";
print $fh "lesson1_complete\n";
close $fh;

print "--- SUCCESS: Lesson 1 (MAIN) Complete ---\n";
