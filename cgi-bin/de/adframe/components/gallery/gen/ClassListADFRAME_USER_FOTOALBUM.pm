package ClassListADFRAME_USER_FOTOALBUM;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 
use c:::www::V6::cgi-bin::de::fbmx::gen::ClassADFRAME_USER_FOTOALBUM;

sub getObjects
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= "ADFRAME_USER_FOTOALBUM_ID>0";
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('ADFRAME_USER_FOTOALBUM','ADFRAME_USER_FOTOALBUM_ID',$sqlcondition); 
	my @objects	= ();
	for (my $i=0;$i<=$#data;$i++)
	{
		my $object = new ClassADFRAME_USER_FOTOALBUM();
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
	$this->{errormessage}.='ClassListADFRAME_USER_FOTOALBUM: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ClassListADFRAME_USER_FOTOALBUM

=head2 extends DbAdapter

=head1 METHODS

getObjectsADFRAME_USER_FOTOALBUM(String: condition, String: orderBy, Int: start, Int: limit)

getErrorMessage();