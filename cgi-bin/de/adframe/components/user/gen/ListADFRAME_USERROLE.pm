package ListADFRAME_USERROLE;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USERROLE_ID,ADFRAME_CHANNEL,ROLE,DESCR,CR_DATE,ADMIT';
$SQL_QUERY_COLS = 'ADFRAME_USERROLE_ID,ADFRAME_CHANNEL,ROLE,DESCR,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),ADMIT';
$QUAL = '!ADFRAME_USERROLE_ID!|!ADFRAME_CHANNEL!|!ROLE!|!DESCR!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!ADMIT!';

sub getADFRAME_USERROLE
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USERROLE_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_USERROLE',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_USERROLE
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USERROLE_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_USERROLE','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_USERROLE: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_USERROLE

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_USERROLE(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_USERROLE(String: condition)

getErrorMessage()