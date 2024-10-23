use Mojolicious::Lite; # use strict; use warnings; とかが自動的に入る

my $text = 'I ♥ Mojolicious!';

get '/' => {text => $text};

app->start;