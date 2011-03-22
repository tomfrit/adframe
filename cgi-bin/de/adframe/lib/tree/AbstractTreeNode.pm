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
	
	if (ref $parent)
	{
		$parent->addChild($self);
	}
	return $self;
}

sub getName
{
	my $self			= shift;
	return $self->{name};
}

sub getParent
{
	my $self			= shift;
	return $self->{parent};
}