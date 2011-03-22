package McmsXmlField;
1;
sub new
{
	my $class			= shift;
	my $name			= shift;
	my $this			= {};
	bless $this,$class;
	$this->{name}		= $name;
	return $this;
}

sub getName
{
	my $this			= shift;
	return $this->{name};
}

sub setTitle
{
	my $this			= shift;
	$this->{title} 		= shift;
}
sub getTitle
{
	my $this			= shift;
	return $this->{title};
}

sub setChartest
{
	my $this			= shift;
	$this->{chartest} 	= shift;
}
sub getChartest
{
	my $this			= shift;
	return $this->{chartest};
}

sub setAttributes
{
	my $this			= shift;
	$this->{attributes} = shift;
}
sub getAttributes
{
	my $this			= shift;
	return $this->{attributes};
}

sub setClass
{
	my $this			= shift;
	$this->{class} = shift;
}
sub getClass
{
	my $this			= shift;
	return $this->{class};
}

sub setValues
{
	my $this			= shift;
	$this->{values} 	= shift;
}
sub getValues
{
	my $this			= shift;
	return $this->{values};
}

sub setPage
{
	my $this			= shift;
	$this->{page} 		= shift;
}
sub getPage
{
	my $this			= shift;
	return $this->{page};
}

sub setType
{
	my $this			= shift;
	$this->{type} 		= shift;
}
sub getType
{
	my $this			= shift;
	return $this->{type};
}

sub setDefault
{
	my $this			= shift;
	$this->{default} 	= shift;
}
sub getDefault
{
	my $this			= shift;
	return $this->{default};
}

sub setPageStatus
{
	my $this			= shift;
	$this->{pagestatus}	= shift;
}
sub getPageStatus
{
	my $this			= shift;
	return $this->{pagestatus};
}

sub setPageTitle
{
	my $this			= shift;
	$this->{pagetitle}	= shift;
}
sub getPageTitle
{
	my $this			= shift;
	return $this->{pagetitle};
}

sub setDisplay
{
	my $this			= shift;
	$this->{display}	= shift;
}
sub getDisplay
{
	my $this			= shift;
	return $this->{display};
}

sub toString
{
	my $this		= shift;
	my $feed		= shift;
	my $separator	= shift;
	my $string		= '';
	$string.= $separator;
	$string.= $feed.'name:       '.$this->{name}.$separator;
	$string.= $feed.'----------------------------'.$separator;
	$string.= $feed.'title:      '.$this->{title}.$separator;
	$string.= $feed.'chartest:   '.$this->{chartest}.$separator;
	$string.= $feed.'attributes: '.$this->{attributes}.$separator;
	$string.= $feed.'values:     '.$this->{values}.$separator;
	$string.= $feed.'page:       '.$this->{page}.$separator;
	$string.= $feed.'type:       '.$this->{type}.$separator;
	$string.= $feed.'default:    '.$this->{default}.$separator;
	$string.= $feed.'pagestatus: '.$this->{pagestatus}.$separator;
	$string.= $feed.'pagetitle:  '.$this->{pagetitle}.$separator;
	$string.= $feed.'display:    '.$this->{display}.$separator;
	$string.= $feed.'class:    	'.$this->{class}.$separator;
	return $string;
}