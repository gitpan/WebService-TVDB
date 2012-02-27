use strict;
use warnings;

package WebService::TVDB::Mirror;
{
  $WebService::TVDB::Mirror::VERSION = '1.120580';
}

# ABSTRACT: Gets and saves a mirror

use LWP::Simple ();
use XML::Simple qw(:strict);

use constant MIRRORS_URL => 'http://www.thetvdb.com/api/%s/mirrors.xml';

sub new {
    my $class = shift;
    my $args  = shift;
    my $self  = {};

    bless( $self, $class );
    return $self;
}

sub fetch_mirror_list {
    my ( $self, $api_key ) = @_;

    unless ($api_key) {
        die 'Need an API key';
    }

    my $xml = LWP::Simple::get( sprintf( MIRRORS_URL, $api_key ) );

    unless ($xml) {
        die "Could not get mirrors.xml";
    }

    $self->{mirrors} =
      XML::Simple::XMLin( $xml, ForceArray => 0, KeyAttr => [] );
}

sub get_mirror {
    my ($self) = @_;

    if ( defined $self->{mirrors} ) {
        return $self->{mirrors}->{Mirror}->{mirrorpath};
    }
    return;
}

1;


__END__
=pod

=head1 NAME

WebService::TVDB::Mirror - Gets and saves a mirror

=head1 VERSION

version 1.120580

=head1 SYNOPSIS

  my $mirror = WebService::TVDB::Mirror->new();
  $mirror->fetch_mirror_list('1234abcd');
  my $mirror_url = $mirror->get_mirror();

=head1 METHODS

=head2 new()

Create a new object. Takes no arguments.

=head2 fetch_mirror_list($api_key)

Fetches the mirror list from thetvdb.com. Requires an API key, or will die.

=head2 get_mirror()

Gets a mirror. You will need to have called fetch_mirror_list() before.

=head1 AUTHOR

Andrew Jones <andrew@arjones.co.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Andrew Jones.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

