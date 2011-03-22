package TeaserCmsThinDbManager;
# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);
1;
#
# TEASERTEXT-LÄNGEN:
$MAX_TEASER_LENGTH = -1;
$QUERY_THIN_CMS	= 'ADFRAME_TEASERCMS_ID,ADFRAME_CHANNEL,AREA,ADFRAME_TEASERCMSCATEGORY_ID,HEADLINE,TEASERTEXT,IMAGE_1,IMAGE_2,EXT_1,SEL_1,DIALOG,DIALOG_PARAM,IS_ARCHIVE,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),SEL_1,SEL_2,DIALOG,IS_ACTIVE';
$QUAL_THIN_CMS	= '!ADFRAME_TEASERCMS_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_TEASERCMSCATEGORY_ID!|!HEADLINE!|!TEASERTEXT!|!IMAGE_1!|!IMAGE_2!|!EXT_1!|!SEL_1!|!DIALOG!|!DIALOG_PARAM!|!IS_ARCHIVE!|!YEAR!|!MONTH!|!DAY!|!HOUR!|!MINUTE!|!SEL_1!|!SEL_2!|!DIALOG!|!IS_ACTIVE!|!CATEGORY!';
$QUERY_CMS		= 'ADFRAME_TEASERCMS_ID,ADFRAME_CHANNEL,AREA,ADFRAME_TEASERCMSCATEGORY_ID,ADFRAME_USER_ID,AUTHOR_NAME,AUTHOR_FIRSTNAME,AUTHOR_EMAIL,HEADLINE,TEASERTEXT,CONTENTTEXT_1,IMAGE_1,IMAGE_2,EXT_1,SEL_1,DIALOG,DIALOG_PARAM,IS_ARCHIVE,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),SEL_1,SEL_2,DIALOG,IS_ACTIVE';
@KEYS_CMS		= qw(ADFRAME_TEASERCMS_ID ADFRAME_CHANNEL AREA ADFRAME_TEASERCMSCATEGORY_ID ADFRAME_USER_ID AUTHOR_NAME AUTHOR_FIRSTNAME AUTHOR_EMAIL HEADLINE TEASERTEXT CONTENTTEXT_1 IMAGE_1 IMAGE_2 EXT_1 SEL_1 DIALOG DIALOG_PARAM IS_ARCHIVE YEAR MONTH DAY HOUR MINUTE SEL_1 SEL_2 DIALOG IS_ACTIVE);

sub setTeaserTextLength
{
	my $this					= shift;
	my $teaserTextLength		= shift;
	$MAX_TEASER_LENGTH			= $teaserTextLength;
}


# CMS
sub getCmsById
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_TEASERCMS_ID	= shift;
	my %dataHash				= ();	
	my @data					= ();
	if ($ADFRAME_TEASERCMS_ID<1)
	{
		$ADFRAME_TEASERCMS_ID = $this->get('ADFRAME_TEASERCMS','ADFRAME_TEASERCMS_ID',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and IS_ARCHIVE=0 order by CR_DATE desc limit 0,1");
	}
	if ($ADFRAME_TEASERCMS_ID>0)
	{
		my $condition = "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID";
		@data = split(/\|/,$this->get('ADFRAME_TEASERCMS',$QUERY_CMS,$condition));
	}
	for (my $i=0;$i<=$#KEYS_CMS;$i++)
	{
		$dataHash{"$KEYS_CMS[$i]"} = $data[$i];
	}
	$dataHash{'MONTH'} = $this->extendNum2($dataHash{'MONTH'});
	$dataHash{'DAY'} = $this->extendNum2($dataHash{'DAY'});
	$dataHash{'MINUTE'} = $this->extendNum2($dataHash{'MINUTE'});
	$dataHash{'HOUR'} = $this->extendNum2($dataHash{'HOUR'});
	if ($dataHash{ADFRAME_TEASERCMSCATEGORY_ID} > 0)
	{
		$dataHash{'CATEGORY'} = $this->get('ADFRAME_TEASERCMSCATEGORY','CATEGORY',"ADFRAME_TEASERCMSCATEGORY_ID=$dataHash{ADFRAME_TEASERCMSCATEGORY_ID}");
	}
	return %dataHash;
}
sub getCmsByCategory
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA				= shift;
	my $CATEGORY			= shift;	
	my $start				= shift;
	my $limit				= shift;
	my $ranksort			= shift;
	my $extracondition		= shift;
	my @theCms				= ();
	my @cms					= ();
	my @ADFRAME_TEASERCMSCATEGORY_IDS = $this->get('ADFRAME_TEASERCMSCATEGORY','ADFRAME_TEASERCMSCATEGORY_ID',"CATEGORY like '$CATEGORY%'");
	my $condition = "";

	for (my $i=0; $i<=$#ADFRAME_TEASERCMSCATEGORY_IDS;$i++)
	{
		if ($extracondition ne '')
		{
			$condition.="$extracondition and ";
		}
		$condition.="ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and IS_ARCHIVE=0 and ADFRAME_TEASERCMSCATEGORY_ID=$ADFRAME_TEASERCMSCATEGORY_IDS[$i] or ";
		
	}
	chop($condition);chop($condition);chop($condition);chop($condition);
	if ($condition eq '')
	{
		if ($extracondition ne '')
		{
			$condition.="$extracondition and ";
		}	
		$condition.="ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and IS_ARCHIVE=0";	
	}
	
	if ($ranksort eq 'true')
	{
		$condition .= " order by RANK_NO desc,CR_DATE desc limit $start,$limit";
	}
	else
	{
		$condition .= " order by CR_DATE desc limit $start,$limit";
	}	
	@theCms 		= $this->get('ADFRAME_TEASERCMS',$QUERY_THIN_CMS,$condition); 
	if ($MAX_TEASER_LENGTH <0)
	{
		return ($QUAL_THIN_CMS,\@theCms); 
	}
	else
	{
		my @help		= ();
		my $val			= '';	
		for (my $i=0;$i<=$#theCms; $i++)
		{
			@help	 = split(/\|/,$theCms[$i]);
			# teaser:
			$help[5] = substr($help[5],0,$MAX_TEASER_LENGTH);
				
			$val = '';
			for (my $h=0;$h<=$#help;$h++)
			{
				$val.="$help[$h]|";
			}
			chop($val);
			push(@cms,$val);
		}
	}
	return ($QUAL_THIN_CMS,\@cms);
}
sub getItemCount
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $count = $this->get('ADFRAME_TEASERCMS','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA'");
	return $count;
}
sub extendNum2
{
	my $this	= shift;
	my $num 	= shift;
	my $ret 	= '';
	if (length($num) < 1)
	{
		$ret = '00';
	}
	elsif (length ($num) <2)
	{
		$ret = '0'."$num";
	}
	else
	{
		$ret = "$num";
	}
	return $ret;
}