package DatesThinDbManager;
# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);
1;

$QUERY_DATESCATEGORY	= 'ADFRAME_DATESCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),IS_ACTIVE';
$QUAL_DATESCATEGORY		= '!ADFRAME_DATESCATEGORY_ID!|!ADFRAME_CHANNEL!|!AREA!|!CATEGORY!|!YEAR!|!MONTH!|!DAY!|!IS_ACTIVE!';
@KEYS_DATESCATEGORY		= qw(ADFRAME_DATESCATEGORY_ID ADFRAME_CHANNEL AREA CATEGORY YEAR MONTH DAY IS_ACTIVE);

$INSERT_DATES	= 'ADFRAME_DATES_ID,ADFRAME_CHANNEL,AREA,ADFRAME_DATESCATEGORY_ID,START_DATE,END_DATE,START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,CR_DATE,IS_ACTIVE';
$QUERY_DATES	= 'ADFRAME_DATES_ID,ADFRAME_DATES.ADFRAME_CHANNEL,ADFRAME_DATES.AREA,ADFRAME_DATES.ADFRAME_DATESCATEGORY_ID,year(START_DATE),month(START_DATE),dayofmonth(START_DATE),year(END_DATE),month(END_DATE),dayofmonth(END_DATE),START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,ADFRAME_DATES.CR_DATE,ADFRAME_DATES.IS_ACTIVE';
$QUAL_DATES		= '!ADFRAME_DATES_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_DATESCATEGORY_ID!|!START_YEAR!|!START_MONTH!|!START_DAY!|!END_YEAR!|!END_MONTH!|!END_DAY!|!START_TIME!|!EVENT!|!LOCATION!|!CONTACT_PERSON!|!STREET!|!ZIPCODE!|!CITY!|!COUNTRY!|!FON!|!FAX!|!URL!|!EMAIL!|!PRICE!|!DESCR!|!TEASERTEXT!|!IMAGE_1!|!IMAGE_2!|!CR_DATE!|!IS_ACTIVE!|!CATEGORY!';
@KEYS_DATES		= qw(ADFRAME_DATES_ID ADFRAME_CHANNEL AREA ADFRAME_DATESCATEGORY_ID START_YEAR START_MONTH START_DAY END_YEAR END_MONTH END_DAY START_TIME EVENT LOCATION CONTACT_PERSON STREET ZIPCODE CITY COUNTRY FON FAX URL EMAIL PRICE DESCR TEASERTEXT IMAGE_1 IMAGE_2 CR_DATE IS_ACTIVE);

sub getDatesByPrefix {

	my $this 		= shift;
	my $ADFRAME_CHANNEL	= shift;
	my $AREA		= shift;
	my $prefix		= shift;
	my $start		= shift;
	my $limit		= shift;
	my $condition		= "ADFRAME_DATES.ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_DATES.AREA='$AREA' and END_DATE > now() order by START_DATE";	
	if ($start>0 || $limit>0)
		{
		$condition.=" limit $start,$limit"; 
		}
	my @theDates 	= $this->get("ADFRAME_DATES inner join ADFRAME_DATESCATEGORY on (ADFRAME_DATES.ADFRAME_DATESCATEGORY_ID =ADFRAME_DATESCATEGORY.ADFRAME_DATESCATEGORY_ID and ADFRAME_DATESCATEGORY.CATEGORY like '$prefix')",$QUERY_DATES,$condition); 
	my ($dummy,$categoriesRef)	= $this->getCategories($ADFRAME_CHANNEL,$AREA,0,0);
	my @help		= ();
	my %catHash		= ();
	my @dates		= ();
	foreach my $c (@{ $categoriesRef})
	{
		@help	 = split(/\|/,$c);
		$catHash{"$help[0]"} = $help[3];
	}
	
	for (my $i=0;$i<=$#theDates; $i++)
	{
		$theDates[$i] =~ s/\x0d/<br>/g;
		@help	 = split(/\|/,$theDates[$i]);
		push(@dates,$theDates[$i].'|'.$catHash{"$help[3]"});
	}
	return ($QUAL_DATES,\@dates);

}

sub getCategories
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $start						= shift;
	my $limit						= shift;
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' order by CATEGORY";
	if ($start>0 && $limit>0)
	{
		$condition.=" limit $start,$limit"; 
	}
	my @categories = $this->get('ADFRAME_DATESCATEGORY',$QUERY_DATESCATEGORY,$condition);
	my @catRet = ();
	#main::debug(@categories);
	for (my $i=0;$i<=$#categories;$i++) {
		@h	= split(/\|/,$categories[$i]);
		if ($this->get('ADFRAME_DATES','count(ADFRAME_DATES_ID)',"ADFRAME_DATESCATEGORY_ID=$h[0]") > 0) {
			push(@catRet,$categories[$i]);
		}
	
	
	}
	
	return ($QUAL_DATESCATEGORY,\@catRet);
}
sub getCategoryById
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATESCATEGORY_ID	= shift;
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_DATESCATEGORY_ID=$ADFRAME_DATESCATEGORY_ID";
	my @data 						= split(/\|/,$this->get('ADFRAME_DATESCATEGORY',$QUERY_DATESCATEGORY,$condition));
	my %dataHash					= ();	
	for (my $i=0;$i<=$#KEYS_DATESCATEGORY;$i++)
	{
		$dataHash{"$KEYS_DATESCATEGORY[$i]"} = $data[$i];
	}
	return %dataHash;
}
# DATES
sub getDates
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $start						= shift;
	my $limit						= shift;
	my $extraCondition				= shift;
	my @dates						= ();
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' order by START_DATE asc";
	if ($extraCondition ne '')
	{
		$condition ="$extraCondition and ".$condition;
	}
	if ($limit>0)
	{
		$condition.=" limit $start,$limit"; 
	}
#main::debug($condition);
	my @theDates 	= $this->get('ADFRAME_DATES',$QUERY_DATES,$condition); 
	my ($dummy,$categoriesRef)	= $this->getCategories($ADFRAME_CHANNEL,$AREA,0,0);
	my @help		= ();
	my %catHash		= ();
	foreach my $c (@{ $categoriesRef})
	{
		@help	 = split(/\|/,$c);
		$catHash{"$help[0]"} = $help[3];
	}
	
	for (my $i=0;$i<=$#theDates; $i++)
	{
		$theDates[$i] =~ s/\x0d/<br>/g;
		@help	 = split(/\|/,$theDates[$i]);
		push(@dates,$theDates[$i].'|'.$catHash{"$help[3]"});
	}
	return ($QUAL_DATES,\@dates);
}
sub getActiveDatesWithYearMonth
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $YEAR						= shift;
	my $MONTH						= shift;
	return $this->getDates($ADFRAME_CHANNEL,$AREA,0,0,"year(START_DATE)<=$YEAR and month(START_DATE)<=$MONTH and year(END_DATE)>=$YEAR and month(END_DATE)>=$MONTH and IS_ACTIVE=1");
}
sub getNextDate
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $condition = "START_DATE>=now() order by START_DATE limit 0,1";
	my $ADFRAME_DATES_ID = $this->get('ADFRAME_DATES','ADFRAME_DATES_ID',$condition);
	return $this->getDateById($ADFRAME_CHANNEL,$AREA,$ADFRAME_DATES_ID);
}
sub getDateById
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATES_ID			= shift;
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID";
	my @data 						= split(/\|/,$this->get('ADFRAME_DATES',$QUERY_DATES,$condition));
	my %dataHash					= ();	
	for (my $i=0;$i<=$#KEYS_DATES;$i++)
	{
		if (($KEYS_DATES[$i] eq 'START_MONTH')||($KEYS_DATES[$i] eq 'START_DAY')||($KEYS_DATES[$i] eq 'END_MONTH')||($KEYS_DATES[$i] eq 'END_DAY'))
		{
			$data[$i] = $this->extendNum2($data[$i]);
		}
		$dataHash{"$KEYS_DATES[$i]"} = $data[$i];
	}
	$dataHash{CATEGORY} = $this->getCategoryById($ADFRAME_CHANNEL,$AREA,$data[3]);
	return %dataHash;
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