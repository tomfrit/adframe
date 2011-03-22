package CacheListIMPORT_1_completes;
$QUAL = '!IMPORT_1_completes_ID!|!ADFRAME_COMPANY_ID!|!ADFRAME_BRAND_ID!|!BRAND!|!MODEL!|!VERTRIEB!|!HOMEPAGE!|!PREIS!|!RADGROESSE!|!BESCHREIBUNG!|!ANWENDUNG!|!GEWICHT!|!RAHMEN!|!GABEL!|!LENKER!|!VORBAU!|!STEUERSATZ!|!GRIFFE!|!KURBELN!|!KURBELLAENGE!|!BB!|!INNENLAGER!|!PEDALE!|!KETTENBLATT!|!RITZEL!|!KETTE!|!VRNABE!|!HRNABE!|!VACHSE!|!HACHSE!|!FELGEN!|!VREIFEN!|!HREIFEN!|!SATTEL!|!SATTELSTUETZE!|!SATTELKLEMME!|!BREMSEN!|!GYRO!|!BREMSHEBEL!|!PEGS!|!EXTRAS!|!FARBEN!|!TTLAENGEN!|!STEUERROHRWINKEL!|!KETTENSTREBENLAENGE!|!TRETLAGERHOEHE!|!SATTELROHRWINKEL!|!LENKERHOEHE!|!LENKERBREITE!|!BACKSWEEP!|!UPSWEEP!|!ITEM_0!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!ITEM_4!|!ITEM_5!|!PREIS_REAL!|!BILD1!|!BILD2!|!BILD3!|!BILD4!|!BILD5!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';
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
sub getIMPORT_1_completes
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
		$this->dbGetIMPORT_1_completes($condition,$orderBy,$start,$limit);
		if (! $this->writeToFile('COND_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COND_'.$fcond)");
		}
		$this->{generated}	= 1;
	}
	return $this->{lines};
}

sub getCountIMPORT_1_completes
{
	my $this			= shift;
	my $condition		= shift;
	my $fcond 			= $condition;
	$fcond =~ s/\s/-/g;
	if (! $this->readCountFromFile('COUNT_'.$fcond))
	{
		$this->dbGetCountIMPORT_1_completes($condition);
		
		if (! $this->writeCountToFile('COUNT_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COUNT_'.$fcond)");
		}
	}
	return $this->{count};
}
sub dbGetIMPORT_1_completes
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	require www::V6::cgi-bin::de::fbmx::gen::ListIMPORT_1_completes;
	my $dblist = ListIMPORT_1_completes->new();		
	$this->{lines} = $dblist->getIMPORT_1_completes($condition,$orderBy,$start,$limit); 
}

sub dbGetCountIMPORT_1_completes
{
	my $this			= shift;
	my $condition		= shift;
	require www::V6::cgi-bin::de::fbmx::gen::ListIMPORT_1_completes;
	my $dblist = ListIMPORT_1_completes->new();	
	$this->{count} = $dblist->getCountIMPORT_1_completes($condition);
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
	$this->{message}.='ClassIMPORT_1_completes: '.$mess."\n";   
}
1;