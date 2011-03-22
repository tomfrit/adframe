package TreeFolder;
# extends:
use de::adframe::lib::tree::AbstractTreeNode; @ISA = (AbstractTreeNode);
1;

sub addChild
{
	my $self			= shift;
	my $child			= shift;
	if (! ref $self->{children}	)
	{
		$self->{children}	= ();
	}
	push(@{ $self->{children} },$child);
}

sub displayJavascriptTree
{
	my $self			= shift;
	my $jsExpr			= '';
	my @children 		= @{ $self->{children} };

	if (ref $self->{parent})
	{
		my $parentName	= $self->{parent}->getName();
		$jsExpr = $self->{name}.'=insFld('.$parentName.', gFld("'.$self->{title}.'","'.$self->{url}.'","<!-- #id# -->"));';
	}
	elsif ($self->{parent} eq 'root')
	{
		$jsExpr = $self->{name}.'=gFld("'.$self->{title}.'","'.$self->{url}.'","<!-- #id# -->");';
	}
	else
	{
		$jsExpr = "// wrong parent-definition for folder ! (name: '$self->{name}' title: '$self->{title}' parent: $self->{parent})";
	}
	
	$jsExpr.="\n";
	
	for (my $i=0;$i<=$#children;$i++)
	{
		if (ref $children[$i])
		{
			$jsExpr.= $children[$i]->displayJavascriptTree();
		}
	}
	return $jsExpr;
}