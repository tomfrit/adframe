package ListADFRAME_USERCOMPANYBRAND;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USERCOMPANYBRAND_ID,ADFRAME_CHANNEL,AREA,ADFRAME_USER_ID,ADFRAME_COMPANY_ID,ADFRAME_BRAND_ID,COMMENT,CR_DATE,STATUS,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_USERCOMPANYBRAND_ID,ADFRAME_CHANNEL,AREA,ADFRAME_USER_ID,ADFRAME_COMPANY_ID,ADFRAME_BRAND_ID,COMMENT,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),STATUS,IS_ACTIVE';
$QUAL = '!ADFRAME_USERCOMPANYBRAND_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_USER_ID!|!ADFRAME_COMPANY_ID!|!ADFRAME_BRAND_ID!|!COMMENT!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!STATUS!|!IS_ACTIVE!';

sub getADFRAME_USERCOMPANYBRAND
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USERCOMPANYBRAND_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_USERCOMPANYBRAND',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_USERCOMPANYBRAND
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USERCOMPANYBRAND_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_USERCOMPANYBRAND','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_USERCOMPANYBRAND: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_USERCOMPANYBRAND

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_USERCOMPANYBRAND(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_USERCOMPANYBRAND(String: condition)

getErrorMessage()