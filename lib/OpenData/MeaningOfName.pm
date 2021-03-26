package OpenData::MeaningOfName;
use v5.32;
use HTTP::Tiny;
# use Data::Dumper;
# use Encode ();
use URI; # cpan: URI (distribution)
use JSON; # cpan: JSON (distribution)
# use utf8;
use experimental qw(signatures);
use constant PATH => qw(v1 json home MeaningOfName);

my $uri = URI -> new('https://api.opendata.az');
my $http = HTTP::Tiny -> new();
my $json = JSON -> new();
my $content;

sub new($class, $name)
{
  $uri -> path_segments(PATH, $name);
  my $get = $http -> get($uri); # return value: hash reference
  # die Data::Dumper::Dumper $get;
  $content = $json -> decode($get -> {content});
  return bless( {url => $uri}, $class );
}

sub status($object)
{
  return $content -> {Status};
}

sub status_message($object)
{
  return $content -> {StatusMessage};
}

sub name($object)
{
  return $content -> {Response} -> {Name};
}

sub meaning($object)
{
  return $content -> {Response} -> {Meaning};
}

sub gender($object)
{
  return $content -> {Response} -> {Gender};
}

1;

=pod

=head1 NAME

OpenData::MeaningOfName.pm - interface module to OpenData MeaningOfName API service

=head1 SYNOPSIS

use OpenData::MeaningOfName;

my $meaningofname = OpenData::MeaningOfName -> new('yusif');

say $meaningofname -> meaning();

=head1 DESCRIPTION 

=head2 METHODS

=over

=item status

server response status code (one of OK, InputError, and ServerError)

=item status_message

server response status message (usually null)

=item name

the name itself

=item meaning

the etymology of name, in azerbaijani

=item gender

the gender of name

=back

=head1 SEE ALSO

L<OpenData API documentation|https://www.opendata.az/en/home/developers/>

=cut
