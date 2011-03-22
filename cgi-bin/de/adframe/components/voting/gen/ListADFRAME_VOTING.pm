package ListADFRAME_VOTING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_VOTING_ID,ADFRAME_VOTING_CATEGORY_ID,ADFRAME_USER_ID,`VALUE`,ITEM_0,ITEM_1,ITEM_2,ITEM_3,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_VOTING_ID,ADFRAME_VOTING_CATEGORY_ID,ADFRAME_USER_ID,`VALUE`,ITEM_0,ITEM_1,ITEM_2,ITEM_3,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_VOTING_ID!|!ADFRAME_VOTING_CATEGORY_ID!|!ADFRAME_USER_ID!|!`VALUE`!|!ITEM_0!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_VOTING
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_VOTING_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_VOTING',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_VOTING
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_VOTING_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_VOTING','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_VOTING: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_VOTING

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_VOTING(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_VOTING(String: condition)

getErrorMessage()