package AbstractTreeNode;
1;

sub new
{
	my $type			= shift;	
	my $name			= shift;
	my $title			= shift;
	my $url				= shift;
	my $parent			= shift;
	my $self			= {};

	bless $self,$type;
	$self->{name} 		= $name;
	$self->{title} 		= $title;
	$self->{url} 		= $url;
	$self->{parent} 	= $parent;
	$self->{number} 	= 0;
	$self->{id}			= '';
	$self->{level}		= 0;
	
	if (ref $parent)
	{
		my $prevChild = $parent->getLastChild();
		if (ref $prevChild)
		{
			$self->{number}	= $prevChild->getNumber();
			$self->{number}++;
		}

		$parent->addChild($self);

		my $lastParent	= $self;
		
		while (ref $lastParent)
		{
			$self->{id} = '_'.$lastParent->getNumber().$self->{id};
			$lastParent	= $lastParent->getParent();
			$self->{level}++;
		}
	}
	elsif ($parent eq 'root')
	{
		$self->{id}	= '_0';
	}
	$self->{id}	= 'nav'.$self->{id};

	return $self;
}

sub getNumber
{
	my $self			= shift;
	return $self->{number};
}

sub getId
{
	my $self			= shift;
	return $self->{id};
}

sub getParent
{
	my $self			= shift;
	return $self->{parent};
}

sub getName
{
	my $self			= shift;
	return $self->{name};
}

sub getLevel
{
	my $self			= shift;
	return $self->{level};
}

sub setHtmlPreCode
{
	my $self				= shift;
	$self->{htmlcodepre}	= shift;
}

sub setHtmlPostCode
{
	my $self				= shift;
	$self->{htmlcodepost}	= shift;
}

sub setHtmlTarget
{
	my $self				= shift;
	$self->{htmltarget}		= shift;
}

