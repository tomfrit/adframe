package XMLConfiguration;
use de::adframe::lib::xml::XMLParser;
use de::adframe::lib::xml::XMLElement;
1;

sub new
{
	my $type				= shift;
	my $filename			= shift;
	my $this				= {};
	bless $this,$type;
	$this->{filename} 		= $filename;
	$this->{xml} 			= new XMLParser();
	$this->{errormessage}	= '';
	$this->{elements}		= ();
	if (-f $filename)
	{
		if ($this->{xml}->initFromFile($filename))
		{
			my @el = $this->{xml}->getElementList();
			$this->{elements}	= \@el; 
			return $this;
		}
	}
	$this->{errormessage} = "Cannot load XML-Configuration $filename";
	return 0;
}
sub setCursorAt
{
	my $this				= shift;
	my $curser				= shift;
	my $key					= shift;
	my $value				= shift;
	my $startElement = $this->{xml}->findElement($curser,$key,$value);
	if (ref $startElement)
	{
		my @el = $this->{xml}->getElementList($startElement);
		$this->{elements} = \@el;
		return 1;
	}
	$this->{errormessage} = "XML-Configuration: Element $curser with $key=$value does not exist";
	return 0;
}
sub enumElements
{
	my $this				= shift;
	return @{ $this->{elements} };
}
sub getAttribute
{
	my $this				= shift;
	my $req					= shift;
	my $cursor				= shift;
	my $atrribute			= shift;
	my $attvalue			= shift;
	return $this->{xml}->getAttribute($req,$cursor,$atrribute,$attvalue,\$this->{elements});
}
sub getValue
{
	my $this				= shift;
	my $cursor				= shift;
	my $atrribute			= shift;
	my $attvalue			= shift;
	my $req					= shift;
	if ($req eq '')
	{
	
		return $this->{xml}->getValue($cursor,$atrribute,$attvalue,\$this->{elements});
	}
	else
	{
		my $value			= '';
		my @elements		= $this->getAllTagsWith($req,$cursor,$atrribute,$attvalue);
		
		for (my $i=0;$i<=$#elements;$i++)
		{
			$value.= $elements[$i]->getValue();
			$value.= ',';	
		}
		chop $value;
		chomp $value;	
		return $value;
	}
}
sub getAllTagsWith
{
	my $this				= shift;
	my $tagname				= shift;
	my $cursor				= shift;
	my $key					= shift;
	my $value				= shift;
	my @elements			= ();

	if ($this->setCursorAt($cursor,$key,$value))
	{
		foreach my $c ($this->enumElements())
		{		
			if ($c->getTag() eq $tagname)
			{
				push(@elements,$c);
			}
		}
	}
	return @elements;
}
sub getErrorMessage
{
	my $this						= shift;
	return $this->{errormessage};
}