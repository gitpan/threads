# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';
use ExtUtils::testlib;
use Test;
use strict;
BEGIN { plan tests => 12 };
use threads;
use Devel::Peek;





{
my $i = 1;
bless sub { $i},"FOO";
Dump($i);
print "foo\n";
threads->create(sub {})->join();
print "foo2\n";
}






