#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use JSON;
use HTTP::Tiny;

# PRESERVATION DIRECTIVE ACTIVE: All logic preserved and cumulative.
# Version: 1.1.0 (Added Outbound Notification)

# --- CONFIGURATION ---
my $db_file = "ops_metrics.db";
my $webhook_url = "https://httpbin.org/post"; # A safe mock URL for testing

# --- CORE FUNCTIONS ---

sub get_db_handle {
    my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file", "", "", { RaiseError => 1 })
        or die "[FATAL] Could not connect to database: $DBI::errstr";
    return $dbh;
}

sub generate_header {
    my ($title) = @_;
    my $line = "=" x 45;
    return "$line\n  OPS REPORT: $title\n  DATE: " . scalar(localtime) . "\n$line\n";
}

sub send_alert {
    my ($message) = @_;
    print "\n[Action] Sending alert to Webhook...\n";

    my $http = HTTP::Tiny->new();
    my $response = $http->post_form($webhook_url, { 
        content => $message,
        bot_name => "PerlOpsBot"
    });

    if ($response->{success}) {
        print "[SUCCESS] Alert dispatched to Slack alerts.\n";
    } else {
        print "[WARN] Alert failed: $response->{status} $response->{reason}\n";
    }
}

sub run_summary_report {
    my $dbh = get_db_handle();
    my $report_content = generate_header("SYSTEM SCAN SUMMARY");

    my $stats = $dbh->selectrow_hashref("SELECT COUNT(*) as total FROM scan_history");
    $report_content .= "Total Scans in DB: $stats->{total}\n";
    
    # Print to console
    print $report_content;

    # Send via Webhook if we have data
    if ($stats->{total} > 0) {
        send_alert($report_content);
    }

    $dbh->disconnect();
}

sub display_help {
    print << "HELP";
Usage: ./reporter.pl [options]

Options:
  --summary    Generate and dispatch scan summary (Default)
  --help       Display this help menu
HELP
}

# --- MAIN PROGRESSION ---

if (grep { /--help/ } @ARGV) {
    display_help();
} else {
    run_summary_report();
    print "\n--- SUCCESS: Preservation Directive Applied ---\n";
}
