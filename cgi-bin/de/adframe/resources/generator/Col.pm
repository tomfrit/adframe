package Col;
1;

sub new
{
	my $class		= shift;
	my $name		= shift;
	my $this		= {};
	bless $this,$class;
	$this->{name} 		= $name;
	return $this;
}

sub getName
{	
	my $this			= shift;
	return $this->{name};
}
sub setDatatype
{
	my $this			= shift;
	my $datatype		= shift;	
	$this->{datatype} 	= $datatype;
}
sub getDatatype
{
	my $this			= shift;
	return $this->{datatype};
}

sub setFunction
{
	my $this			= shift;
	my $function		= shift;
	$this->{function} 	= $function;
}
sub getFunction
{
	my $this			= shift;
	return $this->{function};
}