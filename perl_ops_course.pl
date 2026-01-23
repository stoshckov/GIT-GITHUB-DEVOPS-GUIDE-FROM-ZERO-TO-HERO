#!/usr/bin/perl -T
use strict;
use warnings;
use JSON;
use IO::Socket::INET;

# Security Scrub
delete @ENV{qw(IFS CDPATH ENV BASH_ENV)};
$ENV{'PATH'} = '/bin:/usr/bin';

print "--- PERL OPS COURSE: LEVEL 2 FINALE ---\n";

# 1. Our Inventory (Usually from an API)
my $json_data = '{
    "check_list": [
        {"name": "Google_Web", "host": "google.com", "port": 80},
        {"name": "Cloudflare_DNS", "host": "1.1.1.1", "port": 53},
        {"name": "Local_SSH", "host": "127.0.0.1", "port": 22}
    ]
}';

my $inventory = decode_json($json_data);

print "Starting Parallel Service Monitor...\n\n";

foreach my $service (@{$inventory->{check_list}}) {
    my $pid = fork();

    if (!defined $pid) { die "Fork Failed: $!"; }

    if ($pid == 0) {
        # --- CHILD WORKER ---
        my $socket = IO::Socket::INET->new(
            PeerAddr => $service->{host},
            PeerPort => $service->{port},
            Proto    => 'tcp',
            Timeout  => 2
        );

        if ($socket) {
            print "[OK]   $service->{name} ($service->{host}:$service->{port})\n";
            $socket->close();
            exit(0);
        } else {
            print "[FAIL] $service->{name} ($service->{host}:$service->{port}) -> $!\n";
            exit(1);
        }
    }
}

# --- PARENT REAPER ---
# Wait for all 3 children to finish
while (wait() != -1) {}

print "\n--- Level 2 COMPLETE: You are a System Scripter! ---\n";
