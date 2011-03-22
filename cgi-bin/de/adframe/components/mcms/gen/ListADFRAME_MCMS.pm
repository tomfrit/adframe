package ListADFRAME_MCMS;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_MCMS_ID,ADFRAME_CHANNEL,AREA,CATEGORY,RANK_NO,PAGE_COUNT,P_STATUS,P_DATE,IS_ARCHIVE,A_NAME,A_EMAIL,SEL,SEL_2,HEADLINE,ITEM_1_1,ITEM_1_2,ITEM_1_3,ITEM_1_4,ITEM_2_1,ITEM_2_2,ITEM_2_3,ITEM_2_4,ITEM_3_1,ITEM_3_2,ITEM_3_3,ITEM_3_4,IMG_0_0,IMG_0_1,IMG_0_2,IMG_0_3,IMG_0_4,IMG_1_0,IMG_1_1,IMG_1_2,IMG_1_3,IMG_1_4,IMG_2_1,IMG_2_2,IMG_2_3,IMG_2_4,IMG_3_1,IMG_3_2,IMG_3_3,IMG_3_4,TEXT_0,TEXT_1_1,TEXT_1_2,TEXT_1_3,TEXT_1_4,TEXT_2_1,TEXT_2_2,TEXT_2_3,TEXT_2_4,TEXT_3_1,TEXT_3_2,TEXT_3_3,TEXT_3_4,PARENT_RANK_NO,VIDEO_1_1,PIC_VIDEO_1_1,ITEM_1_5,VIDEO_1_2,PIC_VIDEO_1_2,ITEM_1_6,SAISON,ETIKETT,ITEM_2_5,ITEM_2_6,ITEM_2_7,ITEM_2_8,ITEM_2_9,TEXT_4_0,TEXT_4_1,TEXT_4_2,TEXT_4_3,TEXT_4_4,TEXT_5_0,TEXT_5_1,TEXT_5_2,TEXT_5_3,TEXT_5_4,ITEM_4_0,ITEM_4_1,ITEM_4_2,ITEM_4_3,ITEM_4_4,ITEM_5_0,ITEM_5_1,ITEM_5_2,ITEM_5_3,ITEM_5_4,IMG_4_0,IMG_4_1,IMG_4_2,IMG_4_3,IMG_4_4,IMG_5_0,IMG_5_1,IMG_5_2,IMG_5_3,IMG_5_4,SEL_3,SEL_4,VIEW_COUNT,VIEW_COUNT_2,VIEW_COUNT_3,VIEW_COUNT_4,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_MCMS_ID,ADFRAME_CHANNEL,AREA,CATEGORY,RANK_NO,PAGE_COUNT,P_STATUS,P_DATE,IS_ARCHIVE,A_NAME,A_EMAIL,SEL,SEL_2,HEADLINE,ITEM_1_1,ITEM_1_2,ITEM_1_3,ITEM_1_4,ITEM_2_1,ITEM_2_2,ITEM_2_3,ITEM_2_4,ITEM_3_1,ITEM_3_2,ITEM_3_3,ITEM_3_4,IMG_0_0,IMG_0_1,IMG_0_2,IMG_0_3,IMG_0_4,IMG_1_0,IMG_1_1,IMG_1_2,IMG_1_3,IMG_1_4,IMG_2_1,IMG_2_2,IMG_2_3,IMG_2_4,IMG_3_1,IMG_3_2,IMG_3_3,IMG_3_4,TEXT_0,TEXT_1_1,TEXT_1_2,TEXT_1_3,TEXT_1_4,TEXT_2_1,TEXT_2_2,TEXT_2_3,TEXT_2_4,TEXT_3_1,TEXT_3_2,TEXT_3_3,TEXT_3_4,PARENT_RANK_NO,VIDEO_1_1,PIC_VIDEO_1_1,ITEM_1_5,VIDEO_1_2,PIC_VIDEO_1_2,ITEM_1_6,SAISON,ETIKETT,ITEM_2_5,ITEM_2_6,ITEM_2_7,ITEM_2_8,ITEM_2_9,TEXT_4_0,TEXT_4_1,TEXT_4_2,TEXT_4_3,TEXT_4_4,TEXT_5_0,TEXT_5_1,TEXT_5_2,TEXT_5_3,TEXT_5_4,ITEM_4_0,ITEM_4_1,ITEM_4_2,ITEM_4_3,ITEM_4_4,ITEM_5_0,ITEM_5_1,ITEM_5_2,ITEM_5_3,ITEM_5_4,IMG_4_0,IMG_4_1,IMG_4_2,IMG_4_3,IMG_4_4,IMG_5_0,IMG_5_1,IMG_5_2,IMG_5_3,IMG_5_4,SEL_3,SEL_4,VIEW_COUNT,VIEW_COUNT_2,VIEW_COUNT_3,VIEW_COUNT_4,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_MCMS_ID!|!ADFRAME_CHANNEL!|!AREA!|!CATEGORY!|!RANK_NO!|!PAGE_COUNT!|!P_STATUS!|!P_DATE!|!IS_ARCHIVE!|!A_NAME!|!A_EMAIL!|!SEL!|!SEL_2!|!HEADLINE!|!ITEM_1_1!|!ITEM_1_2!|!ITEM_1_3!|!ITEM_1_4!|!ITEM_2_1!|!ITEM_2_2!|!ITEM_2_3!|!ITEM_2_4!|!ITEM_3_1!|!ITEM_3_2!|!ITEM_3_3!|!ITEM_3_4!|!IMG_0_0!|!IMG_0_1!|!IMG_0_2!|!IMG_0_3!|!IMG_0_4!|!IMG_1_0!|!IMG_1_1!|!IMG_1_2!|!IMG_1_3!|!IMG_1_4!|!IMG_2_1!|!IMG_2_2!|!IMG_2_3!|!IMG_2_4!|!IMG_3_1!|!IMG_3_2!|!IMG_3_3!|!IMG_3_4!|!TEXT_0!|!TEXT_1_1!|!TEXT_1_2!|!TEXT_1_3!|!TEXT_1_4!|!TEXT_2_1!|!TEXT_2_2!|!TEXT_2_3!|!TEXT_2_4!|!TEXT_3_1!|!TEXT_3_2!|!TEXT_3_3!|!TEXT_3_4!|!PARENT_RANK_NO!|!VIDEO_1_1!|!PIC_VIDEO_1_1!|!ITEM_1_5!|!VIDEO_1_2!|!PIC_VIDEO_1_2!|!ITEM_1_6!|!SAISON!|!ETIKETT!|!ITEM_2_5!|!ITEM_2_6!|!ITEM_2_7!|!ITEM_2_8!|!ITEM_2_9!|!TEXT_4_0!|!TEXT_4_1!|!TEXT_4_2!|!TEXT_4_3!|!TEXT_4_4!|!TEXT_5_0!|!TEXT_5_1!|!TEXT_5_2!|!TEXT_5_3!|!TEXT_5_4!|!ITEM_4_0!|!ITEM_4_1!|!ITEM_4_2!|!ITEM_4_3!|!ITEM_4_4!|!ITEM_5_0!|!ITEM_5_1!|!ITEM_5_2!|!ITEM_5_3!|!ITEM_5_4!|!IMG_4_0!|!IMG_4_1!|!IMG_4_2!|!IMG_4_3!|!IMG_4_4!|!IMG_5_0!|!IMG_5_1!|!IMG_5_2!|!IMG_5_3!|!IMG_5_4!|!SEL_3!|!SEL_4!|!VIEW_COUNT!|!VIEW_COUNT_2!|!VIEW_COUNT_3!|!VIEW_COUNT_4!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_MCMS
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_MCMS_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_MCMS',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_MCMS
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_MCMS_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_MCMS','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_MCMS: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_MCMS

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_MCMS(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_MCMS(String: condition)

getErrorMessage()