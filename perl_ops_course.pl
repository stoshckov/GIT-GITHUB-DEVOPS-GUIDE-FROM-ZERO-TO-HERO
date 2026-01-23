#!/usr/bin/perl
use strict;
use warnings;

my $state_file = ".course_state";

# Check current progress
open my $fh_check, "<", $state_file or die "Run Lesson 1 first!";
my @history = <$fh_check>;
close $fh_check;
my $current_state = $history[-1];
chomp($current_state);

# --- LESSON 3: LOGIC ---
if ($current_state eq "lesson2_complete") {
    print "--- PERL OPS COURSE ---\n";
    print "Lesson 3: Logic (if/else)\n";
    my $server_status = "down"; 
    print "System Check: Server is $server_status.\n";
    if ($server_status eq "up") {
        print "Status: All systems nominal.\n";
    } else {
        print "Action Required: Restarting server...\n";
        $server_status = "up";
    }
    open my $fh_out, ">>", $state_file;
    print $fh_out "lesson3_complete\n";
    close $fh_out;
    print "New Status: $server_status\n";
    print "--- SUCCESS: Lesson 3 Complete ---\n";
    exit;
}

# --- LESSON 2: VARIABLES ---
if ($current_state eq "lesson1_complete") {
    print "--- PERL OPS COURSE ---\nLesson 2: Variables\nStatus: Complete\n";
    exit;
}

# --- LESSON 1: PRINT ---
print "--- PERL OPS COURSE ---\nLesson 1: Print\nHello Ops\n";
