

package threads;

use 5.6.1;
use strict;
use warnings;

use overload 
    '==' => \&equals,
    'fallback' => 1;


#use threads::Shared;

require Exporter;
require DynaLoader;


#use threads::Safe qw(localtime rand gmtime);

our @ISA = qw(Exporter DynaLoader);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use iThread ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);
our $VERSION = '0.01';

sub new {
    my $class = shift;
    return $class->create(@_);
}


sub equals {
    return 1 if($_[0]->tid() == $_[1]->tid());
    return 0;
}

$Config::threads = 1;

bootstrap threads $VERSION;


# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

threads - Perl extension allowing use of interpreter based threads from perl

=head1 SYNOPSIS

  use threads;

  sub start_thread {
      print "Thread started\n";
  }
  my $thread = threads->new("start_thread","argument");
  $thread->new(sub { print "I am a thread"},"argument");
  $thread->join();
  $thread->detach();

=head1 DESCRIPTION

Perl 5.6 has something called interpreter threads, interpreter threads are built on MULTIPLICITY and allows for several different perl interpreters to run in different threads. This has been used in win32 perl to fake forks, it has also been avaible to people embedding perl. 

I came across a situation where I needed a global cache of data and multiple threads working on a set of data using the cache for non changing data, so I decided to expose threadss to the perl level, that is were we realy need them.

threads are a bit different from what people normall thing of as threads, these threads do not share any memory at all, in the future it will be possible to explicitly share data.

please join perl-ithreads@perl.org for more information

=head1 TODO

=over

=item Fix so the return value is returned when you join

=item Add join_all

=item Fix memory handling!

=back

=head1 AUTHOR and COPYRIGHT

Artur Bergman <lt>artur at contiller.se<gt>

threads is released under the same license as Perl

Thanks to 

Richard Soderberg <lt>rs at crystalflame.net<gt> 
Helping me out tons, trying to find reasons for races and other wierd bugs!

Simon Cozens <lt>simon at brecon.co.uk<gt>
Being there to answer zillions of annoying questions 

Rocco Caputo <lt>troc at netrus.net<gt>

=head1 BUGS

=over

=item creating a thread from within a thread is unsafe under win32

=back

Plenty of bugs!

=head1 SEE ALSO

L<perl>, L<perlcall>, L<perlembed>, L<perlguts>

=cut


