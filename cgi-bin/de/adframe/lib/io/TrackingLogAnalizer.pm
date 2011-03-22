package TrackingLogAnalizer;
1;
$ADFRAME_LOG_FORMAT = 'ADFRAMETIME|ADFRAMEDOC|ADFRAMESESSION|ADFRAMEREFERER';
$REFERER_FORMAT		= 'REFERER:PRODUKT_ID:BANNER';
sub new
{
	my $type 		= shift;
	my $this		= {};
	bless $this,$type;
	$this->{logformat} = $ADFRAME_LOG_FORMAT;
	$this->{refererformat} = $REFERER_FORMAT;
	$this->{sessions}	= ();
	return $this;
}	
sub setLogfile
{
	my $this		= shift;
	my $logfile		= shift;
	$this->{logfile} = $logfile;
}
sub setExtendedLogFormat
{
	my $this		= shift;
	my $format		= shift;
	$this->{logformat} = $ADFRAME_LOG_FORMAT.'|'.$format;
}
sub setRefererFormat
{
	my $this		= shift;
	my $format		= shift;
	$this->{refererformat} = $format;
}
sub setStartTime
{
	my $this		= shift;
	my $start		= shift;
	my ($year,$month,$day,$hour,$minute,$second) = split(/:/,$start);
	$this->{start_year}		= $year;
	$this->{start_month}	= $month;
	$this->{start_day}		= $day;
	$this->{start_hour}		= $hour;
	$this->{start_minute}	= $minute;
	$this->{start_second}	= $second;
	$this->{starttime} 		= $start;
	$this->{starttime} =~ s/\://g;
}

sub setEndTime
{
	my $this		= shift;
	my $end			= shift;
	my ($year,$month,$day,$hour,$minute,$second) = split(/:/,$end);
	$this->{end_year}		= $year;
	$this->{end_month}		= $month;
	$this->{end_day}		= $day;
	$this->{end_hour}		= $hour;
	$this->{end_minute}		= $minute;
	$this->{end_second}		= $second;
	$this->{endtime} 		= $end;
	$this->{endtime} =~ s/\://g;
}

sub getStartYear
{
	my $this		= shift;
	return $this->{start_year};
}
sub getStartMonth
{
	my $this		= shift;
	return $this->{start_month};
}
sub getStartDay
{
	my $this		= shift;
	return $this->{start_day};
}

sub getEndYear
{
	my $this		= shift;
	return $this->{end_year};
}
sub getEndMonth
{
	my $this		= shift;
	return $this->{end_month};
}
sub getEndDay
{
	my $this		= shift;
	return $this->{end_day};
}

sub analyze
{
	my $this		= shift;
	my @lines		= ();
	my $logTime		= '';
	my $datafound	= 0;
	$this->{sessions} = ();
	
	if (open(HA, $this->{logfile}))
	{
		@lines = <HA>;
		close(HA);
		for (my $i=0;$i<=$#lines;$i++)
		{
			my @help = split(/\|/, $lines[$i]);
			$logTime = $help[0];
			$logTime =~ s/\://g;

			if (($logTime>=$this->{starttime}) && ($logTime<=$this->{endtime}))
			{
				push(@{ $this->{sessions} },\@help); 
			}
		}
	
		if (@{ $this->{sessions} } != ())
		{
			$datafound = 1;
		}
		
	}
	return $datafound;
}

sub getSessionCount
{
	my $this		= shift;
	my $referer		= shift;
	my @sessions 	= $this->getSessionsWithReferer($referer);
	return $#sessions + 1;
}

sub getAllSessions
{
	my $this		= shift;
	return @{ $this->{sessions} };
}

sub getSessionsWithReferer
{
	my $this		= shift;
	my $referer		= shift;
	my @sessions 	= @{ $this->{sessions} };
	
	my @retSessions = ();
	my $sessline	= '';
		
	for (my $i=0; $i<=$#sessions; $i++)
	{
		if ( ($sessions[$i]->[3] =~ /^$referer\s*$/ ) )
		{
			push(@retSessions,$sessions[$i]);
		}			
	}
	return @retSessions; 	
}

sub getReferer
{
	my $this		= shift;
	my $formatKey	= shift;
	my %referer		= ();
	my @sessions 	= @{ $this->{sessions} };
	my $referer		= '';
	for (my $i=0; $i<=$#sessions; $i++)
	{
		$referer = $sessions[$i]->[3];
		$referer =~ s/^\s*//g;
		$referer =~ s/\s*$//g;
		if (! defined $referer{$referer})
		{
			$referer{$referer} = $sessions[$i];
		}
	}
	return keys %referer;
}

sub countItems
{
	my $this		= shift;
	my $formatKey	= shift;
	my @sessions	= @_;
	my @format		= split(/\|/,$this->{logformat});
 	my $endvalue	= 0;
 	my $pos			= -1;
 	for (my $i=0;$i<=$#format;$i++)
	{
		if ($format[$i] eq $formatKey)
		{
			$pos = $i;
			last;
		}
	}
	if ($pos>=0)
	{
		foreach my $sess (@sessions)
		{
			if ($sess->[$pos] ne '')
			{
				$item = $sess->[$pos];
				if ($item ne '')
				{
					$endvalue++;
				}
			}
		}
	}
	return $endvalue;
}

sub addValues
{
	my $this		= shift;
	my $formatKey	= shift;
	my @sessions	= @_;
	my @format		= split(/\|/,$this->{logformat});
	my $pos			= -1;
 	my $item		= 0;
 	my $endvalue	= 0;
 	for (my $i=0;$i<=$#format;$i++)
	{
		if ($format[$i] eq $formatKey)
		{
			$pos = $i;
			last;
		}
	}
	if ($pos>=0)
	{
		foreach my $sess (@sessions)
		{
			if ($sess->[$pos] ne '')
			{			
				$item = $sess->[$pos];								
				$item =~ s/\w*?=//g;
				$item =~ s/\s//g;
				if ($item ne '')
				{
					$endvalue += $item;
				}
			}
		}
	}
	return $endvalue;
}

sub getHumanReadableSessions
{
	my $this		= shift;
	my @sessions	= @_;
	my @format		= split(/\|/,$this->{logformat});
	my $val			= '';
	my @ret			= ();
	foreach my $sess (@sessions)
	{	
		$val		= '';
		for (my $i=0;$i<=$#format;$i++)
		{
			$val.= $sess->[$i];
			$val.= '|';
		}
		chop($val);
		push(@ret,$val);
	}
	return @ret;
}