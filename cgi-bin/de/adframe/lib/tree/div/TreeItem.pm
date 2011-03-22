package TreeItem;
# extends:
use de::adframe::lib::tree::div::AbstractTreeNode; @ISA = (AbstractTreeNode);
1;

sub displayJavascriptTree
{
	my $self			= shift;
	my $jsExpr			= '';
	if (ref $self->{parent})
	{
		$jsExpr	= '<div id="'.$self->{id}.'" class="navLevel'.$self->{level}.'" style="display:none;" >';
		$jsExpr.= $self->{htmlcodepre};
		$jsExpr.= '<a href="'.$self->{url}.'" target="'.$self->{htmltarget}.'">'.$self->{title}.'</a>';
		$jsExpr.= $self->{htmlcodepost};
		$jsExpr.= '</div>';
	}
	else
	{
		$jsExpr			= "// wrong parent-definition for item ! (name: '$self->{name}' title: '$self->{title}' parent: $self->{parent})";
	}
	$jsExpr.="\n";
	return $jsExpr;
}