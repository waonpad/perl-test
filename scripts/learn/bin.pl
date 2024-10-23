my $str1 = "ABC";                      # 文字列としての代入
my @bin = unpack("C*", $str1);          # 数値の配列に変換
my $str2 = pack("C*", @bin);            # 数値の配列を文字列に変換
print "[$str1] [@bin] [$str2]\n";         # => [ABC] [65 66 67] [ABC]