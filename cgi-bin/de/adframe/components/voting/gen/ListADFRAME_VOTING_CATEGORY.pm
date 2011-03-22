package ListADFRAME_VOTING_CATEGORY;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_VOTING_CATEGORY_ID,TITLE,TEXT,IMG,ITEM_0,IS_RAFFLE,VOTES,CR_DATE,END_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_VOTING_CATEGORY_ID,TITLE,TEXT,IMG,ITEM_0,IS_RAFFLE,VOTES,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),year(END_DATE),month(END_DATE),dayofmonth(END_DATE),hour(END_DATE),minute(END_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_VOTING_CATEGORY_ID!|!TITLE!|!TEXT!|!IMG!|!ITEM_0!|!IS_RAFFLE!|!VOTES!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!END_DATE_YEAR!|!END_DATE_MONTH!|!END_DATE_DAY!|!END_DATE_HOUR!|!END_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_VOTING_CATEGORY
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_VOTING_CATEGORY_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_VOTING_CATEGORY',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_VOTING_CATEGORY
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_VOTING_CATEGORY_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_VOTING_CATEGORY','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_VOTING_CATEGORY: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_VOTING_CATEGORY

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_VOTING_CATEGORY(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_VOTING_CATEGORY(String: condition)

getErrorMessage()