package Ops::Tools::Network;
use strict;
use warnings;

# This is a 'Constructor' for an Object
sub new {
    my ($class) = @_;
    my $self = {
        _check_count => 0,
    };
    return bless $self, $class;
}

sub check_port {
    my ($self, $host, $port) = @_;
    $self->{_check_count}++;
    print "[Module] Running check #$self->{_check_count} on $host...\n";
    # (Simulated check)
    return 1;
}

1; # Modules must return true
