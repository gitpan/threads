

use ExtUtils::testlib;
use Test;
use strict;
use Devel::Peek;
BEGIN { plan tests => 12 };
use threads;

my $thread3 = threads->create(sub { threads->create(sub {})})->join();
