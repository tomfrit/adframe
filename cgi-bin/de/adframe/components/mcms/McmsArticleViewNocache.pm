package McmsArticleViewNocache;
use de::adframe::components::mcms::gen::ClassADFRAME_MCMS;
use de::adframe::lib::DateTime;
1;
sub new
{
	my $class		= shift;
	my $adframe		= shift;
	my $snippetbase	= shift;
	my $defimgbase	= shift;
	my $alertpage	= shift;
	my $this	= {};
	bless $this,$class;
	$this->{adframe}		= $adframe;
	$this->{snippetbase}	= $snippetbase;
	$this->{defimgbase}		= 'DEFIMG';
	$this->{pagerstyle_on}	= 'on';
	$this->{pagerstyle_off}	= 'off';
	$this->{pagerdelimiter}	= '&#124;';
	$this->{alertpage}		= $alertpage;
	$this->{AREA}			= '';
	return $this;
}

sub display
{
	my $this		= shift;
	my $mcmsId		= shift;
	my $page		= shift;
	if (($page=~/D/)||($page<2)||($page>3))
	{
		$page=1;
	}
	$this->{adframe}->importDynamicSnippet('MCMS_SNIPPET',$this->{snippetbase}.$page.'.snp');
	
	my $mcms = new ClassADFRAME_MCMS();
	if ($mcms->initById($mcmsId))
	{
		my %dataHash = $mcms->getDataHash();
		my $dateT 	= new DateTime();
		$dateT->setMysqlFormatted($dataHash{CR_DATE});
		$dataHash{CR_DATE_YEAR}	= $dateT->getYear(); 
		$dataHash{CR_DATE_MONTH} = $dateT->getMonth(); 
		$dataHash{CR_DATE_DAY}	= $dateT->getDay();
		$dataHash{CR_DATE_HOUR}	= $dateT->getHour(); 
		$this->{AREA} = $dataHash{AREA};
		
		foreach my $k (keys %dataHash)
		{
			$this->{adframe}->setValue('MCMS_'.$k,$dataHash{$k});
			if (($k =~ /IMG_/) && (($dataHash{$k} =~/DEFIMG/) || ($dataHash{$k} eq '')))
			{
				$this->{adframe}->setSwitch('SWITCH_MCMS_'.$k,'off');
			}	
			if (($k =~ /TEXT_/) && ($dataHash{$k} =~ /^\s*$/))
			{
				$this->{adframe}->setSwitch('SWITCH_MCMS_'.$k,'off');
			}	
			if (($k =~ /ITEM_/) && ($dataHash{$k} =~ /^\s*$/))
			{
				$this->{adframe}->setSwitch('SWITCH_MCMS_'.$k,'off');
			}	
			if (($k =~ /^VIDEO_/) && ($dataHash{$k} =~/DEFVIDEO/))
			{
				$this->{adframe}->setSwitch('SWITCH_MCMS_'.$k,'off');
			}			
		}
		
		$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_0','off');
		$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_1','off');
		$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_2','on');
		
		if (($dataHash{IMG_1_0} ne '') && ($dataHash{IMG_1_0} !~ /DEFIMG/))
		{
			$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_0','on');
			$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_1','off');
			$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_2','off');
		}
		elsif (($dataHash{IMG_1_1} ne '') && ($dataHash{IMG_1_1} !~ /DEFIMG/))
		{
			$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_0','off');
			$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_1','on');
			$this->{adframe}->setSwitch('SWITCH_TEMPLATE_MCMS_IMG_1_2','off');
		}

		# pager:
		my $pageCount	= $dataHash{PAGE_COUNT};
		if ($pageCount<2)
		{
			$this->{adframe}->setSwitch('SWITCH_MCMSINTERN_PAGER','off');
		}
		else
		{
			my @pages	= ();
			my $style	= 'off';
			for (my $i=1;$i<=$pageCount;$i++)
			{
				if ($i==$page)
				{
					$style = 'on';
				}
				else
				{
					$style	= 'off';
				}
				push(@pages,$i.'|'.$style.'|&#124;');
			}
			if (@pages != ())
			{
				chop($pages[$#pages]);
				chop($pages[$#pages]);
				chop($pages[$#pages]);
				chop($pages[$#pages]);
				chop($pages[$#pages]);
				chop($pages[$#pages]);
			}
			$this->{adframe}->makeRepetition('LOOP_MCMSINTERN_PAGER','!PAGE!|!PAGE_STYLE!|!MCMS_PAGE_DELIMITER!',\@pages);
		}
		$this->{adframe}->setValue('ADFRAME_MCMS_ID',$mcmsId);
		
	}
	else
	{
		$this->{adframe}->logger($mcms->getMessage());
		if ($this->{alertpage} ne '')
		{
			$this->{adframe}->internLocation($this->{alertpage});
		}
	}
	
}

sub displayExtension
{
	my $this				= shift;
	my $mcmsId				= shift;
	my $displayparallel		= shift;
	$displayparallel = 0 if ($displayparallel eq '');
	
	require de::adframe::components::mcms::gen::CacheListADFRAME_MCMS_EXT;
	my $extlist = CacheListADFRAME_MCMS_EXT->new();
	my $extListDataRef	= $extlist->getADFRAME_MCMS_EXT("ADFRAME_MCMS_ID=$mcmsId",'ADFRAME_MCMS_EXT_ID, RANK_NO desc','','');
	my @extListData		= @{$extListDataRef};
	$this->{adframe}->makeRepetition('LOOP_MCMS_EXT',$CacheListADFRAME_MCMS_EXT::QUAL,$extListDataRef);
					
	my $extCount =  $extlist->getCountADFRAME_MCMS_EXT("ADFRAME_MCMS_ID=$mcmsId");
	my @help	= ();
	for (my $c=0;$c<$extCount;$c++)
	{
		my $toponoff 	= '0';
		my $bottomonoff = '0';
		my $mo 			= 0;
		@help = split(/\|/,$extListData[$c]);
		if ($displayparallel>0)
		{
			$mo = $c % $displayparallel;
			if ($mo ==0)
			{
				$toponoff = '1';	
			}
			if (($mo == $displayparallel-1) || ($c==$extCount-1))
			{
				$bottomonoff = '1';
			}
		}
		$this->{adframe}->setToDict('SWITCH_MCMS_EXT_TOP_'.$help[0],'switch','','',$toponoff);
		$this->{adframe}->setToDict('SWITCH_MCMS_EXT_BOTTOM_'.$help[0],'switch','','',$bottomonoff);
	}
}
				
sub setDefimgBase
{
	my $this	= shift;
	$this->{defimgbase}	= shift;
}
sub setPagerstyleOn
{
	my $this	= shift;
	$this->{pagerstyle_on}	= shift;
}
sub setPagerstyleOff
{
	my $this	= shift;
	$this->{pagerstyle_off}	= shift;
}
sub setPagerDelimiter
{
	my $this	= shift;
	$this->{pagerdelimiter}	= shift;
}
sub setAlertPage
{
	my $this	= shift;
	$this->{alertpage}	= shift;
}

sub getArea
{
	my $this	= shift;
	return $this->{AREA};
}