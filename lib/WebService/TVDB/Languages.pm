package WebService::TVDB::Languages;
{
  $WebService::TVDB::Languages::VERSION = '1.130690';
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
  "Portugu\x{ea}s" => {
    'name' => "Portugu\x{ea}s",
    'id' => '26',
    'abbreviation' => 'pt'
  },
  'Polski' => {
    'name' => 'Polski',
    'id' => '18',
    'abbreviation' => 'pl'
  },
  "T\x{fc}rk\x{e7}e" => {
    'name' => "T\x{fc}rk\x{e7}e",
    'id' => '21',
    'abbreviation' => 'tr'
  },
  " \x{5e2}\x{5d1}\x{5e8}\x{5d9}\x{5ea}" => {
    'name' => " \x{5e2}\x{5d1}\x{5e8}\x{5d9}\x{5ea}",
    'id' => '24',
    'abbreviation' => 'he'
  },
  'Norsk' => {
    'name' => 'Norsk',
    'id' => '9',
    'abbreviation' => 'no'
  },
  "\x{440}\x{443}\x{441}\x{441}\x{43a}\x{438}\x{439} \x{44f}\x{437}\x{44b}\x{43a}" => {
    'name' => "\x{440}\x{443}\x{441}\x{441}\x{43a}\x{438}\x{439} \x{44f}\x{437}\x{44b}\x{43a}",
    'id' => '22',
    'abbreviation' => 'ru'
  },
  "\x{65e5}\x{672c}\x{8a9e}" => {
    'name' => "\x{65e5}\x{672c}\x{8a9e}",
    'id' => '25',
    'abbreviation' => 'ja'
  },
  "\x{395}\x{3bb}\x{3bb}\x{3b7}\x{3bd}\x{3b9}\x{3ba}\x{3ac}" => {
    'name' => "\x{395}\x{3bb}\x{3bb}\x{3b7}\x{3bd}\x{3b9}\x{3ba}\x{3ac}",
    'id' => '20',
    'abbreviation' => 'el'
  },
  'Magyar' => {
    'name' => 'Magyar',
    'id' => '19',
    'abbreviation' => 'hu'
  },
  'English' => {
    'name' => 'English',
    'id' => '7',
    'abbreviation' => 'en'
  },
  'Italiano' => {
    'name' => 'Italiano',
    'id' => '15',
    'abbreviation' => 'it'
  },
  'ALL' => {
    'name' => '(All)',
    'abbreviation' => 'all',
    'id' => 0
  },
  'Hrvatski' => {
    'name' => 'Hrvatski',
    'id' => '31',
    'abbreviation' => 'hr'
  },
  "Fran\x{e7}ais" => {
    'name' => "Fran\x{e7}ais",
    'id' => '17',
    'abbreviation' => 'fr'
  },
  "\x{d55c}\x{ad6d}\x{c5b4}" => {
    'name' => "\x{d55c}\x{ad6d}\x{c5b4}",
    'id' => '32',
    'abbreviation' => 'ko'
  },
  'Svenska' => {
    'name' => 'Svenska',
    'id' => '8',
    'abbreviation' => 'sv'
  },
  "Espa\x{f1}ol" => {
    'name' => "Espa\x{f1}ol",
    'id' => '16',
    'abbreviation' => 'es'
  },
  'Deutsch' => {
    'name' => 'Deutsch',
    'id' => '14',
    'abbreviation' => 'de'
  },
  "\x{10d}e\x{161}tina" => {
    'name' => "\x{10d}e\x{161}tina",
    'id' => '28',
    'abbreviation' => 'cs'
  },
  'Nederlands' => {
    'name' => 'Nederlands',
    'id' => '13',
    'abbreviation' => 'nl'
  },
  'Slovenski' => {
    'name' => 'Slovenski',
    'id' => '30',
    'abbreviation' => 'sl'
  },
  'Suomeksi' => {
    'name' => 'Suomeksi',
    'id' => '11',
    'abbreviation' => 'fi'
  },
  'Dansk' => {
    'name' => 'Dansk',
    'id' => '10',
    'abbreviation' => 'da'
  },
  "\x{4e2d}\x{6587}" => {
    'name' => "\x{4e2d}\x{6587}",
    'id' => '27',
    'abbreviation' => 'zh'
  }
};


1;

__END__
=pod

=head1 NAME

WebService::TVDB::Languages - A list of languages supported by thetvdb.com

=head1 VERSION

version 1.130690

=head1 SYNOPSIS

  use WebService::TVDB::Languages qw($languages);

=head1 DESCRIPTION

This contains all the languages supported by http://thetvdb.com as of 2013-03-10.

They are as follows:

=over 4

=item *

Português

=item *

Polski

=item *

Türkçe

=item *

 עברית

=item *

Norsk

=item *

русский язык

=item *

日本語

=item *

Ελληνικά

=item *

Magyar

=item *

English

=item *

Italiano

=item *

ALL

=item *

Hrvatski

=item *

Français

=item *

한국어

=item *

Svenska

=item *

Español

=item *

Deutsch

=item *

čeština

=item *

Nederlands

=item *

Slovenski

=item *

Suomeksi

=item *

Dansk

=item *

中文

=back

=encoding utf-8

=head1 AUTHOR

Andrew Jones <andrew@arjones.co.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Andrew Jones.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

