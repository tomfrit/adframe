package ClassListFORUM_USER;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 
use C:\www\surfers\cgi-bin\de\surfers\gen::ClassFORUM_USER;

sub getObjects
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= "FORUM_USER_ID>0";
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('FORUM_USER','FORUM_USER_ID',$sqlcondition); 
	my @objects	= ();
	for (my $i=0;$i<=$#data;$i++)
	{
		my $object = new ClassFORUM_USER();
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
	$this->{errormessage}.='ClassListFORUM_USER: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ClassListFORUM_USER

=head2 extends DbAdapter

=head1 METHODS

getObjectsFORUM_USER(String: condition, String: orderBy, Int: start, Int: limit)

getErrorMessage();