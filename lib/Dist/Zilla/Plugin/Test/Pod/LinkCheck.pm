# vim: set ts=2 sts=2 sw=2 expandtab smarttab:
#
# This file is part of Dist-Zilla-Plugin-Test-Pod-LinkCheck
#
# This software is copyright (c) 2011 by Randy Stauner.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Dist::Zilla::Plugin::Test::Pod::LinkCheck;
BEGIN {
  $Dist::Zilla::Plugin::Test::Pod::LinkCheck::VERSION = '1.000';
}
BEGIN {
  $Dist::Zilla::Plugin::Test::Pod::LinkCheck::AUTHORITY = 'cpan:RWSTAUNER';
}
# ABSTRACT: Add release tests for POD links

use strict;
use warnings;
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
no Moose;

1;




=pod

=for :stopwords Randy Stauner cpan testmatrix url annocpan anno bugtracker rt cpants
kwalitee diff irc mailto metadata placeholders

=head1 NAME

Dist::Zilla::Plugin::Test::Pod::LinkCheck - Add release tests for POD links

=head1 VERSION

version 1.000

=head1 SYNOPSIS

  # dist.ini
  [Test::Pod::LinkCheck]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>
providing the following files:

  xt/release/pod-linkcheck.t - a standard Test::Pod::LinkCheck test

You can skip the test by setting
C<$ENV{SKIP_POD_LINKCHECK}>.

=head1 INSTALLING

B<NOTE> You may need to update your L<CPANPLUS> index
before L<Test::Pod::LinkCheck> will work (or in my case even install).
Using the C<x> command at the C<cpanp> prompt did the trick for me.

Read more in L<Test::Pod::LinkCheck/NOTES>.

=head1 SEE ALSO

=over 4

=item *

L<Test::Pod::LinkCheck>

=back

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc Dist::Zilla::Plugin::Test::Pod::LinkCheck

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/Dist-Zilla-Plugin-Test-Pod-LinkCheck>

=item *

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dist-Zilla-Plugin-Test-Pod-LinkCheck>

=item *

AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dist-Zilla-Plugin-Test-Pod-LinkCheck>

=item *

CPAN Ratings

L<http://cpanratings.perl.org/d/Dist-Zilla-Plugin-Test-Pod-LinkCheck>

=item *

CPAN Forum

L<http://cpanforum.com/dist/Dist-Zilla-Plugin-Test-Pod-LinkCheck>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/Dist-Zilla-Plugin-Test-Pod-LinkCheck>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/D/Dist-Zilla-Plugin-Test-Pod-LinkCheck.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=Dist-Zilla-Plugin-Test-Pod-LinkCheck>

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-dist-zilla-plugin-test-pod-linkcheck at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dist-Zilla-Plugin-Test-Pod-LinkCheck>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code


L<http://github.com/magnificent-tears/Dist-Zilla-Plugin-Test-Pod-LinkCheck/tree>

  git clone git://github.com/magnificent-tears/Dist-Zilla-Plugin-Test-Pod-LinkCheck.git

=head1 AUTHOR

Randy Stauner <rwstauner@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Randy Stauner.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__DATA__
___[ xt/release/pod-linkcheck.t ]___
#!perl

use strict;
use warnings;
use Test::More;

foreach my $env_skip ( qw(
  SKIP_POD_LINKCHECK
) ){
  plan skip_all => "\$ENV{$env_skip} is set, skipping"
    if $ENV{$env_skip};
}

eval "use Test::Pod::LinkCheck";
if ( $@ ) {
  plan skip_all => 'Test::Pod::LinkCheck required for testing POD';
}
else {
  Test::Pod::LinkCheck->new->all_pod_ok;
}
