package ClassListADFRAME_VOTING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 
use www::V6::cgi-bin::de::fbmx::gen::ClassADFRAME_VOTING;

sub getObjects
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= "ADFRAME_VOTING_ID>0";
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('ADFRAME_VOTING','ADFRAME_VOTING_ID',$sqlcondition); 
	my @objects	= ();
	for (my $i=0;$i<=$#data;$i++)
	{
		my $object = new ClassADFRAME_VOTING();
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
	$this->{errormessage}.='ClassListADFRAME_VOTING: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ClassListADFRAME_VOTING

=head2 extends DbAdapter

=head1 METHODS

getObjectsADFRAME_VOTING(String: condition, String: orderBy, Int: start, Int: limit)

getErrorMessage();