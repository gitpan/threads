

use ExtUtils::testlib;
use Test;
use strict;
use Devel::Peek;
BEGIN { plan tests => 12 };
use threads;


threads->create(sub { 
    my $self = threads->self();
    print $self->tid();
    print "\n";
})->join();



