package ListADFRAME_FOTO_RATING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_FOTO_RATING_ID,ADFRAME_USER_ID,ADFRAME_USER_FOTO_ID,RATING,CR_DATE';
$SQL_QUERY_COLS = 'ADFRAME_FOTO_RATING_ID,ADFRAME_USER_ID,ADFRAME_USER_FOTO_ID,RATING,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE)';
$QUAL = '!ADFRAME_FOTO_RATING_ID!|!ADFRAME_USER_ID!|!ADFRAME_USER_FOTO_ID!|!RATING!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!';

sub getADFRAME_FOTO_RATING
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_FOTO_RATING_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_FOTO_RATING',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_FOTO_RATING
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_FOTO_RATING_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_FOTO_RATING','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_FOTO_RATING: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_FOTO_RATING

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_FOTO_RATING(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_FOTO_RATING(String: condition)

getErrorMessage()