use v5.32;
use lib "$ENV{HOME}/var/git/OpenData-MeaningOfName/lib";
# use Data::Dumper qw();
use OpenData::MeaningOfName;

my $meaningofname = OpenData::MeaningOfName -> new($ARGV[0]);

say $meaningofname -> meaning();

=pod

https://en.wikipedia.org/wiki/Azerbaijani_name#Most_popular_names_in_2010-2015_period
https://api.opendata.az/v1/json/home/MeaningOfName/yusif?pretty

=cut
