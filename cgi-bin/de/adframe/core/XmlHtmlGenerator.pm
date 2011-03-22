package XmlHtmlGenerator;
1;
sub new
{
	my $class			= shift;
	my $filedir			= shift;
	my $filename		= shift;
	my $activedir		= shift;
	my $this			= {};
	bless $this,$class;
	$this->{filedir}	= $filedir;
	$this->{filename}	= $filename;
	$this->{activedir}	= $activedir;
	$this->{xmlcontent}	= '';
	$this->{snpline}	= '';
	$this->{contentdict} = '';
	$this->{template}	= '';
	$this->{mappingdir}	= '';
	$this->{resources}	= undef;
	return $this;
}

sub parse
{
	my $this			= shift;
	if (open(HA,"$this->{filedir}/$this->{filename}".'.xhtml'))
	{
		while (<HA>)
		{
			$this->{xmlcontent}.=$_;
		}
		close(HA);
	}
	

	if ($this->{xmlcontent} =~ /<template>(.*?)<\/template\s*>/)
	{
		$this->{xmlcontent} =~ s/<template>(.*?)<\/template\s*>//;
		$this->{template}	= $1;
		$this->{template}	=~ s/^\s+//;
		$this->{template}	=~ s/\s+$//;
	}
	
	if ($this->{xmlcontent} =~ /<mappingdir>(.*?)<\/mappingdir\s*>/)
	{
		$this->{xmlcontent} =~ s/<mappingdir>(.*?)<\/mappingdir\s*>//;
		$this->{mappingdir}	= $1;
		$this->{mappingdir}	=~ s/^\s+//;
		$this->{mappingdir}	=~ s/\s+$//;
	}
	
	if ($this->{xmlcontent} =~ /<storydir>(.*?)<\/storydir\s*>/)
	{
		$this->{xmlcontent} =~ s/<storydir>(.*?)<\/storydir\s*>//;
		$this->{storydir}	= $1;
		$this->{storydir}	=~ s/^\s+//;
		$this->{storydir}	=~ s/\s+$//;
	}
	
	if ($this->{storydir} eq '')
	{
		$this->{storydir} = '/'.$this->{activedir};
	}
	
	my $go              = 1;
	my $dummy_line      = $this->{xmlcontent};
	my $thisname		= '';
	my $resource		= '';
	
	while ($go)
	{
		if ($dummy_line =~ /\<\s*content.*?name\s*=\s*\"(.*?)\".*?src\s*=\s*\"(.*?)\".*?\/>/i)
		{
			
			$thisname       = $1;
			$resource		= $2;
			$this->{contentdict}->{$thisname}->{xmlcontent} = $this->getResource($resource,$thisname);
			$this->convertMapping($thisname);
			$dummy_line=~s/\<\s*content.*?name\s*=\s*\"(.*?)\".*?src\s*=\s*\"(.*?)\".*?\/>//i;
		}		
		elsif ($dummy_line =~ /\<\s*content.*?name\s*=\s*\"(.*?)\".*?>((.*?)(\n.*?)*?)<\/content.*?>/i)
		{
			$thisname       = $1;
			$this->{contentdict}->{$thisname}->{xmlcontent} = $2;
			$this->convertMapping($thisname);
			
			$dummy_line=~s/\<\s*content.*?name\s*=\s*\"(.*?)\".*?>//i;
		}
		else
		{
			$go = 0;
		}
	}	
}

sub convertMapping
{
	my $this			= shift;
	my $thisname		= shift;
	my $go              = 1;
	my $dummy_line      = $this->{contentdict}->{$thisname}->{xmlcontent};
	while ($go)
	{	
		
		if ($dummy_line =~ /<([^>]*?)(\s[^>]*?)?>(.*?)<\/(.*?)\s*>/)
		{
			my $thisparam	='';
			my $thismap  	= $1;
			$thisparam	= $2;
			my $thisvalue 	= $3;
			my $endtag		= $4;
			if ($thismap eq $endtag)
			{
				
				$thisparam	=~ /\"([^>]*?)\"/;
				$thisparam	= $1;
				
				my $mapline		= '';

				if (($thismap ne '') && (open(MR, "$this->{filedir}$this->{mappingdir}/$thismap".'.html')))
				{	
					while (<MR>)
					{
						$mapline.=$_;
					}
					close(MR);
					
					$mapline =~ s/<\!-- \#$thismap\# -->/$thisvalue/g;
					$mapline =~ s/<\!-- \#value\# -->/$thisparam/g;
					$mapline =~ s/^\s+//;
					$mapline =~ s/\s+$//;
					$this->{contentdict}->{$thisname}->{xmlcontent} =~ s/<$thismap(\s.*)?>.*?<\/$thismap\s*>/$mapline/;	
	
				}
			}
			$dummy_line=~ s/<$thismap(\s.*)?>(.*?)<\/$thismap\s*>//i;
		}
		else
		{
			$go = 0;
		}
	}
}

sub getResource
{
	my $this		= shift;
	my $resource	= shift;
	my $thisname	= shift;
	my $resline		= '';
	my $xmlcontent	= '';
	if ($thisname ne '') 
	{
		if (! defined $this->{resources}->{"$resource"})
		{
			if (open(MRE, "$this->{filedir}$resource"))
			{
				while (<MRE>)
				{
					$resline.=$_;
				}
				close(MRE);	
				$this->{resources}->{"$resource"} = $resline;
			}
		}
		$this->{resources}->{"$resource"} =~ /\<\s*content.*?name\s*=\s*\"$thisname\".*?>((.*?)(\n.*?)*?)<\/content.*?>/i;
		$xmlcontent = $1;		
	}
	return $xmlcontent;
}
	
sub store
{
	my $this		= shift;
	if (open(HR, "$this->{filedir}$this->{template}"))
	{	
		while (<HR>)
		{
			$this->{snpline}.=$_;
		}
		close(HR);
		
		$this->{snpline} =~ s/<\!-- \#storydir\# -->/$this->{activedir}/g;	
		
		foreach my $k (keys %{ $this->{contentdict} })
		{
			$this->{snpline} =~ s/<\!-- \#$k\# -->/$this->{contentdict}->{$k}->{xmlcontent}/g;	
		}
		
	}
	if (open(HW, ">$this->{filedir}/$this->{filename}".'.html'))
	{

		print HW $this->{snpline};
		close(HW);
	}
	
}