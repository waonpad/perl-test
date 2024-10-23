use strict;
use warnings;

# 配列

# @を使って配列を宣言

my @arr = (1, 2, 3);

print "@arr\n"; # => 1 2 3

# 配列の要素に代入
@arr[0] = 4;
@arr[1..2] = (5, 6);

print "@arr\n"; # => 4 5 6

# 配列の要素数
my $len = @arr;

print "$len\n"; # => 3

# 配列の最後のインデックス
print "$#arr\n"; # => 2