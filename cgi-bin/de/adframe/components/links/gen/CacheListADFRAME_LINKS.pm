package CacheListADFRAME_LINKS;
$QUAL = '!ADFRAME_LINKS_ID!|!ADFRAME_CHANNEL!|!ADFRAME_LINKSCATEGORY_ID!|!TITLE!|!URL!|!DESCR!|!IMAGE_0!|!IMAGE_1!|!ITEM_0!|!ITEM_1!|!IS_ACTIVE!';
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
	$this->{ctimeout}		= $ctimeout || $ENV{ADFRAME_DB_CACHETIMEOUT} || 60;
	$this->{timestampindex}	= $main::TIMESTAMP_INDEX || 10;
	$this->{lines}		= undef;
	$this->{count}		= -1;
	$this->{generated}	= 0;
	return $this;
}
sub getADFRAME_LINKS
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $fcond 			= $condition.'_'.$orderBy.'_'.$start.'_'.$limit;
	$fcond =~ s/\s/-/g;
	if (! $this->readFromFile('COND_'.$fcond))
	{
		$this->dbGetADFRAME_LINKS($condition,$orderBy,$start,$limit);
		if (! $this->writeToFile('COND_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COND_'.$fcond)");
		}
		$this->{generated}	= 1;
	}
	return $this->{lines};
}

sub getCountADFRAME_LINKS
{
	my $this			= shift;
	my $condition		= shift;
	my $fcond 			= $condition;
	$fcond =~ s/\s/-/g;
	if (! $this->readCountFromFile('COUNT_'.$fcond))
	{
		$this->dbGetCountADFRAME_LINKS($condition);
		
		if (! $this->writeCountToFile('COUNT_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COUNT_'.$fcond)");
		}
	}
	return $this->{count};
}
sub dbGetADFRAME_LINKS
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	require www::V6::cgi-bin::de::fbmx::gen::ListADFRAME_LINKS;
	my $dblist = ListADFRAME_LINKS->new();		
	$this->{lines} = $dblist->getADFRAME_LINKS($condition,$orderBy,$start,$limit); 
}

sub dbGetCountADFRAME_LINKS
{
	my $this			= shift;
	my $condition		= shift;
	require www::V6::cgi-bin::de::fbmx::gen::ListADFRAME_LINKS;
	my $dblist = ListADFRAME_LINKS->new();	
	$this->{count} = $dblist->getCountADFRAME_LINKS($condition);
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
	$this->{message}.='ClassADFRAME_LINKS: '.$mess."\n";   
}
1;