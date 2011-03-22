package StringFunctions;
1;
sub createPriceString
{
	my $mypreis     = shift;
	my ($vor,$nach) = split(/\./,$mypreis);
	if (length($nach) < 2)
	{
		$nach = $nach.'0';
		$mypreis = "$vor,$nach";
 	}
	elsif (length($nach) > 2)
	{
		$nach=~s/(\d\d).*?/$1/;
		$mypreis = "$vor,$nach";
	}
	else
	{
		$mypreis = "$vor,$nach";
	}
	if ($nach == 0)
	{
		$mypreis = "$vor,-";
	}
	return $mypreis;
}
sub priceString2Float
{
	my $myprice     = shift;
	$myprice		=~ s/\,-//;
	$myprice		=~ s/\,/\./;
	return $myprice;
}
sub getStringAtArrStringPos
{
	my $pos			= shift;
	my $arrString	= shift;
	my $separator	= shift;
	my @theArr		= split(/$separator/, $arrString);
	return $theArr[$pos];
}
sub hasFormat
{
	# format: c stands for character, # stands for num,
	#         example: ##.##.####
	my $format		= shift;
	my $string		= shift;
	my $ok			= 0;
	if (length($format) == length($string))
	{
		my @formatArr = split(/\\c/,$format);
	}
	return $ok;
}

sub ascii2Html
{
	my $string	= shift;
	$string =~ s/\r\n/<br>/g;
	return $string;
}
sub html2Ascii
{
	my $string	= shift;
	$string =~ s/<br>/\x0d/g;
	$string =~ s/\&#x7c;/\|/g;
	return $string;
}
sub encode2Http
{
	my $string	= shift;
	$string =~ s/\s/\%20/g;
	$string =~ s/\&/\%26/g;
	$string =~ s/\?/\%3f/g;
	return $string;
}
sub extendNum2
{
	my $num 	= shift;
	my $ret 	= '';
	if (length($num) < 1)
	{
		$ret = '00';
	}
	elsif (length ($num) <2)
	{
		$ret = '0'."$num";
	}
	else
	{
		$ret = "$num";
	}
	return $ret;
}
sub unixDate2MysqlDate
{
	my $datestring 	= shift;
	my %monthHash	= qw(Jan 1 Feb 2 Mar 3 Apr 4 May 5 Jun 6 Jul 7 Aug 8 Sep 9 Okt 10 Nov 11 Dec 12);
	my @help 		= split(/\s/,$datestring);
	my $day 		= StringFunctions::extendNum2($help[1]);
	my $month 		= StringFunctions::extendNum2($monthHash{$help[2]});
	my $year 		= $help[3];
	my $hhmmss		= $help[4];
	return "$year".'-'.$month.'-'.$day.' '.$hhmmss;
}
sub checkOneHashValue
{
	my @test	 	= @_;
	my $filled		= 0;
	foreach my $t (@test)
	{
		if ($t ne '')
		{
			$filled = 1;
			last;
		}
	}

	return $filled;
}
sub checkAllHashValues
{
	my @test	 	= @_;
	my $filled		= 0;
	foreach my $t (@test)
	{
		if ($t eq '')
		{
			$filled = 0;
			last;
		}
		else
		{
			$filled = 1;
		}
	}
	return $filled;
}
