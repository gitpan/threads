

use ExtUtils::testlib;
use Test;
use strict;
use Devel::Peek;
BEGIN { plan tests => 12 };
use threads;

use Carp;

threads->create(sub { croak "foo" })->join();
print "foo\n";



