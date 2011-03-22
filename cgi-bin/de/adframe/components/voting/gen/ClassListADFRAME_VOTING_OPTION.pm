package ClassListADFRAME_VOTING_OPTION;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 
use C:\www\motox\cgi-bin\de\adframe\components\voting\gen::ClassADFRAME_VOTING_OPTION;

sub getObjects
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= "ADFRAME_VOTING_OPTION_ID>0";
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('ADFRAME_VOTING_OPTION','ADFRAME_VOTING_OPTION_ID',$sqlcondition); 
	my @objects	= ();
	for (my $i=0;$i<=$#data;$i++)
	{
		my $object = new ClassADFRAME_VOTING_OPTION();
		if ($object->initById($data[$i]))
		{
			push(@objects,$object);
		}
		else
		{
			$this->addErrorMessage("Cannot create Object by ID: $data[$i]");
		}
	}
	return @objects;
}

sub getErrorMessage
{
	my $this	= shift;
	return $this->{errormessage};
}

# private:
sub addErrorMessage
{
	my $this	= shift;
	my $mess	= shift;
	$this->{errormessage}.='ClassListADFRAME_VOTING_OPTION: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ClassListADFRAME_VOTING_OPTION

=head2 extends DbAdapter

=head1 METHODS

getObjectsADFRAME_VOTING_OPTION(String: condition, String: orderBy, Int: start, Int: limit)

getErrorMessage();