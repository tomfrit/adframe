package XMLParser;
use XML::Parser;
use de::adframe::lib::xml::XMLElement;
1;

sub new
{
	my $type				= shift;
	my $this				= {};
	$this->{elementlist} 	= ();
	bless $this,$type;
	return $this;
}

sub initFromFile
{
	my $this				= shift;
	my $filename			= shift;
	$this->{elementlist} 	= ();
	if (-e $filename)
	{
		$this->{xmlparser} = new XML::Parser(Style => 'Tree');
		$this->{xmlobj} = $this->{xmlparser}->parsefile("$filename");

		if (ref $this->{xmlobj})
		{
			$this->_initXMLConfig();
			return 1;
		}
	}
	return 0;
}

sub getElementList
{
	my $this				= shift;
	my $start				= shift;
	
	if (ref $start)
	{
		return $this->getElementsByParent($start);
	}
	elsif ($start ne '')
	{
		my $startElement = $this->findElement($start);
		
		return $this->getElementsByParent($startElement);
	}
	else
	{
		return @{ $this->{elementlist} };
	}
}

sub getElementsByParent
{
	my $this				= shift;
	my $theParent			= shift;
	my $elListRef			= shift;
	my @elementList			= ();
	my @retElements			= ();
	if (ref $theParent)
	{
		if (ref $elListRef eq 'ARRAY')
		{
			@elementList = @{ $elListRef };		
		}
		else
		{
			@elementList = $this->getElementList();
		}
		for (my $i=0;$i<=$#elementList;$i++)
		{
			if ($elementList[$i]->hasParent($theParent))
			{
				push(@retElements,$elementList[$i]);
			}
		}
	}
	return @retElements;
}

sub findElement
{
	my $this				= shift;
	my $treeStructString	= shift;
	my $atrribute			= shift;
	my $attvalue			= shift;
	my $elListRef			= shift;
	my @elementList			= ();
	my $parentList			= '';
	my $foundElement		= undef;
	my %attr				= ();
	if (ref $elListRef eq 'ARRAY')
	{
		@elementList = @{ $elListRef };		
	}
	else
	{
		@elementList = $this->getElementList();
	}
	for (my $i=0;$i<=$#elementList;$i++)
	{
		if ($treeStructString eq $elementList[$i]->getTagParentsAsString())
		{
			if ($atrribute ne '')
			{
				if ($attvalue eq $elementList[$i]->getAttribute($atrribute))
				{
					$foundElement = $elementList[$i];
					last;
				}
			}
			else
			{
				$foundElement = $elementList[$i];
				last;
			}

		}
	}
	return $foundElement;
}

sub getValue
{
	my $this				= shift;
	my $treeStructString	= shift;
	my $atrribute			= shift;
	my $attvalue			= shift;
	my $elListRef			= shift;
	my $foundValue			= '';
	my $foundElement = $this->findElement($treeStructString,$atrribute,$attvalue,$elListRef);

	if (ref $foundElement)
	{
		$foundValue = $foundElement->getValue();
	}
	return $foundValue;
}

sub getAttribute
{
	my $this				= shift;
	my $reqAttr				= shift;
	my $treeStructString	= shift;
	my $atrribute			= shift;
	my $attvalue			= shift;
	my $elListRef			= shift;
	my $foundAttrValue		= '';
	my $foundElement = $this->findElement($treeStructString,$atrribute,$attvalue,$elListRef);
	if (ref $foundElement)
	{
		$foundAttrValue = $foundElement->getAttribute($reqAttr);
	}
	return $foundAttrValue;
}


# private:
sub _initXMLConfig
{
	my $this				= shift;
	if (ref $this->{xmlobj} eq 'ARRAY')
	{
		my @root = @{ $this->{xmlobj} };
		my $rootElement = new XMLElement($root[0],undef);
		$this->_initFromArray($rootElement,$root[1]);
	}
}

sub _initFromArray
{
	my $this				= shift;
	my $actualElement		= shift;
	my $arrayRef			= shift;
	my @theArray			= @{ $arrayRef };
	my $nextIsValue			= 0;
	my %actualAttributes	= ();
	my $parentElement		= $actualElement;

	for (my $i=0;$i<=$#theArray;$i++)
	{
		if (ref($theArray[$i]) eq 'ARRAY')
		{
			if (ref $actualElement)
			{
				$this->_initFromArray($actualElement,$theArray[$i]);
			}

		}
		elsif (ref($theArray[$i]) eq 'HASH')
		{
			# set atributes:
			if (ref $actualElement)
			{
				%actualAttributes = %{ $theArray[$i] };
				foreach my $k (keys %actualAttributes)
				{
					$actualElement->setAttribute($k,$actualAttributes{$k})
				}
			}
		}
		else
		{
			if ($theArray[$i] =~ /\n/)
			{
				$nextIsValue=0;
			}
			elsif ($theArray[$i] ne '0')
			{
				if ($nextIsValue)
				{
					# value für tag:
					if (ref $actualElement)
					{
						$actualElement->setValue($theArray[$i]);
					}
				}
				else
				{
					$actualElement = new XMLElement($theArray[$i],$parentElement);
					push(@{ $this->{elementlist} }, $actualElement);
				}
			}
			elsif ($theArray[$i] eq '0')
			{
				# nächstes element wird value, kein array-key:
				$nextIsValue=1;
			}
		}
	}
}


