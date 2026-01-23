#!/usr/bin/perl
use strict;
use warnings;
use DBI;

print "--- PERL OPS COURSE: LEVEL 3 ---\n";
print "Lesson 3: DBI & SQLite Persistence\n";

# 1. Connect to (or create) the database file
my $db_file = "ops_metrics.db";
my $dbh = DBI->connect("dbi:SQLite:dbname=$db_file", "", "", { RaiseError => 1 })
    or die $DBI::errstr;

# 2. Create a table if it doesn't exist
$dbh->do("CREATE TABLE IF NOT EXISTS scan_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    target TEXT,
    status TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
)");

# 3. Log a new scan result
my $target = "10.0.0.5";
my $status = "UP";

my $sth = $dbh->prepare("INSERT INTO scan_history (target, status) VALUES (?, ?)");
$sth->execute($target, $status);

print "Logged check for $target to $db_file.\n";

# 4. Query the last 3 entries
print "\nRecent Scan History:\n";
my $results = $dbh->selectall_arrayref("SELECT target, status, timestamp FROM scan_history ORDER BY id DESC LIMIT 3");

foreach my $row (@$results) {
    print " - $row->[2] | $row->[0] is $row->[1]\n";
}

$dbh->disconnect();
print "\n--- Level 3: Lesson 3 Complete ---\n";
