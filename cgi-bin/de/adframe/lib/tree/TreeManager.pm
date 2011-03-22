package TreeManager;
use de::adframe::lib::tree::TreeFolder;
use de::adframe::lib::tree::TreeItem;

1;
sub new
{
	my $type				= shift;
	my $self				= {};
	bless $self,$type;
	return $self;
}
sub initTree
{
	my $self				= shift;
	my $title				= shift;
	my $url					= shift;
	$self->{folder}			= ();
	$self->{item}			= ();
	$self->{folderCounter}	= 0;
	$self->{itemCounter} 	= 0;
	my $name				= 'folder0';
	my $rootFolder			= new TreeFolder($name,$title,$url,'root');
	push(@{ $self->{folder} },$rootFolder);
	return $rootFolder;
}
sub addFolder
{
	my $self				= shift;
	my $title				= shift;
	my $url					= shift;
	my $parent				= shift;
	$self->{folderCounter}++;
	my $name			= 'folder'.$self->{folderCounter};	
	my $newFolder		= new TreeFolder($name,$title,$url,$parent);
	push(@{ $self->{folder} },$newFolder);
	return $newFolder;
}
sub addItem
{
	my $self				= shift;
	my $title				= shift;
	my $url					= shift;
	my $parent				= shift;
	$self->{itemCounter}++;
	my $name				= 'item'.$self->{itemCounter};	
	my $newItem				= new TreeItem($name,$title,$url,$parent);
	push(@{ $self->{item} },$newItem);
	return $newItem;
}

sub displayJavascriptTree
{
	my $self				= shift;
	my @folder				= @{ $self->{folder} };
	my $jsLine				= $folder[0]->displayJavascriptTree();
	return $jsLine;
}