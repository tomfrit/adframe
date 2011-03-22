package XMLParser;
use de::adframe::lib::xml::XMLElement;
use open IO => ':utf8';
1;

sub new
{
	my $type				= shift;
	my $this				= {};
	$this->{elementlist} 	= ();
	$this->{errormessage}	= '';
	bless $this,$type;
	return $this;
}

sub initFromFile
{
	my $this				= shift;
	my $filename			= shift;
	$this->{elementlist} 	= ();

	if (open(HA,$filename))
	{
		my @lines = <HA>;
		close(HA);
		$this->{xmlline} = join("\n",@lines);
		$this->{xmlline} =~ s/\n//g;
		$this->{xmlline} =~ s/\r//g;
		$this->{xmlline} =~ s/\x0d//g;
		$this->{xmlline} =~ s/<!--.*?-->//g;
		$this->{xmlline} =~ s/(<.*?>)\s+(<.*?>)/$1$2/g;
		$this->{xmlline} =~ s/(<.*?>)\t+(<.*?>)/$1$2/g;
		return $this->_parseXML();
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

sub _parseXML
{
	my $this				= shift;
	my $tagline				= '';
	my $xmltag				= '';
	my $attrib				= '';
	my @stack				= ();
	my $actualElement		=  'undef';


	while ($this->{xmlline} =~ s/([^<]*?)(<.*?>)//)
	{
		$valueline	= $1;
		$tagline 	= $2;
		$valueline =~ s/^\s+//g;
		$valueline =~ s/\s+$//g;
		$valueline =~ s/^\t+//g;
		$valueline =~ s/\t+$//g;

		if ($tagline =~ /<\?\s*xml/)
		{
			$actualElement = new XMLElement('root',undef);
			push(@stack,'');
			next;
		}
		if ($valueline ne '')
		{
			# value:
			$stack[$#stack]->setValue($valueline);
		}
		if ($tagline =~ /<\s*\/\s*(.*?)\s*>/)
		{
			# end-tag:
			$xmltag	= $1;
			$actualElement = pop(@stack);
			if ($actualElement->getTag() ne $xmltag)
			{
				$this->addErrorMessage('wrong end tag $xmltag for '.$actualElement->getTag());
				return 0;
			}

		}
		elsif ($tagline =~ /<\s*(.*?)\s(.*?)\/>/)
		{
			# single-tag mit attr:
			$xmltag	= $1;
			$attrib	= $2;
			$actualElement = new XMLElement($xmltag,$stack[$#stack]);
			$this->setAttributesForElement($actualElement,$attrib);
			push(@{ $this->{elementlist} }, $actualElement);
		}
		elsif ($tagline =~ /<\s*(.*?)\s(.*?)>/)
		{
			# start-tag mit attr:
			$xmltag	= $1;
			$attrib	= $2;
			$actualElement = new XMLElement($xmltag,$stack[$#stack]);
			$this->setAttributesForElement($actualElement,$attrib);
			push(@{ $this->{elementlist} }, $actualElement);
			push(@stack,$actualElement);
		}
		elsif ($tagline =~ /<\s*(.*?)\s*>/)
		{
			# start-tag ohne attr:
			$xmltag	= $1;
			$actualElement = new XMLElement($xmltag,$stack[$#stack]);
			push(@{ $this->{elementlist} }, $actualElement);
			push(@stack,$actualElement);
		}
	}
	#foreach my $k (@{ $this->{elementlist} })
	#{
	#	print "TAG: ".$k->getTag();
	#	print "\n";
	#	print "PARENT: ".$k->getTagParentsAsString();
	#	print "\n";
	#	print "VALUE: ".$k->getValue();
	#	print "\n";
	#	print "ATTR: ";
	#	my %at = $k->getAttribute();
	#	foreach my $a (keys %at)
	#	{
	#		print "    $a -> ".$at{$a}."\n";
	#	}
	#	print "\n\n";
	#}
	return 1;
}

sub setAttributesForElement
{
	my $this	= shift;
	my $element	= shift;
	my $str		= shift;
	while ($str =~ s/\s*(.*?)\s*=\s*\"(.*?)\"//)
	{
		$element->setAttribute($1,$2);
	}
}

sub getErrorMessage
{
	my $this	= shift;
	return $this->{errormessage};
}

# private:
sub addErrorMessage
{
	my $this	= shift;
	my $mess	= shift;
	$this->{errormessage}.='XMLParser: '.$mess.'\n';
}