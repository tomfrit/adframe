package Hash;
1;
# use static !

# returns a hash as String
#
sub hash2String
{
	my $refHash     = shift;
	my $oldname     = shift;
	my $linebreaker = shift;
	my $separator	= shift;
	my $ret         = '';

	foreach $K (keys %{ $refHash })
	{
		if (ref($K) eq 'HASH')
		{
			$ret.= Hash::hash2String($K,'',$linebreaker,$separator);
		}
		else
		{
			$ret.= $K.$separator.$refHash->{$K}.$linebreaker;
		}
	}
	
	return $ret;
}
