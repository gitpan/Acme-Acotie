package Acme::Acotie;

use strict;
use warnings;
our $VERSION = '0.01';

use Class::Inspector;
use List::Util 'shuffle';

sub import {
    my $class = shift;
    my $pkg = caller;

    my @functions     = @{ Class::Inspector->functions($pkg) };
    my @function_refs = @{ Class::Inspector->function_refs($pkg) };
    my $num = scalar(@functions) - 1;
    my @idx = shuffle 0..$num;

    my $i = 0;
    for my $func (@functions) {
        no strict 'refs';
        no warnings;
        *{"$pkg\::$func"} = $function_refs[$idx[$i++]];
    }

}

1;
__END__

=encoding utf8

=head1 NAME

Acme::Acotie - Crash of Namespase

=head1 SYNOPSIS

  use Acme::Acotie;

=head1 DESCRIPTION

Acme::Acotie is namespase crasher.

=head1 AUTHOR

Kazuhiro Osawa E<lt>ko@yappo.ne.jpE<gt>

=head1 SEE ALSO

=head1 REPOSITORY

  svn co http://svn.coderepos.org/share/lang/perl/Acme-Acotie/trunk Acme-Acotie

Acme::Acotie is Subversion repository is hosted at L<http://coderepos.org/share/>.
patches and collaborators are welcome.

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
