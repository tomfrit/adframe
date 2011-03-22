package TreeItem;
# extends:
use de::adframe::lib::tree::AbstractTreeNode; @ISA = (AbstractTreeNode);
1;

sub displayJavascriptTree
{
	my $self			= shift;
	my $jsExpr			= '';
	if (ref $self->{parent})
	{
		my $parentName	= $self->{parent}->getName();
		$jsExpr				= 'insDoc('.$parentName.', gLnk(0, "'.$self->{title}.'","'.$self->{url}.'","<!-- #id# -->"));';
	}
	else
	{
		$jsExpr			= "// wrong parent-definition for item ! (name: '$self->{name}' title: '$self->{title}' parent: $self->{parent})";
	}
	$jsExpr.="\n";
	return $jsExpr;
}