package DatesDbManager;
# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);
1;

$QUERY_DATESCATEGORY	= 'ADFRAME_DATESCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),IS_ACTIVE';
$QUAL_DATESCATEGORY		= '!ADFRAME_DATESCATEGORY_ID!|!ADFRAME_CHANNEL!|!AREA!|!CATEGORY!|!YEAR!|!MONTH!|!DAY!|!IS_ACTIVE!';
@KEYS_DATESCATEGORY		= qw(ADFRAME_DATESCATEGORY_ID ADFRAME_CHANNEL AREA CATEGORY YEAR MONTH DAY IS_ACTIVE);

$INSERT_DATES	= 'ADFRAME_DATES_ID,ADFRAME_CHANNEL,AREA,ADFRAME_DATESCATEGORY_ID,START_DATE,END_DATE,START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,CR_DATE,IS_ACTIVE';
$QUERY_DATES	= 'ADFRAME_DATES_ID,ADFRAME_CHANNEL,AREA,ADFRAME_DATESCATEGORY_ID,year(START_DATE),month(START_DATE),dayofmonth(START_DATE),year(END_DATE),month(END_DATE),dayofmonth(END_DATE),START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,CR_DATE,IS_ACTIVE';
$QUAL_DATES		= '!ADFRAME_DATES_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_DATESCATEGORY_ID!|!START_YEAR!|!START_MONTH!|!START_DAY!|!END_YEAR!|!END_MONTH!|!END_DAY!|!START_TIME!|!EVENT!|!LOCATION!|!CONTACT_PERSON!|!STREET!|!ZIPCODE!|!CITY!|!COUNTRY!|!FON!|!FAX!|!URL!|!EMAIL!|!PRICE!|!DESCR!|!TEASERTEXT!|!IMAGE_1!|!IMAGE_2!|!CR_DATE!|!IS_ACTIVE!|!CATEGORY!';
@KEYS_DATES		= qw(ADFRAME_DATES_ID ADFRAME_CHANNEL AREA ADFRAME_DATESCATEGORY_ID START_YEAR START_MONTH START_DAY END_YEAR END_MONTH END_DAY START_TIME EVENT LOCATION CONTACT_PERSON STREET ZIPCODE CITY COUNTRY FON FAX URL EMAIL PRICE DESCR TEASERTEXT IMAGE_1 IMAGE_2 CR_DATE IS_ACTIVE);

$STANDARD_ERROR_MESSAGE = 'Der Datensatz konnte nicht gespeichert werden';
	
# CATEGORY:
sub saveCategory
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATESCATEGORY_ID	= shift;
	my $CATEGORY					= shift;
	$CATEGORY =~ s/\'/\\\'/g;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($CATEGORY ne ''))
	{
		if ($ADFRAME_DATESCATEGORY_ID<1)
		{
			my $testCat = $this->get('ADFRAME_DATESCATEGORY','CATEGORY',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and CATEGORY='$CATEGORY'");
			if ($testCat ne $CATEGORY)
			{
				my @values	= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","'$CATEGORY'","now()","1");
				$ADFRAME_DATESCATEGORY_ID = $this->insert('ADFRAME_DATESCATEGORY','ADFRAME_DATESCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,CR_DATE,IS_ACTIVE',@values);
			}
			else
			{
				$ADFRAME_DATESCATEGORY_ID = 0;
				$this->{errormessage} = 'Diese Kategorie existiert bereits';
			}
		}
		else
		{
			$this->update('ADFRAME_DATESCATEGORY',"CATEGORY='$CATEGORY'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_DATESCATEGORY_ID=$ADFRAME_DATESCATEGORY_ID");
		}
	}
	else
	{
		$ADFRAME_DATESCATEGORY_ID	= 0;
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
	}
	return $ADFRAME_DATESCATEGORY_ID;
}
sub deleteCategory
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATESCATEGORY_ID	= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_DATESCATEGORY_ID >0))
	{
		my ($dummy,$testDatesRef) = $this->getActiveDatesWithCategoryId($ADFRAME_CHANNEL,$AREA,$ADFRAME_DATESCATEGORY_ID);
		if (@{ $testDatesRef} == ())
		{
			if ($this->delete('ADFRAME_DATESCATEGORY',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATESCATEGORY_ID=$ADFRAME_DATESCATEGORY_ID"))
			{
				return 1;
			}
			else
			{
				$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
			}
		}
		else
		{	
			$this->{errormessage} = 'Es existieren noch Termin-Einträge mit dieser Kategorie!\nBitte zuerst löschen';
		}
	}
	return 0;
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

sub getCategoryIdByName
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $CATEGORY					= shift;
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and CATEGORY='$CATEGORY'";
	my $ADFRAME_DATESCATEGORY_ID	= $this->get('ADFRAME_DATESCATEGORY','ADFRAME_DATESCATEGORY_ID',$condition);
	return $ADFRAME_DATESCATEGORY_ID;
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
	return ($QUAL_DATESCATEGORY,\@categories);
}

# DATES
sub saveDate
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATES_ID			= shift;
	my $ADFRAME_DATESCATEGORY_ID	= shift;
	my $START_DATE					= shift;
	my $END_DATE					= shift;
	my $START_TIME					= shift;
	my $EVENT						= shift;
	my $LOCATION					= shift;
	my $CONTACT_PERSON				= shift;
	my $STREET						= shift;
	my $ZIPCODE						= shift;
	my $CITY						= shift;
	my $COUNTRY						= shift;
	my $FON							= shift;
	my $FAX							= shift;
	my $URL							= shift;
	my $EMAIL						= shift;
	my $PRICE						= shift;
	my $DESCR						= shift;
	my $TEASERTEXT					= shift;
	my $IMAGE_1						= shift;
	my $IMAGE_2						= shift;
	my $EMPTY_IMAGE					= 'clear_dot.gif';
	
	$ADFRAME_DATESCATEGORY_ID = 0 if ($ADFRAME_DATESCATEGORY_ID eq '');
	$EVENT =~ s/\'/\\\'/g;
	$LOCATION =~ s/\'/\\\'/g;
	$CONTACT_PERSON =~ s/\'/\\\'/g;
	$STREET =~ s/\'/\\\'/g;
	$CITY =~ s/\'/\\\'/g;
	$PRICE =~ s/\'/\\\'/g;
	$DESCR =~ s/\'/\\\'/g;
	$TEASERTEXT =~ s/\'/\\\'/g;
	
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_DATESCATEGORY_ID ne ''))
	{
		if ($ADFRAME_DATES_ID<1)
		{
			my @values	= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","$ADFRAME_DATESCATEGORY_ID","'$START_DATE'","'$END_DATE'","'$START_TIME'","'$EVENT'","'$LOCATION'","'$CONTACT_PERSON'","'$STREET'","'$ZIPCODE'","'$CITY'","'$COUNTRY'","'$FON'","'$FAX'","'$URL'","'$EMAIL'","'$PRICE'","'$DESCR'","'$TEASERTEXT'","'$EMPTY_IMAGE'","'$EMPTY_IMAGE'","now()","1");
			$ADFRAME_DATES_ID = $this->insert('ADFRAME_DATES',$INSERT_DATES,@values);
			if ($ADFRAME_DATES_ID == 0)
			{
				$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
			}
		}
		else
		{
			$this->update('ADFRAME_DATES',"ADFRAME_DATESCATEGORY_ID=$ADFRAME_DATESCATEGORY_ID","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID") if ($ADFRAME_DATESCATEGORY_ID >0 );
			$this->update('ADFRAME_DATES',"START_DATE='$START_DATE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"END_DATE='$END_DATE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"START_TIME='$START_TIME'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"EVENT='$EVENT'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"LOCATION='$LOCATION'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"CONTACT_PERSON='$CONTACT_PERSON'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"STREET='$STREET'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"ZIPCODE='$ZIPCODE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"CITY='$CITY'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"COUNTRY='$COUNTRY'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"FON='$FON'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"FAX='$FAX'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"URL='$URL'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"EMAIL='$EMAIL'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"PRICE='$PRICE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"DESCR='$DESCR'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
			$this->update('ADFRAME_DATES',"TEASERTEXT='$TEASERTEXT'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID");
		}
	}
	else
	{
		$ADFRAME_DATES_ID	= 0;
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
	}
	return $ADFRAME_DATES_ID;
}
sub updateItem
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATES_ID			= shift;
	my $KEY							= shift;
	my $VALUE						= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_DATES_ID > 0) && ($KEY ne '') && ($VALUE ne ''))
	{
		if ($this->update('ADFRAME_DATES',"$KEY='$VALUE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID"))
		{
			return 1;
		}
	}
	else
	{
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
		return 0;
	}
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
sub getDates
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $start						= shift;
	my $limit						= shift;
	my $extraCondition				= shift;
	my @dates						= ();
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' order by START_DATE desc";
	if ($extraCondition ne '')
	{
		$condition ="$extraCondition and ".$condition;
	}
	if ($start>0 && $limit>0)
	{
		$condition.=" limit $start,$limit"; 
	}

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
	my $nextYear = $YEAR+1;
	my $condition = "year(START_DATE)<=$YEAR and year(END_DATE)>=$YEAR and IS_ACTIVE=1";
	if ($MONTH ne '')
	{
		$condition.= " and month(START_DATE)<=$MONTH and month(END_DATE)>=$MONTH";
	}
	return $this->getDates($ADFRAME_CHANNEL,$AREA,0,0,$condition);
}
sub getDatesWithCategoryId
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATESCATEGORY_ID	= shift;
	return $this->getDates($ADFRAME_CHANNEL,$AREA,0,0,"ADFRAME_DATESCATEGORY_ID=$ADFRAME_DATESCATEGORY_ID");
}
sub getActiveDatesWithCategoryId
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATESCATEGORY_ID	= shift;
	return $this->getDates($ADFRAME_CHANNEL,$AREA,0,0,"ADFRAME_DATESCATEGORY_ID=$ADFRAME_DATESCATEGORY_ID and IS_ACTIVE=1");
}

sub deleteDate
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_DATES_ID			= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_DATES_ID >0))
	{
		if ($this->delete('ADFRAME_DATES',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_DATES_ID=$ADFRAME_DATES_ID"))
		{
			return 1;
		}
		else
		{
			$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
		}
	}
	return 0;
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