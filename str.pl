use strict;
use warnings;

# 文字列

my $name = "Perl";
my $hello = "Hello, $name!\n";
my $hello2 = 'Hello, $name!\n';

# ダブルクォートで囲むと変数展開される
print $hello;
# シングルクォートで囲むと変数展開されない
print $hello2;
print "\n";