package ListFORUM_USER;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'FORUM_USER_ID,ADFRAME_USER_ID,FIRSTNAME,NAME,SHOW_NAME,EMAIL,AGE,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,ITEM_20,ITEM_21,ITEM_22,ITEM_23,ITEM_24,ITEM_25,ITEM_26,ITEM_27,ITEM_28,ITEM_29,IMAGE,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'FORUM_USER_ID,ADFRAME_USER_ID,FIRSTNAME,NAME,SHOW_NAME,EMAIL,AGE,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,ITEM_20,ITEM_21,ITEM_22,ITEM_23,ITEM_24,ITEM_25,ITEM_26,ITEM_27,ITEM_28,ITEM_29,IMAGE,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!FORUM_USER_ID!|!ADFRAME_USER_ID!|!FIRSTNAME!|!NAME!|!SHOW_NAME!|!EMAIL!|!AGE!|!ITEM_0!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!ITEM_4!|!ITEM_5!|!ITEM_6!|!ITEM_7!|!ITEM_8!|!ITEM_9!|!ITEM_10!|!ITEM_11!|!ITEM_12!|!ITEM_13!|!ITEM_14!|!ITEM_15!|!ITEM_16!|!ITEM_17!|!ITEM_18!|!ITEM_19!|!ITEM_20!|!ITEM_21!|!ITEM_22!|!ITEM_23!|!ITEM_24!|!ITEM_25!|!ITEM_26!|!ITEM_27!|!ITEM_28!|!ITEM_29!|!IMAGE!|!IMAGE_1!|!IMAGE_2!|!IMAGE_3!|!LAST_LOGIN!|!LOGIN_COUNT!|!LAST_VIEW!|!VIEW_COUNT!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getFORUM_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "FORUM_USER_ID>0";
	
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
	my @data 	= $this->get('FORUM_USER',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountFORUM_USER
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "FORUM_USER_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('FORUM_USER','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListFORUM_USER: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListFORUM_USER

=head2 extends DbAdapter

=head1 METHODS

getFORUM_USER(String: condition, String: orderBy, Int: start, Int: limit)

getCountFORUM_USER(String: condition)

getErrorMessage()