package ClassListADFRAME_FOTO_RATING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 
use C:\www\V6\cgi-bin\de\adframe\components\gallery\gen::ClassADFRAME_FOTO_RATING;

sub getObjects
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= "ADFRAME_FOTO_RATING_ID>0";
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('ADFRAME_FOTO_RATING','ADFRAME_FOTO_RATING_ID',$sqlcondition); 
	my @objects	= ();
	for (my $i=0;$i<=$#data;$i++)
	{
		my $object = new ClassADFRAME_FOTO_RATING();
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
	$this->{errormessage}.='ClassListADFRAME_FOTO_RATING: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ClassListADFRAME_FOTO_RATING

=head2 extends DbAdapter

=head1 METHODS

getObjectsADFRAME_FOTO_RATING(String: condition, String: orderBy, Int: start, Int: limit)

getErrorMessage();