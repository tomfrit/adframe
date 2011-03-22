package ListADFRAME_USER;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USER_ID,ADFRAME_CHANNEL,ACCOUNT_NO,GENDER,TITLE,FIRSTNAME,NAME,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,MOBIL,BIRTHDAY,PROFESSION,COMPANY,ADFRAME_COMPANY_ID,POSITION,FON_COMPANY,HOBBY,EXTENSION,EXTENSION_ID,LOGIN,PASSWD,LICENCEKEY,ROLES,CR_DATE,ADMIT';
$SQL_QUERY_COLS = 'ADFRAME_USER_ID,ADFRAME_CHANNEL,ACCOUNT_NO,GENDER,TITLE,FIRSTNAME,NAME,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,MOBIL,BIRTHDAY,PROFESSION,COMPANY,ADFRAME_COMPANY_ID,POSITION,FON_COMPANY,HOBBY,EXTENSION,EXTENSION_ID,LOGIN,PASSWD,LICENCEKEY,ROLES,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),ADMIT';
$QUAL = '!ADFRAME_USER_ID!|!ADFRAME_CHANNEL!|!ACCOUNT_NO!|!GENDER!|!TITLE!|!FIRSTNAME!|!NAME!|!STREET!|!ZIPCODE!|!CITY!|!COUNTRY!|!EMAIL!|!FON!|!FAX!|!MOBIL!|!BIRTHDAY!|!PROFESSION!|!COMPANY!|!ADFRAME_COMPANY_ID!|!POSITION!|!FON_COMPANY!|!HOBBY!|!EXTENSION!|!EXTENSION_ID!|!LOGIN!|!PASSWD!|!LICENCEKEY!|!ROLES!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!ADMIT!';

sub getADFRAME_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USER_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_USER',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USER_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_USER','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_USER: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_USER

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_USER(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_USER(String: condition)

getErrorMessage()