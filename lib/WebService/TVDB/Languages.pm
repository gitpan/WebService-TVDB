package WebService::TVDB::Languages;
{
  $WebService::TVDB::Languages::VERSION = '1.133200';
}

use strict;
use warnings;

# You should never edit this file. Everything in here is automatically
# generated by tools/generate-languages.pl.

# ABSTRACT: A list of languages supported by thetvdb.com
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw($languages);

our $languages = {
  'ALL' => {
    'name' => '(All)',
    'abbreviation' => 'all',
    'id' => 0
  }
};


1;

__END__

=pod

=encoding utf-8

=head1 NAME

WebService::TVDB::Languages - A list of languages supported by thetvdb.com

=head1 VERSION

version 1.133200

=head1 SYNOPSIS

  use WebService::TVDB::Languages qw($languages);

=head1 DESCRIPTION

This contains all the languages supported by http://thetvdb.com as of 2013-11-16.

They are as follows:

=over 4

=item *

ALL

=back

=head1 AUTHOR

Andrew Jones <andrew@arjones.co.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Andrew Jones.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
