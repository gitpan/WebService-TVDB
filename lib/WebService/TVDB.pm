use strict;
use warnings;

package WebService::TVDB;
{
  $WebService::TVDB::VERSION = '1.120740';
}

# ABSTRACT: Interface to http://thetvdb.com/

use WebService::TVDB::Languages qw($languages);
use WebService::TVDB::Series;
use WebService::TVDB::Mirror;
use WebService::TVDB::Util qw(get_api_key_from_file);

use LWP::Simple ();
use XML::Simple qw(:strict);

use constant SEARCH_URL =>
  'http://www.thetvdb.com/api/GetSeries.php?seriesname=%s';

use constant API_KEY_FILE => '/.tvdb';

use Object::Tiny qw(
  api_key
  language
);

sub new {
    my $class = shift;
    my $self  = $class->SUPER::new(@_);

    unless ( $self->api_key ) {
        require File::HomeDir;
        $self->{api_key} =
          get_api_key_from_file( File::HomeDir->my_home . API_KEY_FILE );
        die 'Can\'t find API key' unless $self->api_key;
    }

    unless ( $self->language ) {
        $self->{language} = 'English';
    }

    return $self;
}

sub search {
    my ( $self, $term ) = @_;

    unless ($term) {
        die 'search term is required';
    }
    unless ( $self->{mirrors} ) {
        $self->_load_mirros();
    }

    my $xml = LWP::Simple::get( sprintf( SEARCH_URL, $term ) );
    $self->{series} = _parse_series(
        XML::Simple::XMLin(
            $xml,
            ForceArray => ['Series'],
            KeyAttr    => 'Series'
        ),
        $self->api_key,
        $languages->{ $self->language },
        $self->{mirrors}
    );

    return $self->{series};
}

# parse the series xml and return an array of WebService::TVDB::Series
sub _parse_series {
    my ( $xml, $api_key, $api_language, $api_mirrors ) = @_;

    # loop over results and create new series objects
    my @series;
    for ( @{ $xml->{Series} } ) {
        push @series,
          WebService::TVDB::Series->new(
            %$_,
            _api_key      => $api_key,
            _api_language => $api_language,
            _api_mirrors  => $api_mirrors
          );
    }

    return \@series;
}

# loads mirros when needed
sub _load_mirros {
    my ($self) = @_;

    my $mirrors = WebService::TVDB::Mirror->new();
    $mirrors->fetch_mirror_list( $self->api_key );
    $self->{mirrors} = $mirrors;
}

1;



=pod

=head1 NAME

WebService::TVDB - Interface to http://thetvdb.com/

=head1 VERSION

version 1.120740

=head1 SYNOPSIS

  my $tvdb = WebService::TVDB->new(api_key => 'ABC123', language => 'English');

  my $series_list = $tvdb->search('men behaving badly');

  my $series = @{$series_list}[0];
  # $series is a WebService::TVDB::Series
  say $series->SeriesName;
  say $series->overview;

  # fetches full series data
  $series->fetch();

  say $series->Rating;
  say $series->Status;

  for my $episode (@{ $series->episodes }){
    # $episode is a WebService::TVDB::Episode
    say $episode->Overview;
    say $episode->FirstAired;
  }

  for my $actor (@{ $series->actors }){
    # $actor is a WebService::TVDB::Actor
    say $actor->Name;
    say $actor->Role;
  }

  for my $banner (@{ $series->banners }){
    # $banner is a WebService::TVDB::Banner
    say $banner->Rating;
    say $banner->url;
  }

=head1 DESCRIPTION

WebService::TVDB is an interface to L<http://thetvdb.com/>.

=head1 METHODS

=head2 new

Creates a new WebService::TVDB object. Takes the following parameters:

=over 4

=item api_key

This is your API key. If not passed in here, we will look in ~/.tvdb. Otherwise we will die.

=item language

The language you want tour results in. L<See WebService::TVDB::Languages> for a list of languages. Defaults to English.

=back

=head2 search( $term )

Searches the TVDB and returns a list of L<WebService::TVDB::Series> as the result.

=head1 API KEY

To use this module, you will need an API key from http://thetvdb.com/?tab=apiregister.

You can pass this key into the constructor, or save it to ~/.tvdb.

=head1 AUTHOR

Andrew Jones <andrew@arjones.co.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Andrew Jones.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

