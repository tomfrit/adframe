package XMLElement;
1;

sub new
{
	my $type			= shift;
	my $tag				= shift;
	my $parent			= shift;
	my $this			= {};
	bless $this, $type;
	$this->{tag}		= $tag;
	$this->{child}		= ();
	$this->{attribute}	= {};
	$this->{value}		= '';
	$this->setParent($parent);
	return $this;
}

sub getTag
{
	my $this			= shift;
	return $this->{tag};
}

sub setParent
{
	my $this			= shift;
	my $parent			= shift;
	if (ref $parent)
	{
		$this->{parent}		= $parent;
		$this->_setParentTagStructure();
	}
}

sub getParent
{
	my $this			= shift;
	return $this->{parent};
}

sub hasParent
{
	my $this			= shift;
	my $theParent		= shift;
	my $parentElement	= $this->{parent};
	my $panic			= 500;
	my $found 			= 0;
	while ((defined $parentElement) && ($panic > 0))
	{
		if ($theParent == $parentElement)
		{
			$found = 1;
			last;
		}
		else
		{
			$parentElement = $parentElement->getParent();
		}
		$panic--;
	}
	return $found;
}

sub getTagParentsAsString
{
	my $this			= shift;
	return $this->{parenttagstring};
}

sub addChild
{
	my $this			= shift;
	my $child			= shift;
	push (@{ $this->{child} }, $child);
}
sub getChildren
{
	my $this			= shift;
	return @{ $this->{child} };
}

sub setAttribute
{
	my $this			= shift;
	my $attribute		= shift;
	my $value			= shift;
	$value =~ s/\&#60;/</g;
	$value =~ s/\&#62;/>/g;
	$this->{attribute}->{"$attribute"} = $value;
}
sub getAttribute
{
	my $this			= shift;
	my $attribute		= shift;
	if ($attribute eq '')
	{
		return %{ $this->{attribute} };
	}
	else
	{
		$this->{attribute}->{"$attribute"};
	}
}

sub setValue
{
	my $this			= shift;
	my $value			= shift;
	$value =~ s/\&#60;/</g;
	$value =~ s/\&#62;/>/g;
	$this->{value}		= $value;
}
sub getValue
{
	my $this			= shift;
	return $this->{value};
}

# private
sub _setParentTagStructure
{
	my $this			= shift;
	my $parentTagString = $this->{tag};
	my $parentElement	= $this->{parent};
	my $panic			= 500;
	$self->{parenttagstring} = '';
	while ((defined $parentElement) && ($panic > 0))
	{
		$parentTagString = $parentElement->getTag().':'.$parentTagString;
		$parentElement = $parentElement->getParent();
		$panic--;
	}
	$this->{parenttagstring} = $parentTagString;
}