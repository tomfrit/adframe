package ListADFRAME_DATES;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_DATES_ID,ADFRAME_CHANNEL,AREA,ADFRAME_DATESCATEGORY_ID,START_DATE,END_DATE,START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_DATES_ID,ADFRAME_CHANNEL,AREA,ADFRAME_DATESCATEGORY_ID,year(START_DATE),month(START_DATE),dayofmonth(START_DATE),hour(START_DATE),minute(START_DATE),year(END_DATE),month(END_DATE),dayofmonth(END_DATE),hour(END_DATE),minute(END_DATE),START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_DATES_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_DATESCATEGORY_ID!|!START_DATE_YEAR!|!START_DATE_MONTH!|!START_DATE_DAY!|!START_DATE_HOUR!|!START_DATE_MINUTE!|!END_DATE_YEAR!|!END_DATE_MONTH!|!END_DATE_DAY!|!END_DATE_HOUR!|!END_DATE_MINUTE!|!START_TIME!|!EVENT!|!LOCATION!|!CONTACT_PERSON!|!STREET!|!ZIPCODE!|!CITY!|!COUNTRY!|!FON!|!FAX!|!URL!|!EMAIL!|!PRICE!|!DESCR!|!TEASERTEXT!|!IMAGE_1!|!IMAGE_2!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_DATES
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_DATES_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_DATES',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_DATES
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_DATES_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_DATES','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_DATES: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_DATES

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_DATES(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_DATES(String: condition)

getErrorMessage()