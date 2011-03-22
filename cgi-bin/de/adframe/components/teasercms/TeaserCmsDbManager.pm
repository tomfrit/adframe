package TeaserCmsDbManager;
# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);
1;
$QUERY_CATEGORY	= 'ADFRAME_TEASERCMSCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),IS_ACTIVE';
$QUAL_CATEGORY	= '!ADFRAME_TEASERCMSCATEGORY_ID!|!ADFRAME_CHANNEL!|!AREA!|!CATEGORY!|!YEAR!|!MONTH!|!DAY!|!IS_ACTIVE!';
@KEYS_CATEGORY	= qw(ADFRAME_TEASERCMSCATEGORY_ID ADFRAME_CHANNEL AREA CATEGORY YEAR MONTH DAY IS_ACTIVE);

$INSERT_CMS		= 'ADFRAME_TEASERCMS_ID,ADFRAME_CHANNEL,AREA,ADFRAME_TEASERCMSCATEGORY_ID,ADFRAME_USER_ID,AUTHOR_NAME,AUTHOR_FIRSTNAME,AUTHOR_EMAIL,HEADLINE,TEASERTEXT,CONTENTTEXT_1,CONTENTTEXT_2,CONTENTTEXT_3,IMAGE_1,IMAGE_2,IMAGE_3,IMAGE_4,EXT_1,EXT_2,EXT_3,EXT_4,SEL_1,SEL_2,DIALOG,DIALOG_PARAM,RANK_NO,IS_ARCHIVE,CR_DATE,IS_ACTIVE';
$QUERY_CMS		= 'ADFRAME_TEASERCMS_ID,ADFRAME_CHANNEL,AREA,ADFRAME_TEASERCMSCATEGORY_ID,ADFRAME_USER_ID,AUTHOR_NAME,AUTHOR_FIRSTNAME,AUTHOR_EMAIL,HEADLINE,TEASERTEXT,CONTENTTEXT_1,CONTENTTEXT_2,CONTENTTEXT_3,IMAGE_1,IMAGE_2,IMAGE_3,IMAGE_4,EXT_1,EXT_2,EXT_3,EXT_4,SEL_1,SEL_2,DIALOG,DIALOG_PARAM,RANK_NO,IS_ARCHIVE,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL_CMS		= '!ADFRAME_TEASERCMS_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_TEASERCMSCATEGORY_ID!|!ADFRAME_USER_ID!|!AUTHOR_NAME!|!AUTHOR_FIRSTNAME!|!AUTHOR_EMAIL!|!HEADLINE!|!TEASERTEXT!|!CONTENTTEXT_1!|!CONTENTTEXT_2!|!CONTENTTEXT_3!|!IMAGE_1!|!IMAGE_2!|!IMAGE_3!|!IMAGE_4!|!EXT_1!|!EXT_2!|!EXT_3!|!EXT_4!|!SEL_1!|!SEL_2!|!DIALOG!|!DIALOG_PARAM!|!RANK_NO!|!IS_ARCHIVE!|!YEAR!|!MONTH!|!DAY!|!HOUR!|!MINUTE!|!IS_ACTIVE!|!CATEGORY!';
@KEYS_CMS		= qw(ADFRAME_TEASERCMS_ID ADFRAME_CHANNEL AREA ADFRAME_TEASERCMSCATEGORY_ID ADFRAME_USER_ID AUTHOR_NAME AUTHOR_FIRSTNAME AUTHOR_EMAIL HEADLINE TEASERTEXT CONTENTTEXT_1 CONTENTTEXT_2 CONTENTTEXT_3 IMAGE_1 IMAGE_2 IMAGE_3 IMAGE_4 EXT_1 EXT_2 EXT_3 EXT_4 SEL_1 SEL_2 DIALOG DIALOG_PARAM RANK_NO IS_ARCHIVE YEAR MONTH DAY HOUR MINUTE IS_ACTIVE);

$STANDARD_ERROR_MESSAGE = 'Der Datensatz konnte nicht gespeichert werden';
	
# CATEGORY:
sub saveCategory
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMSCATEGORY_ID	= shift;
	my $CATEGORY						= shift;
	$CATEGORY =~ s/\'/\\\'/g;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($CATEGORY ne ''))
	{
		if ($ADFRAME_TEASERCMSCATEGORY_ID<1)
		{
			my $testCat = $this->get('ADFRAME_TEASERCMSCATEGORY','CATEGORY',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and CATEGORY='$CATEGORY'");
			if ($testCat ne $CATEGORY)
			{
				my @values	= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","'$CATEGORY'","now()","1");
				$ADFRAME_TEASERCMSCATEGORY_ID = $this->insert('ADFRAME_TEASERCMSCATEGORY','ADFRAME_TEASERCMSCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,CR_DATE,IS_ACTIVE',@values);
			}
			else
			{
				$ADFRAME_TEASERCMSCATEGORY_ID = 0;
				$this->{errormessage} = 'Diese Kategorie existiert bereits';
			}
		}
		else
		{
			$this->update('ADFRAME_TEASERCMSCATEGORY',"CATEGORY='$CATEGORY'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_TEASERCMSCATEGORY_ID=$ADFRAME_TEASERCMSCATEGORY_ID");
		}
	}
	else
	{
		$ADFRAME_TEASERCMSCATEGORY_ID	= 0;
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
	}
	return $ADFRAME_TEASERCMSCATEGORY_ID;
}
sub deleteCategory
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMSCATEGORY_ID	= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_TEASERCMSCATEGORY_ID >0))
	{
		my ($dummy,$testCmsRef) = $this->getActiveCmsWithCategoryId($ADFRAME_CHANNEL,$AREA,$ADFRAME_TEASERCMSCATEGORY_ID);

		if (@{ $testCmsRef} == ())
		{
			if ($this->delete('ADFRAME_TEASERCMSCATEGORY',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMSCATEGORY_ID=$ADFRAME_TEASERCMSCATEGORY_ID"))
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
			$this->{errormessage} = 'Es existieren noch Einträge mit dieser Kategorie!\nBitte zuerst löschen';
		}
	}
	return 0;
}
sub getCategoryById
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMSCATEGORY_ID	= shift;
	my $condition						= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_TEASERCMSCATEGORY_ID=$ADFRAME_TEASERCMSCATEGORY_ID";
	my @data 							= split(/\|/,$this->get('ADFRAME_TEASERCMSCATEGORY',$QUERY_CATEGORY,$condition));
	my %dataHash						= ();	
	for (my $i=0;$i<=$#KEYS_CATEGORY;$i++)
	{
		$dataHash{"$KEYS_CATEGORY[$i]"} = $data[$i];
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
	my $ADFRAME_TEASERCMSCATEGORY_ID	= $this->get('ADFRAME_TEASERCMSCATEGORY','ADFRAME_TEASERCMSCATEGORY_ID',$condition);
	return $ADFRAME_TEASERCMSCATEGORY_ID;
}

sub getCategories
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $start							= shift;
	my $limit							= shift;
	my $condition						= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' order by CATEGORY";
	if ($start>0 && $limit>0)
	{
		$condition.=" limit $start,$limit"; 
	}
	my @categories = $this->get('ADFRAME_TEASERCMSCATEGORY',$QUERY_CATEGORY,$condition); 
	#main::debug(@categories,$condition);
	return ($QUAL_CATEGORY,\@categories);
}

# CMS
sub saveCms
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMS_ID			= shift;
	my $ADFRAME_TEASERCMSCATEGORY_ID	= shift;
	my $ADFRAME_USER_ID					= shift;
	my $AUTHOR_NAME						= shift;
	my $AUTHOR_FIRSTNAME				= shift;
	my $AUTHOR_EMAIL					= shift;
	my $HEADLINE						= shift;
	my $TEASERTEXT						= shift;
	my $CONTENTTEXT_1					= shift;
	my $CONTENTTEXT_2					= shift;
	my $CONTENTTEXT_3					= shift;
	my $IMAGE_1							= shift;
	my $IMAGE_2							= shift;
	my $IMAGE_3							= shift;
	my $IMAGE_4							= shift;
	my $EXT_1							= shift;
	my $EXT_2							= shift;
	my $EXT_3							= shift;
	my $EXT_4							= shift;
	my $SEL_1							= shift;
	my $SEL_2							= shift;
	my $DIALOG							= shift;
	my $DIALOG_PARAM					= shift;
	my $EMPTY_IMAGE					= 'clear_dot.gif';
	
	$ADFRAME_TEASERCMSCATEGORY_ID = 0 if ($ADFRAME_TEASERCMSCATEGORY_ID eq '');
	$AUTHOR_NAME =~ s/\'/\\\'/g;
	$AUTHOR_FIRSTNAME =~ s/\'/\\\'/g;
	$HEADLINE =~ s/\'/\\\'/g;
	$TEASERTEXT =~ s/\'/\\\'/g;
	$CONTENTTEXT_1 =~ s/\'/\\\'/g;
	$CONTENTTEXT_2 =~ s/\'/\\\'/g;
	$CONTENTTEXT_3 =~ s/\'/\\\'/g;
	$EXT_1 =~ s/\'/\\\'/g;
	$EXT_2 =~ s/\'/\\\'/g;
	$EXT_3 =~ s/\'/\\\'/g;
	$EXT_4 =~ s/\'/\\\'/g;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_TEASERCMSCATEGORY_ID ne ''))
	{
		if ($ADFRAME_TEASERCMS_ID<1)
		{
			my $new_rank	= $this->getLastRankNo($ADFRAME_CHANNEL,$AREA,$ADFRAME_TEASERCMSCATEGORY_ID);
			if ($new_rank==-1)
			{
				$new_rank+=2;
			}
			else
			{
				$new_rank+=1;
			}
			
			my @values	= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","$ADFRAME_TEASERCMSCATEGORY_ID","$ADFRAME_USER_ID","'$AUTHOR_NAME'","'$AUTHOR_FIRSTNAME'","'$AUTHOR_EMAIL'","'$HEADLINE'","'$TEASERTEXT'","'$CONTENTTEXT_1'","'$CONTENTTEXT_2'","'$CONTENTTEXT_3'","'$EMPTY_IMAGE'","'$EMPTY_IMAGE'","'$EMPTY_IMAGE'","'$EMPTY_IMAGE'","'$EXT_1'","'$EXT_2'","'$EXT_3'","'$EXT_4'","'$SEL_1'","'$SEL_2'","'$DIALOG'","'$DIALOG_PARAM'","$new_rank","0","now()","1");
			$ADFRAME_TEASERCMS_ID = $this->insert('ADFRAME_TEASERCMS',$INSERT_CMS,@values);
			if ($ADFRAME_TEASERCMS_ID == 0)
			{
				$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
			}
		}
		else
		{
			$this->update('ADFRAME_TEASERCMS',"ADFRAME_TEASERCMSCATEGORY_ID=$ADFRAME_TEASERCMSCATEGORY_ID","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID") if ($ADFRAME_TEASERCMSCATEGORY_ID >0 );
			$this->update('ADFRAME_TEASERCMS',"ADFRAME_USER_ID=$ADFRAME_USER_ID","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID") if ($ADFRAME_USER_ID>0);
			$this->update('ADFRAME_TEASERCMS',"AUTHOR_NAME='$AUTHOR_NAME'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID") if ($AUTHOR_NAME ne '');
			$this->update('ADFRAME_TEASERCMS',"AUTHOR_FIRSTNAME='$AUTHOR_FIRSTNAME'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID") if ($AUTHOR_FIRSTNAME ne '');
			$this->update('ADFRAME_TEASERCMS',"AUTHOR_EMAIL='$AUTHOR_EMAIL'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID") if ($AUTHOR_EMAIL ne '');
			$this->update('ADFRAME_TEASERCMS',"HEADLINE='$HEADLINE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"TEASERTEXT='$TEASERTEXT'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"CONTENTTEXT_1='$CONTENTTEXT_1'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"CONTENTTEXT_2='$CONTENTTEXT_2'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"CONTENTTEXT_3='$CONTENTTEXT_3'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"EXT_1='$EXT_1'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"EXT_2='$EXT_2'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"EXT_3='$EXT_3'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"EXT_4='$EXT_4'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"SEL_1='$SEL_1'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"SEL_2='$SEL_2'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"DIALOG='$DIALOG'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
			$this->update('ADFRAME_TEASERCMS',"DIALOG_PARAM='$DIALOG_PARAM'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
		}
	}
	else
	{
		$ADFRAME_TEASERCMS_ID	= 0;
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
	}
	return $ADFRAME_TEASERCMS_ID;
}
sub updateItem
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_TEASERCMS_ID		= shift;
	my $KEY							= shift;
	my $VALUE						= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_TEASERCMS_ID > 0) && ($KEY ne '') && ($VALUE ne ''))
	{
		if ($this->update('ADFRAME_TEASERCMS',"$KEY='$VALUE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID"))
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

sub getCmsById
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $ADFRAME_TEASERCMS_ID		= shift;
	my @data						= ();
	if ($ADFRAME_TEASERCMS_ID<1)
	{
		# get the last entity
		$ADFRAME_TEASERCMS_ID = $this->get('ADFRAME_TEASERCMS','ADFRAME_TEASERCMS_ID',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and IS_ARCHIVE=0 order by CR_DATE desc limit 0,1");
	}
	if ($ADFRAME_TEASERCMS_ID>0)
	{	
		my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID";
		@data = split(/\|/,$this->get('ADFRAME_TEASERCMS',$QUERY_CMS,$condition));
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
	if ($dataHash{ADFRAME_TEASERCMSCATEGORY_ID} > 0)
	{
		$dataHash{'CATEGORY'} = $this->get('ADFRAME_TEASERCMSCATEGORY','CATEGORY',"ADFRAME_TEASERCMSCATEGORY_ID=$dataHash{ADFRAME_TEASERCMSCATEGORY_ID}");
	}
	return %dataHash;
}
sub getCms
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $start						= shift;
	my $limit						= shift;
	my $extraCondition				= shift;
	my @cms							= ();
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA'";
	if ($extraCondition ne '')
	{
		$condition = $condition.' '.$extraCondition;
	}
	if ($start>=0 && $limit>0)
	{
		$condition.=" limit $start,$limit"; 
	}

	my @theCms 	= $this->get('ADFRAME_TEASERCMS',$QUERY_CMS,$condition); 
	my ($dummy,$categoriesRef)	= $this->getCategories($ADFRAME_CHANNEL,$AREA,0,0);
	my @help		= ();
	my %catHash		= ();
	my $val			= '';
	
	foreach my $c (@{ $categoriesRef})
	{
		@help	 = split(/\|/,$c);
		$catHash{"$help[0]"} = $help[3];
	}
	
	for (my $i=0;$i<=$#theCms; $i++)
	{
		@help	 = split(/\|/,$theCms[$i]);
		
		# date:
		$help[26] = $this->extendNum2($help[26]);
		$help[27] = $this->extendNum2($help[27]);
		$help[28] = $this->extendNum2($help[28]);
		$help[29] = $this->extendNum2($help[29]);
		
		$val = '';
		for (my $h=0;$h<=$#help;$h++)
		{
			$val.="$help[$h]|";
		}
		chop($val);
		push(@cms,$val.'|'.$catHash{"$help[3]"});
	}
	return ($QUAL_CMS,\@cms);
}
sub getItemCount
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $count = $this->get('ADFRAME_TEASERCMS','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA'");
	return $count;
}
sub getCmsBySort
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $start						= shift;
	my $limit						= shift;
	my $sortcol						= shift;
	my $condition					= '';
	   $condition = "order by $sortcol" if ($sortcol ne '');
	#   main::debug($condition);
	return $this->getCms($ADFRAME_CHANNEL,$AREA,$start,$limit,$condition);
}
sub getCmsWithCategoryId
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMSCATEGORY_ID	= shift;
	return $this->getCms($ADFRAME_CHANNEL,$AREA,0,0,"and ADFRAME_TEASERCMSCATEGORY_ID=$ADFRAME_TEASERCMSCATEGORY_ID");
}
sub getActiveCmsWithCategoryId
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMSCATEGORY_ID	= shift;
	return $this->getCms($ADFRAME_CHANNEL,$AREA,0,0,"and ADFRAME_TEASERCMSCATEGORY_ID=$ADFRAME_TEASERCMSCATEGORY_ID and IS_ACTIVE=1");
}

sub deleteCms
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMS_ID			= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_TEASERCMS_ID >0))
	{
		if ($this->delete('ADFRAME_TEASERCMS',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID"))
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
sub getLastRankNo
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my @rankno		= $this->getRankAllNo($ADFRAME_CHANNEL,$AREA);
	my @lastrank	= split(/\|/,$rankno[$#rankno]);
	my $new_rank	= $lastrank[2];	
	if ($new_rank eq '')
	{
		$new_rank = -1;
	}
	return $new_rank;
	
}
sub getRankAllNo
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my @rankno	= $this->get('ADFRAME_TEASERCMS','ADFRAME_TEASERCMS_ID,ADFRAME_TEASERCMSCATEGORY_ID,RANK_NO',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' order by RANK_NO");
	return @rankno;
}
sub getRankNo
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMS_ID			= shift;
	return $this->get('ADFRAME_TEASERCMS','RANK_NO',"ADFRAME_TEASERCMS_ID=$ADFRAME_TEASERCMS_ID");
}
sub rankUp
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMS_ID			= shift;
	return $this->toggleRank($ADFRAME_CHANNEL,$AREA,$ADFRAME_TEASERCMS_ID,'up');
}
sub rankDown
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMS_ID			= shift;
	return $this->toggleRank($ADFRAME_CHANNEL,$AREA,$ADFRAME_TEASERCMS_ID,'down');
}
sub toggleRankByIds
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $CMS_ENTITY_ID_A					= shift;
	my $CMS_ENTITY_ID_B					= shift;
	my $ok								= 0;
	if (($CMS_ENTITY_ID_A>0) && ($CMS_ENTITY_ID_B>0))
	{
		my $rank_a		= $this->getRankNo($ADFRAME_CHANNEL,$AREA,$CMS_ENTITY_ID_A);
		my $rank_b		= $this->getRankNo($ADFRAME_CHANNEL,$AREA,$CMS_ENTITY_ID_B);
		#main::debug($CMS_ENTITY_ID_A,$rank_a,$CMS_ENTITY_ID_B,$rank_b);
		if (($rank_a>0) && ($rank_b>0))
		{
			$this->update('ADFRAME_TEASERCMS',"RANK_NO=$rank_b","ADFRAME_TEASERCMS_ID=$CMS_ENTITY_ID_A");
			$this->update('ADFRAME_TEASERCMS',"RANK_NO=$rank_a","ADFRAME_TEASERCMS_ID=$CMS_ENTITY_ID_B");
			$ok=1;
		}
	}
	return $ok;
}
sub toggleRank
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_TEASERCMS_ID			= shift;
	my $direction						= shift;
	my $ok					= 0;
	my $OTHER_CMS_ENTITY_ID	= -1;
	my $foundpos			= -1;
	my $otherpos			= -1;
	my @help				= ();
	if  (($direction eq 'down') || ($direction eq 'up')) 
	{
		my @allrank		= $this->getRankAllNo($ADFRAME_CHANNEL,$AREA);

		for (my $i=0;$i<=$#allrank;$i++)
		{
			@help = split(/\|/,$allrank[$i]);
			if ($help[0] == $ADFRAME_TEASERCMS_ID)
			{
				$foundpos = $i;
				if ($direction eq 'down')
				{
					$otherpos = $i-1;
				}
				else
				{
					$otherpos = $i+1;
				}
				last;
			}
		}
		if (($foundpos>=0) && ($allrank[$otherpos] ne '') && ($otherpos>=0))
		{
		
			@help = split(/\|/, $allrank[$otherpos]);
			$OTHER_CMS_ENTITY_ID = $help[0];
			if ($OTHER_CMS_ENTITY_ID>0)
			{
				$ok = $this->toggleRankByIds($ADFRAME_CHANNEL,$AREA,$ADFRAME_TEASERCMS_ID,$OTHER_CMS_ENTITY_ID);
			}	
		}
	}
	return $ok;
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