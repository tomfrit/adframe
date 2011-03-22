package ListADFRAME_LINKS;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_LINKS_ID,ADFRAME_CHANNEL,ADFRAME_LINKSCATEGORY_ID,TITLE,URL,DESCR,IMAGE_0,IMAGE_1,ITEM_0,ITEM_1,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_LINKS_ID,ADFRAME_CHANNEL,ADFRAME_LINKSCATEGORY_ID,TITLE,URL,DESCR,IMAGE_0,IMAGE_1,ITEM_0,ITEM_1,IS_ACTIVE';
$QUAL = '!ADFRAME_LINKS_ID!|!ADFRAME_CHANNEL!|!ADFRAME_LINKSCATEGORY_ID!|!TITLE!|!URL!|!DESCR!|!IMAGE_0!|!IMAGE_1!|!ITEM_0!|!ITEM_1!|!IS_ACTIVE!';

sub getADFRAME_LINKS
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_LINKS_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_LINKS',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_LINKS
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_LINKS_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_LINKS','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_LINKS: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_LINKS

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_LINKS(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_LINKS(String: condition)

getErrorMessage()