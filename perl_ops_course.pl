#!/usr/bin/perl
use strict;
use warnings;

my $state_file = ".course_state";

# --- UTILITIES ---
sub get_current_state {
    open my $fh, "<", $state_file or return "start";
    my @history = <$fh>;
    close $fh;
    chomp(my $last = $history[-1] // "start");
    return $last;
}

# --- MAIN LOGIC ---
my $status = get_current_state();

if ($status eq "lesson7_complete") {
    print "--- PERL OPS COURSE ---\nLesson 8: Regex Capturing (The Finale)\n";
    
    my $logfile = "system.log";
    open(my $in, "<", $logfile) or die $!;

    while (my $line = <$in>) {
        # Regex Breakdown:
        # ^(\S+ \S+)  -> Capture the date and time at the start
        # .*ERROR:    -> Match everything up to "ERROR:"
        # \s+(.*)$    -> Capture everything after the space to the end
        if ($line =~ /^(\S+ \S+).*ERROR:\s+(.*)$/) {
            my $time = $1;
            my $msg  = $2;
            print "[ALERT] Time: $time | Issue: $msg\n";
        }
    }
    close $in;

    print "--- CONGRATULATIONS: Level 1 (Fundamentals) Complete ---\n";
    exit;
}

print "Current state: $status. Complete Lesson 7 first!\n";
