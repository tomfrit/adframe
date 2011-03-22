package CacheListADFRAME_MCMS;
$QUAL = '!ADFRAME_MCMS_ID!|!ADFRAME_CHANNEL!|!AREA!|!CATEGORY!|!RANK_NO!|!PAGE_COUNT!|!P_STATUS!|!P_DATE!|!IS_ARCHIVE!|!A_NAME!|!A_EMAIL!|!SEL!|!SEL_2!|!HEADLINE!|!ITEM_1_1!|!ITEM_1_2!|!ITEM_1_3!|!ITEM_1_4!|!ITEM_2_1!|!ITEM_2_2!|!ITEM_2_3!|!ITEM_2_4!|!ITEM_3_1!|!ITEM_3_2!|!ITEM_3_3!|!ITEM_3_4!|!IMG_0_0!|!IMG_0_1!|!IMG_0_2!|!IMG_0_3!|!IMG_0_4!|!IMG_1_0!|!IMG_1_1!|!IMG_1_2!|!IMG_1_3!|!IMG_1_4!|!IMG_2_1!|!IMG_2_2!|!IMG_2_3!|!IMG_2_4!|!IMG_3_1!|!IMG_3_2!|!IMG_3_3!|!IMG_3_4!|!TEXT_0!|!TEXT_1_1!|!TEXT_1_2!|!TEXT_1_3!|!TEXT_1_4!|!TEXT_2_1!|!TEXT_2_2!|!TEXT_2_3!|!TEXT_2_4!|!TEXT_3_1!|!TEXT_3_2!|!TEXT_3_3!|!TEXT_3_4!|!PARENT_RANK_NO!|!VIDEO_1_1!|!PIC_VIDEO_1_1!|!ITEM_1_5!|!VIDEO_1_2!|!PIC_VIDEO_1_2!|!ITEM_1_6!|!SAISON!|!ETIKETT!|!ITEM_2_5!|!ITEM_2_6!|!ITEM_2_7!|!ITEM_2_8!|!ITEM_2_9!|!TEXT_4_0!|!TEXT_4_1!|!TEXT_4_2!|!TEXT_4_3!|!TEXT_4_4!|!TEXT_5_0!|!TEXT_5_1!|!TEXT_5_2!|!TEXT_5_3!|!TEXT_5_4!|!ITEM_4_0!|!ITEM_4_1!|!ITEM_4_2!|!ITEM_4_3!|!ITEM_4_4!|!ITEM_5_0!|!ITEM_5_1!|!ITEM_5_2!|!ITEM_5_3!|!ITEM_5_4!|!IMG_4_0!|!IMG_4_1!|!IMG_4_2!|!IMG_4_3!|!IMG_4_4!|!IMG_5_0!|!IMG_5_1!|!IMG_5_2!|!IMG_5_3!|!IMG_5_4!|!SEL_3!|!SEL_4!|!VIEW_COUNT!|!VIEW_COUNT_2!|!VIEW_COUNT_3!|!VIEW_COUNT_4!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';
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
sub getADFRAME_MCMS
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
		$this->dbGetADFRAME_MCMS($condition,$orderBy,$start,$limit);
		if (! $this->writeToFile('COND_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COND_'.$fcond)");
		}
		$this->{generated}	= 1;
	}
	return $this->{lines};
}

sub getCountADFRAME_MCMS
{
	my $this			= shift;
	my $condition		= shift;
	my $fcond 			= $condition;
	$fcond =~ s/\s/-/g;
	if (! $this->readCountFromFile('COUNT_'.$fcond))
	{
		$this->dbGetCountADFRAME_MCMS($condition);
		
		if (! $this->writeCountToFile('COUNT_'.$fcond))
		{
			$this->addMessage("Cannot write data to file('COUNT_'.$fcond)");
		}
	}
	return $this->{count};
}
sub dbGetADFRAME_MCMS
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	require de::adframe::components::mcms::gen::ListADFRAME_MCMS;
	my $dblist = ListADFRAME_MCMS->new();		
	$this->{lines} = $dblist->getADFRAME_MCMS($condition,$orderBy,$start,$limit); 
}

sub dbGetCountADFRAME_MCMS
{
	my $this			= shift;
	my $condition		= shift;
	require de::adframe::components::mcms::gen::ListADFRAME_MCMS;
	my $dblist = ListADFRAME_MCMS->new();	
	$this->{count} = $dblist->getCountADFRAME_MCMS($condition);
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
	$this->{message}.='ClassADFRAME_MCMS: '.$mess."\n";   
}
1;