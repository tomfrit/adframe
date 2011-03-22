package ListADFRAME_MCMS_RATING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'id,login,mcms_id,rating,CR_DATE';
$SQL_QUERY_COLS = 'id,login,mcms_id,rating,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE)';
$QUAL = '!id!|!login!|!mcms_id!|!rating!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!';

sub getADFRAME_MCMS_RATING
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "id>0";
	
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
	my @data 	= $this->get('ADFRAME_MCMS_RATING',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_MCMS_RATING
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "id>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_MCMS_RATING','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_MCMS_RATING: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_MCMS_RATING

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_MCMS_RATING(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_MCMS_RATING(String: condition)

getErrorMessage()