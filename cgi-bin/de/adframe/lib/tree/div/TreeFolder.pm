package TreeFolder;
# extends:
use de::adframe::lib::tree::div::AbstractTreeNode; @ISA = (AbstractTreeNode);
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

sub getLastChild
{
	my $self			= shift;
	my @children		= @{ $self->{children} };
	return $children[$#children];
}

sub setHtmlfolderimagesrc
{
	my $self					= shift;
	$self->{htmlfolderimagesrc}	= shift;
}

sub displayJavascriptTree
{
	my $self			= shift;
	my $jsExpr			= '';
	my @children 		= @{ $self->{children} };

	if ((ref $self->{parent}) || ($self->{parent} eq 'root'))
	{
		$jsExpr = '<div id="'.$self->{id}.'" class="navLevel'.$self->{level}.'">';
		$jsExpr.= $self->{htmlcodepre};
		$jsExpr.= '<a href="'.$self->{url}.'" onclick="toggle(\''.$self->{id}.'\');" target="'.$self->{htmltarget}.'"><img src="'.$self->{htmlfolderimagesrc}.'" name="folderIcon_'.$self->{id}.'"  border="0">&nbsp;'.$self->{title}.'</a>';
		$jsExpr.= $self->{htmlcodepost};
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
	$jsExpr.= '</div>'."\n";
	return $jsExpr;
}