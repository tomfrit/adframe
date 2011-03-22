package ListCOM_POESIE_EMAIL;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'COM_POESIE_EMAIL_ID,SENDER_ADFRAME_USER_ID,SENDER_LOGIN,RECIPIENT_ADFRAME_USER_ID,RECIPIENT_LOGIN,STATUS_SENDER,STATUS_RECIPIENT,EMAIL_SUBJECT,EMAIL_COMMENT,HIDDEN_FIELD,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'COM_POESIE_EMAIL_ID,SENDER_ADFRAME_USER_ID,SENDER_LOGIN,RECIPIENT_ADFRAME_USER_ID,RECIPIENT_LOGIN,STATUS_SENDER,STATUS_RECIPIENT,EMAIL_SUBJECT,EMAIL_COMMENT,HIDDEN_FIELD,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!COM_POESIE_EMAIL_ID!|!SENDER_ADFRAME_USER_ID!|!SENDER_LOGIN!|!RECIPIENT_ADFRAME_USER_ID!|!RECIPIENT_LOGIN!|!STATUS_SENDER!|!STATUS_RECIPIENT!|!EMAIL_SUBJECT!|!EMAIL_COMMENT!|!HIDDEN_FIELD!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getCOM_POESIE_EMAIL
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "COM_POESIE_EMAIL_ID>0";
	
	if ($condition ne '') 
	{
		$sqlcondition = ' '.$condition;
	}
	if ($orderBy ne '')
	{
		$sqlcondition.= " order by $orderBy";
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('COM_POESIE_EMAIL',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountCOM_POESIE_EMAIL
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "COM_POESIE_EMAIL_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('COM_POESIE_EMAIL','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListCOM_POESIE_EMAIL: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListCOM_POESIE_EMAIL

=head2 extends DbAdapter

=head1 METHODS

getCOM_POESIE_EMAIL(String: condition, String: orderBy, Int: start, Int: limit)

getCountCOM_POESIE_EMAIL(String: condition)

getErrorMessage()