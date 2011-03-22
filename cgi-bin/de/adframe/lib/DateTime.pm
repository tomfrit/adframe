package DateTime;
%ENGL_MONTH_HASH = qw(01 Jan 02 Feb 03 Mar 04 Apr 05 May 06 Jun 07 Jul 08 Aug 09 Sep 10 Okt 11 Nov 12 Dec);
%GEMAN_MONTH_HASH = qw(01 Januar 02 Februar 03 März 04 April 05 Mai 06 Juni 07 Juli 08 August 09 September 10 Oktober 11 November 12 Dezember);
1;
sub new
{
	my $type			= shift;
	my $timemilis		= shift;
	my $this			= {};
	bless $this,$type;
	
	if ($timemilis<1)
	{
		$timemilis 		= time();
	}
	
	my @tArr			= localtime($timemilis);
	$this->{timestring} = $tArr[7];
	$tArr[4]++;			# month
	$tArr[5] = 1900 + $tArr[5]; # year;
	$this->{year}		= $tArr[5]; 
	$this->{month}		= $tArr[4];
	$this->{day}		= $tArr[3];
	$this->{hour}		= $tArr[2];
	$this->{minute}		= $tArr[1];
	$this->{second}		= $tArr[0];
	$this->{milis}		= $timemilis;
	return $this;
}

sub getYear
{
	my $this	= shift;
	return $this->{year};
}
sub getMonth
{
	my $this	= shift;
	my $month	= $this->extendNum2($this->{month});
	return $month;
}
sub getMonthSimple
{
	my $this	= shift;
	my $month	= $this->{month};
	return $month;
}
sub getGermanMonth
{
	my $this	= shift;
	my $month	= $this->extendNum2($this->{month});
	return $GEMAN_MONTH_HASH{$month};
}
sub getDay
{
	my $this	= shift;
	my $day		= $this->extendNum2($this->{day});
	return $day;
}
sub getDaySimple
{
	my $this	= shift;
	my $day		= $this->{day};
	return $day;
}
sub getHour
{
	my $this	= shift;
	my $hour	= $this->extendNum2($this->{hour});
	return $hour;
}
sub getMinute
{
	my $this	= shift;
	my $min		= $this->extendNum2($this->{minute});
	return $min;
}
sub getSecond
{
	my $this	= shift;
	my $sec		= $this->extendNum2($this->{second});
	return $sec;
}
sub getMilis
{
	my $this	= shift;
	return $this->{milis};
}

sub setYear
{
	my $this		= shift;
	$this->{year}	= shift;
}
sub setMonth
{
	my $this		= shift;
	$this->{month}	= shift;
}
sub setEnglMonth
{
	my $this		= shift;
	my $englMonth	= shift;
	foreach my $m (keys %ENGL_MONTH_HASH )
	{
		if ($ENGL_MONTH_HASH{"$m"} eq $englMonth)
		{
			$this->{month} = $m;
			last;
		}
	}
}
sub setDay
{
	my $this		= shift;
	$this->{day}	= shift;
}
sub setHour
{
	my $this		= shift;
	$this->{hour}	= shift;
}
sub setMinute
{
	my $this		= shift;
	$this->{minute}	= shift;
}
sub setSecond
{
	my $this		= shift;
	$this->{second}	= shift;
}
sub setMilis
{
	my $this		= shift;
	$this->{milis}	= shift;
}

sub getDateInt
{
	my $this	= shift;
	my $sep		= shift;
	my $year	= $this->getYear();
	my $month	= $this->getMonth();
	my $day		= $this->getDay();
	my $hour	= $this->getHour();
	my $min		= $this->getMinute();
	my $sec		= $this->getSecond();
	my $dateint = "$year".$sep."$month".$sep."$day".$sep."$hour".$sep."$min".$sep."$sec";
	return $dateint;
}

sub getDateString
{
	my $this	= shift;
	return $this->{timestring};
}

sub getMysqlFormatted
{
	my $this	= shift;
	my $year	= $this->getYear();
	my $month	= $this->getMonth();
	my $day		= $this->getDay();
	my $hour	= $this->getHour();
	my $min		= $this->getMinute();
	my $sec		= $this->getSecond();	
	my $mysql  = "$year".'-'."$month".'-'."$day".' '."$hour".':'."$min".':'."$sec";
	return $mysql;
}

sub getMysqlDateFormatted
{
	my $this	= shift;
	my $year	= $this->getYear();
	my $month	= $this->getMonth();
	my $day		= $this->getDay();	
	my $mysql  = "$year".'-'."$month".'-'."$day";
	return $mysql;
}

sub setMysqlFormatted
{
	my $this	= shift;
	my $dateMysqlString	= shift;
	my ($datum,$time)	= split (/\s/,$dateMysqlString);
	my ($year,$month,$day) = split(/-/,$datum);
	my ($hour,$min,$sec)	= split(/:/,$time);
	$this->setYear($year);
	$this->setMonth($month);
	$this->setDay($day);
	$this->setHour($hour);
	$this->setMinute($min);
	$this->setSecond($sec);
	if (length($year)>3)
	{
		return 1;
	}
	return 0;
}

sub addSeconds
{
	my $this	= shift;
	my $sec		= shift;
	if ($sec>0)
	{
		my $timemilis = $sec+=$this->{milis};
		my @tArr			= localtime($timemilis);
		$this->{timestring} = $tArr[7];
		$tArr[4]++;			# month
		$this->{year}		= 1900+$tArr[5]; 
		$this->{month}		= $tArr[4];
		$this->{day}		= $tArr[3];
		$this->{hour}		= $tArr[2];
		$this->{minute}		= $tArr[1];
		$this->{second}		= $tArr[0];
		$this->{milis}		= $timemilis;
	}
}

sub subtractSeconds
{
	my $this	= shift;
	my $sec		= shift;
	if ($sec>0)
	{
		my $timemilis 		= $this->{milis}-$sec;
		my @tArr			= localtime($timemilis);
		
		$this->{timestring} = $tArr[7];
		$tArr[4]++;			# month
		$this->{year}		= 1900+$tArr[5]; 
		$this->{month}		= $tArr[4];
		$this->{day}		= $tArr[3];
		$this->{hour}		= $tArr[2];
		$this->{minute}		= $tArr[1];
		$this->{second}		= $tArr[0];
		$this->{milis}		= $timemilis;
	}
}

sub isGreaterThan
{
	my $this		= shift;
	my $otherObj	= shift;
	my $thisInt 	= $this->getDateInt();
	my $otherInt	= $otherObj->getDateInt();
	if ($thisInt > $otherInt)
	{
		return 1;
	}
	return 0;
}

sub isLessThan
{
	my $this		= shift;
	my $otherObj	= shift;
	my $thisInt 	= $this->getDateInt();
	my $otherInt	= $otherObj->getDateInt();
	if ($thisInt < $otherInt)
	{
		return 1;
	}
	return 0;
}

sub isEqualTo
{	
	my $this		= shift;
	my $otherObj	= shift;
	my $thisInt 	= $this->getDateInt();
	my $otherInt	= $otherObj->getDateInt();
	if ($thisInt == $otherInt)
	{
		return 1;
	}
	return 0;
}

sub getAge
{
	my $this		= shift;
	my $now			= new DateTime();
	my $age			= $now->getYear() - $this->getYear();
	if ($now->getMonth() < $this->getMonth())
	{
		$age--;
	}
	elsif ($now->getMonth() == $this->getMonth())
	{	
		if ($now->getDay() < $this->getDay())
		{
			$age--;
		}
	}

	return $age;
}

sub extendNum2
{
	my $this	= shift;
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