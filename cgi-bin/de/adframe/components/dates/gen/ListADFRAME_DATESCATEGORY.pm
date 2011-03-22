package ListADFRAME_DATESCATEGORY;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_DATESCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_DATESCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_DATESCATEGORY_ID!|!ADFRAME_CHANNEL!|!AREA!|!CATEGORY!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_DATESCATEGORY
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_DATESCATEGORY_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_DATESCATEGORY',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_DATESCATEGORY
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_DATESCATEGORY_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_DATESCATEGORY','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_DATESCATEGORY: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_DATESCATEGORY

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_DATESCATEGORY(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_DATESCATEGORY(String: condition)

getErrorMessage()