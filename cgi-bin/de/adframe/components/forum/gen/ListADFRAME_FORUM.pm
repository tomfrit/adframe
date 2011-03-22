package ListADFRAME_FORUM;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_FORUM_ID,ADFRAME_CHANNEL,AREA,ADFRAME_FORUMCATEGORY_ID,ADFRAME_USER_ID,REF_ADFRAME_FORUM_ID,SUBJECT,COMMENT,URL,NAME,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,TEXT_0,IMG_0,IMG_1,IMG_2,UP_DATE,END_DATE,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_FORUM_ID,ADFRAME_CHANNEL,AREA,ADFRAME_FORUMCATEGORY_ID,ADFRAME_USER_ID,REF_ADFRAME_FORUM_ID,SUBJECT,COMMENT,URL,NAME,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,TEXT_0,IMG_0,IMG_1,IMG_2,UP_DATE,END_DATE,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_FORUM_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_FORUMCATEGORY_ID!|!ADFRAME_USER_ID!|!REF_ADFRAME_FORUM_ID!|!SUBJECT!|!COMMENT!|!URL!|!NAME!|!ITEM_0!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!ITEM_4!|!ITEM_5!|!ITEM_6!|!ITEM_7!|!ITEM_8!|!ITEM_9!|!ITEM_10!|!ITEM_11!|!ITEM_12!|!ITEM_13!|!ITEM_14!|!ITEM_15!|!ITEM_16!|!ITEM_17!|!ITEM_18!|!ITEM_19!|!TEXT_0!|!IMG_0!|!IMG_1!|!IMG_2!|!UP_DATE!|!END_DATE!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_FORUM
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_FORUM_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_FORUM',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_FORUM
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_FORUM_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_FORUM','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_FORUM: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_FORUM

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_FORUM(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_FORUM(String: condition)

getErrorMessage()