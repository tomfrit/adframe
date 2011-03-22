package SingleCmsDbManager;
# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);
1;
$QUERY_CMS		=   'ADFRAME_SINGLECMS_AREA,ADFRAME_CHANNEL,HEADLINE,TEASERTEXT,CONTENTTEXT_1,CONTENTTEXT_2,CONTENTTEXT_3,IMAGE_1,IMAGE_2,IMAGE_3,IMAGE_4,EXT_1,EXT_2,EXT_3,EXT_4,SEL_1,SEL_2,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
@KEYS_CMS		= qw(ADFRAME_SINGLECMS_AREA ADFRAME_CHANNEL HEADLINE TEASERTEXT CONTENTTEXT_1 CONTENTTEXT_2 CONTENTTEXT_3 IMAGE_1 IMAGE_2 IMAGE_3 IMAGE_4 EXT_1 EXT_2 EXT_3 EXT_4 SEL_1 SEL_2 YEAR MONTH DAY HOUR MINUTE IS_ACTIVE);

$STANDARD_ERROR_MESSAGE = 'Der Datensatz konnte nicht gespeichert werden';
1;	

# CMS
sub saveCms
{
	my $this							= shift;
	my $ADFRAME_SINGLECMS_AREA			= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $HEADLINE						= shift;
	my $TEASERTEXT						= shift;
	my $CONTENTTEXT_1					= shift;
	my $CONTENTTEXT_2					= shift;
	my $CONTENTTEXT_3					= shift;
	my $EXT_1							= shift;
	my $EXT_2							= shift;
	my $EXT_3							= shift;
	my $EXT_4							= shift;
	my $SEL_1							= shift;
	my $SEL_2							= shift;
	my $saveArea						= '';
	my $EMPTY_IMAGE						= 'clear_dot.gif';
	$HEADLINE =~ s/\'/\\\'/g;
	$TEASERTEXT =~ s/\'/\\\'/g;
	$CONTENTTEXT_1 =~ s/\'/\\\'/g;
	$CONTENTTEXT_2 =~ s/\'/\\\'/g;
	$CONTENTTEXT_3 =~ s/\'/\\\'/g;
	$EXT_1 =~ s/\'/\\\'/g;
	$EXT_2 =~ s/\'/\\\'/g;
	$EXT_3 =~ s/\'/\\\'/g;
	$EXT_4 =~ s/\'/\\\'/g;

	
	if (($ADFRAME_CHANNEL ne '') && ($ADFRAME_SINGLECMS_AREA ne ''))
	{
		$saveArea = $this->get('ADFRAME_SINGLECMS','ADFRAME_SINGLECMS_AREA',"ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
		
		if ($saveArea eq '')
		{
			$this->insert('ADFRAME_SINGLECMS','ADFRAME_SINGLECMS_AREA,ADFRAME_CHANNEL,IMAGE_1,IMAGE_2,IMAGE_3,IMAGE_4,IS_ACTIVE',"'$ADFRAME_SINGLECMS_AREA'","'$ADFRAME_CHANNEL'","'$EMPTY_IMAGE'","'$EMPTY_IMAGE'","'$EMPTY_IMAGE'","'$EMPTY_IMAGE'","1");
		}
		$saveArea = $this->get('ADFRAME_SINGLECMS','ADFRAME_SINGLECMS_AREA',"ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");

		if ($saveArea ne '')
		{
			$this->update('ADFRAME_SINGLECMS',"HEADLINE='$HEADLINE'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"TEASERTEXT='$TEASERTEXT'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"CONTENTTEXT_1='$CONTENTTEXT_1'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"CONTENTTEXT_2='$CONTENTTEXT_2'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"CONTENTTEXT_3='$CONTENTTEXT_3'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"EXT_1='$EXT_1'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"EXT_2='$EXT_2'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"EXT_3='$EXT_3'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"EXT_4='$EXT_4'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"SEL_1='$SEL_1'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
			$this->update('ADFRAME_SINGLECMS',"SEL_2='$SEL_2'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
		}
		else
		{
			$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
		}		
	}
	else
	{
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
	}
	return $saveArea;
}
sub updateItem
{
	my $this						= shift;
	my $ADFRAME_SINGLECMS_AREA		= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $KEY							= shift;
	my $VALUE						= shift;

	if (($ADFRAME_CHANNEL ne '') && ($ADFRAME_SINGLECMS_AREA ne ''))
	{
	
		my $test = $this->get('ADFRAME_SINGLECMS','ADFRAME_SINGLECMS_AREA',"ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'");
		if (($test ne '') && ($this->update('ADFRAME_SINGLECMS',"$KEY='$VALUE'","ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'")))
		{
			return 1;
		}
		else
		{
			$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
			return 0;
		}
	}
	else
	{
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
		return 0;
	}
}

sub getCms
{
	my $this						= shift;
	my $ADFRAME_SINGLECMS_AREA		= shift;
	my $ADFRAME_CHANNEL				= shift;
	my @data						= ();
	if (($ADFRAME_CHANNEL ne '') && ($ADFRAME_SINGLECMS_AREA ne ''))
	{
		@data = split(/\|/,$this->get('ADFRAME_SINGLECMS',$QUERY_CMS,"ADFRAME_SINGLECMS_AREA='$ADFRAME_SINGLECMS_AREA' and ADFRAME_CHANNEL='$ADFRAME_CHANNEL'"));
	}
	my %dataHash					= ();	
	for (my $i=0;$i<=$#KEYS_CMS;$i++)
	{
		$dataHash{"$KEYS_CMS[$i]"} = $data[$i];
	}
	$dataHash{'MONTH'} = $this->extendNum2($dataHash{'MONTH'});
	$dataHash{'DAY'} = $this->extendNum2($dataHash{'DAY'});
	$dataHash{'MINUTE'} = $this->extendNum2($dataHash{'MINUTE'});
	$dataHash{'HOUR'} = $this->extendNum2($dataHash{'HOUR'});
	return %dataHash;
}

sub getErrorMessage
{
	my $this						= shift;
	return $this->{errormessage};
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