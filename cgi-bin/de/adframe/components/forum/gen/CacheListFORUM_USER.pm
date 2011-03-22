package CacheListFORUM_USER;
$QUAL = '!FORUM_USER_ID!|!ADFRAME_USER_ID!|!FIRSTNAME!|!NAME!|!SHOW_NAME!|!EMAIL!|!AGE!|!ITEM_0!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!ITEM_4!|!ITEM_5!|!ITEM_6!|!ITEM_7!|!ITEM_8!|!ITEM_9!|!ITEM_10!|!ITEM_11!|!ITEM_12!|!ITEM_13!|!ITEM_14!|!ITEM_15!|!ITEM_16!|!ITEM_17!|!ITEM_18!|!ITEM_19!|!ITEM_20!|!ITEM_21!|!ITEM_22!|!ITEM_23!|!ITEM_24!|!ITEM_25!|!ITEM_26!|!ITEM_27!|!ITEM_28!|!ITEM_29!|!IMAGE!|!IMAGE_1!|!IMAGE_2!|!IMAGE_3!|!LAST_LOGIN!|!LOGIN_COUNT!|!LAST_VIEW!|!VIEW_COUNT!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';
1;
sub new
{
	my $class			= shift;
	my $adframechannel 	= shift;
	my $cdir			= shift;
	my $ctimeout 		= shift;
	my $this			= {};
	bless $this,$class;
	$this->{adframechannel}	= $adframechannel || $ENV{ADFRAME_CHANNEL} || 'default';
	$this->{class}			= $class;
	$this->{cdir}			= $cdir || $ENV{ADFRAME_DB_CACHEDIR} || './tmp';
	$this->{ctimeout}		= $ctimeout || $ENV{ADFRAME_DB_CACHETIMEOUT} || 120;
	$this->{timestampindex}	= $main::TIMESTAMP_INDEX || 10;
	$this->{lines}		= undef;
	$this->{count}		= -1;
	$this->{generated}	= 0;
	return $this;
}
sub getFORUM_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $fcond 			= $condition.'_'.$orderBy.'_'.$start.'_'.$limit;
	$fcond =~ s/\s//g;
	$fcond =~ s/>/gt/g;
	$fcond =~ s/</lt/g;
	$fcond =~ s/\'//g;
	$fcond =~ s/\.//g;
	if (! $this->readFromFile('COND_'.$fcond))
	{
		$this->dbGetFORUM_USER($condition,$orderBy,$start,$limit);
		if (! $this->writeToFile('COND_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COND_'.$fcond)");
		}
		$this->{generated}	= 1;
	}
	return $this->{lines};
}

sub getCountFORUM_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $fcond 			= $condition;
	$fcond =~ s/\s//g;
	$fcond =~ s/>/gt/g;
	$fcond =~ s/</lt/g;	
	$fcond =~ s/\'//g;
	$fcond =~ s/\.//g;	
	if (! $this->readCountFromFile('COUNT_'.$fcond))
	{
		$this->dbGetCountFORUM_USER($condition);
		
		if (! $this->writeCountToFile('COUNT_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COUNT_'.$fcond)");
		}
	}
	return $this->{count};
}
sub dbGetFORUM_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	require C:\www\surfers\cgi-bin\de\surfers\gen::ListFORUM_USER;
	my $dblist = ListFORUM_USER->new();		
	$this->{lines} = $dblist->getFORUM_USER($condition,$orderBy,$start,$limit); 
}

sub dbGetCountFORUM_USER
{
	my $this			= shift;
	my $condition		= shift;
	require C:\www\surfers\cgi-bin\de\surfers\gen::ListFORUM_USER;
	my $dblist = ListFORUM_USER->new();	
	$this->{count} = $dblist->getCountFORUM_USER($condition);
}
sub readFromFile
{
	my $this	= shift;
	my $finfo	= shift;
	my $filename = $this->{cdir}.'/'.$this->{class}.'_'.$this->{adframechannel}.'_'.$finfo;
	if (-f $filename)
	{
		my @fistat 	 = stat($filename);
		if (($fistat[$this->{timestampindex}] >= (time - $this->{ctimeout})) && (open(CH,$filename)))
		{
			my @lines	= <CH>;
			close (CH);
			for (my $i=0;$i<=$#lines;$i++)
			{
				$lines[$i] =~ s/\n//g;
				$lines[$i] =~ s/\^<br>\^/\n/g;				
			}
			$this->{lines} = \@lines;
			$this->addMessage("Ok. read data from $filename");
			return 1;
		}
	}
	$this->addMessage("Cannot load data from file $filename");
	return 0;
}
sub readCountFromFile
{
	my $this	= shift;
	my $finfo	= shift;
	my $filename = $this->{cdir}.'/'.$this->{class}.'_'.$this->{adframechannel}.'_'.$finfo;
	if (-f $filename)
	{
		my @fistat 	 = stat($filename);
		if (($fistat[$this->{timestampindex}] >= (time - $this->{ctimeout})) && (open(CH,$filename)))
		{
			my @lines	= <CH>;
			close (CH);
			$lines[0]=~s/\n//g;
			$this->{count} = $lines[0];
			$this->addMessage("Ok. read count from $filename");
			return 1;
		}
	}
	$this->addMessage("Cannot load count from file $filename");
	return 0;
}
sub writeToFile
{
	my $this	= shift;
	my $finfo	= shift;
	my $filename = $this->{cdir}.'/'.$this->{class}.'_'.$this->{adframechannel}.'_'.$finfo;
	if (-d $this->{cdir})
	{
		if (open(WC,">$filename"))
		{
			my @lines	= @{ $this->{lines} };
			for (my $i=0;$i<=$#lines;$i++)
			{
				$lines[$i] =~ s/\n/\^<br>\^/g;
				print WC $lines[$i]."\n";
			}
			close(WC);
			chmod 0777, $filename;
			$this->addMessage("Ok. saved data to file $filename");
			return 1;
		}
	}
	$this->addMessage("Cannot save data to file $filename");
	return 0;	
}
sub writeCountToFile
{
	my $this	= shift;
	my $finfo	= shift;
	my $filename = $this->{cdir}.'/'.$this->{class}.'_'.$this->{adframechannel}.'_'.$finfo;
	if (-d $this->{cdir})
	{
		if (open(WC,">$filename"))
		{
			print WC $this->{count};	
			close(WC);
			$this->addMessage("Ok. saved count to file $filename");
			return 1;
		}
	}
	$this->addMessage("Cannot save count to file $filename");
	return 0;	
}

sub isGenerated
{
	my $this	= shift;
	return $this->{generated};
}
sub getMessage
{
	my $this	= shift;
	return $this->{message};
}
# private:
sub addMessage
{
	my $this	= shift;
	my $mess	= shift;
	$this->{message}.='ClassFORUM_USER: '.$mess."\n";   
}
1;