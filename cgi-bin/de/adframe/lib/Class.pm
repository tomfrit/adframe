package Class;
1;
sub new
{
	my $type			= shift;
	my $self			= {};
	bless $self,$type;
	$self->{type} 		= $type;
	$self->{message}	= '';
	$self->{error}		= '';
	return $self;
}
sub addMessage
{
	my $self			= shift;
	my $message			= shift;
	$self->{message} .= "$self->{type}: $message\n";
}
sub getMessage
{
	my $self			= shift;
	return $self->{message};
}
sub addError
{
	my $self			= shift;
	my $error			= shift;
	$self->{error} 	= $error;
}
sub getError
{
	my $self			= shift;
	return "Error in $self->{type}: ".$self->{error};
}
sub errorOccured
{
	my $self			= shift;
	if ($self->{error} ne '')
	{
		return 1;
	}
	return 0;
}
sub die
{
	my $self			= shift;
	print "\n";
	foreach (@_)
	{
		print "$_\n";
	}
	die;
}