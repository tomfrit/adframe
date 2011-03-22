package ClassListADFRAME_VOTING_CATEGORY;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 
use C:\www\motox\cgi-bin\de\adframe\components\voting\gen::ClassADFRAME_VOTING_CATEGORY;

sub getObjects
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= "ADFRAME_VOTING_CATEGORY_ID>0";
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('ADFRAME_VOTING_CATEGORY','ADFRAME_VOTING_CATEGORY_ID',$sqlcondition); 
	my @objects	= ();
	for (my $i=0;$i<=$#data;$i++)
	{
		my $object = new ClassADFRAME_VOTING_CATEGORY();
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
	$this->{errormessage}.='ClassListADFRAME_VOTING_CATEGORY: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ClassListADFRAME_VOTING_CATEGORY

=head2 extends DbAdapter

=head1 METHODS

getObjectsADFRAME_VOTING_CATEGORY(String: condition, String: orderBy, Int: start, Int: limit)

getErrorMessage();