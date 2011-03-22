package ListADFRAME_BRAND;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_BRAND_ID,ADFRAME_CHANNEL,AREA,BRAND,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,URL,COMMENT,CR_DATE,STATUS,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_BRAND_ID,ADFRAME_CHANNEL,AREA,BRAND,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,URL,COMMENT,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),STATUS,IS_ACTIVE';
$QUAL = '!ADFRAME_BRAND_ID!|!ADFRAME_CHANNEL!|!AREA!|!BRAND!|!STREET!|!ZIPCODE!|!CITY!|!COUNTRY!|!EMAIL!|!FON!|!FAX!|!URL!|!COMMENT!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!STATUS!|!IS_ACTIVE!';

sub getADFRAME_BRAND
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_BRAND_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_BRAND',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_BRAND
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_BRAND_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_BRAND','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_BRAND: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_BRAND

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_BRAND(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_BRAND(String: condition)

getErrorMessage()