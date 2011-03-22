package ListADFRAME_COM_USER;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_COM_USER_ID,ADFRAME_USER_ID,PASSWD_QUESTION,PASSWD_ANSWER,URL,SHOW_NAME,SHOW_CITY,SHOW_STREET,SHOW_EMAIL,SHOW_URL,SHOW_BIRTHDAY,SHOW_HOBBY,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_COM_USER_ID,ADFRAME_USER_ID,PASSWD_QUESTION,PASSWD_ANSWER,URL,SHOW_NAME,SHOW_CITY,SHOW_STREET,SHOW_EMAIL,SHOW_URL,SHOW_BIRTHDAY,SHOW_HOBBY,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_COM_USER_ID!|!ADFRAME_USER_ID!|!PASSWD_QUESTION!|!PASSWD_ANSWER!|!URL!|!SHOW_NAME!|!SHOW_CITY!|!SHOW_STREET!|!SHOW_EMAIL!|!SHOW_URL!|!SHOW_BIRTHDAY!|!SHOW_HOBBY!|!IMAGE_1!|!IMAGE_2!|!IMAGE_3!|!LAST_LOGIN!|!LOGIN_COUNT!|!LAST_VIEW!|!VIEW_COUNT!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_COM_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_COM_USER_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_COM_USER',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_COM_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_COM_USER_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_COM_USER','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_COM_USER: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_COM_USER

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_COM_USER(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_COM_USER(String: condition)

getErrorMessage()