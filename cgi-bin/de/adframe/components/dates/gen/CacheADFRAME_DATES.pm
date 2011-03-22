package CacheADFRAME_DATES;
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
	return $this;
}
sub getADFRAME_DATES_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_DATES_ID'};
}
sub initById
{
	my $this	= shift;
	my $id		= shift;
	if ($id>0)
	{
		if (! $this->readFromFile('PK_'.$id))
		{
			if ($this->dbInitById($id))
			{
				if ($this->writeToFile('PK_'.$id))
				{
					return 1;
				}
			}
			else
			{
				$this->addMessage("Cannot initById($id)");
			}
		}
		else
		{
			return 1;
		}
	}
	return 0;
}
sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	if ($condition ne '')
	{
		my $fcond 	= $condition;
		$fcond =~ s/\s/-/g;
		if (! $this->readFromFile('COND_'.$fcond))
		{
			if ($this->dbInitByCondition($condition))
			{
				if ($this->writeToFile('COND_'.$fcond))
				{
					return 1;
				}
			}
			else
			{
				$this->addMessage("Cannot initByCondition($condition)");
			}
		}
		else
		{
			return 1;
		}
	}
	return 0;
}
sub getDataHash
{
	my $this		= shift;
	return %{ $this->{col} };
}
sub getValue
{
	my $this	= shift;
	my $key		= shift;
	return $this->{col}->{"$key"};
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
			my @kv		= ();
			foreach my $l (@lines)
			{
				if ($l =~ /^\w/)
				{
					@kv = split(/\^=\^/,$l);
					$kv[1] =~ s/\n//g;
					$kv[1] =~ s/\^<br>\^/\n/g;
					$this->{col}->{"$kv[0]"} = $kv[1];
				}
			}
			$this->addMessage("Ok. read data from $filename");
			return 1;
		}
	}
	$this->addMessage("Cannot load data from file $filename");
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
			my %dbHash	= %{ $this->{col} };
			foreach my $co (keys %dbHash)
			{
				my $data = $dbHash{"$co"};
				$data =~ s/\n/\^<br>\^/g;
				print WC $co.'^=^'.$data."\n";
			}
			close(WC);
			$this->addMessage("Ok. saved data to file $filename");
			return 1;
		}
	}
	$this->addMessage("Cannot save data to file $filename");
	return 0;	
}
sub dbInitById
{
	my $this	= shift;
	my $id		= shift;
	require C:\www\motox\cgi-bin\de\adframe\components\dates\gen::ClassADFRAME_DATES;
	my $dbclass = ClassADFRAME_DATES->new();
	if ($dbclass->initById($id))
	{
		my %dbHash	= $dbclass->getDataHash();
		foreach my $c (keys %dbHash)
		{
			$this->{col}->{"$c"} = $dbHash{"$c"};
		}
		return 1;
	}	
	$this->addMessage("Cannot load data from db with id");
	return 0;
}
sub dbInitByCondition
{
	my $this	= shift;
	my $condition		= shift;
	require C:\www\motox\cgi-bin\de\adframe\components\dates\gen::ClassADFRAME_DATES;	
	my $dbclass = ClassADFRAME_DATES->new();
	if ($dbclass->initByCondition($condition))
	{
		my %dbHash	= $dbclass->getDataHash();
		foreach my $c (keys %dbHash)
		{
			$this->{col}->{"$c"} = $dbHash{"$c"};
		}
		return 1;
	}	
	$this->addMessage("Cannot load data from db with condition");
	return 0;
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
	$this->{message}.='ClassADFRAME_DATES: '.$mess."\n";   
}
1;

 