package ForumDbManager;


#
# VERSION 2.000000000 -> neue Forum-DB! FORUM und COMMENTS zusammengelegt!
#
#


# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);
use de::adframe::lib::TextFormat;
use de::adframe::components::user::AdframeUser;
use de::adframe::lib::cut;
1;

$FORUM_COLS = 'ADFRAME_FORUM_ID,ADFRAME_CHANNEL,AREA,ADFRAME_FORUMCATEGORY_ID,ADFRAME_USER_ID,REF_ADFRAME_FORUM_ID,SUBJECT,COMMENT,URL,NAME,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,TEXT_0,IMG_0,IMG_1,IMG_2,UP_DATE,END_DATE,CR_DATE,IS_ACTIVE';
$FORUM_QUERY_COLS = 'ADFRAME_FORUM_ID,ADFRAME_CHANNEL,AREA,ADFRAME_FORUMCATEGORY_ID,ADFRAME_USER_ID,REF_ADFRAME_FORUM_ID,SUBJECT,COMMENT,URL,NAME,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,TEXT_0,IMG_0,IMG_1,IMG_2,year(UP_DATE),month(UP_DATE),dayofmonth(UP_DATE),hour(UP_DATE),minute(UP_DATE),year(END_DATE),month(END_DATE),dayofmonth(END_DATE),hour(END_DATE),minute(END_DATE),year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$FORUM_QUAL = '!ADFRAME_FORUM_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_FORUMCATEGORY_ID!|!ADFRAME_USER_ID!|!REF_ADFRAME_FORUM_ID!|!SUBJECT!|!COMMENT!|!URL!|!NAME!|!ITEM_0!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!ITEM_4!|!ITEM_5!|!ITEM_6!|!ITEM_7!|!ITEM_8!|!ITEM_9!|!ITEM_10!|!ITEM_11!|!ITEM_12!|!ITEM_13!|!ITEM_14!|!ITEM_15!|!ITEM_16!|!ITEM_17!|!ITEM_18!|!ITEM_19!|!TEXT_0!|!IMG_0!|!IMG_1!|!IMG_2!|!UP_YEAR!|!UP_MONTH!|!UP_DAY!|!UP_HOUR!|!UP_MINUTE!|!END_DATE_YEAR!|!END_DATE_MONTH!|!END_DATE_DAY!|!END_DATE_HOUR!|!END_DATE_MINUTE!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!|!COMMENT_COUNT!';
@FORUM_KEYS = qw(ADFRAME_FORUM_ID ADFRAME_CHANNEL AREA ADFRAME_FORUMCATEGORY_ID ADFRAME_USER_ID REF_ADFRAME_FORUM_ID SUBJECT COMMENT URL NAME ITEM_0 ITEM_1 ITEM_2 ITEM_3 ITEM_4 ITEM_5 ITEM_6 ITEM_7 ITEM_8 ITEM_9 ITEM_10 ITEM_11 ITEM_12 ITEM_13 ITEM_14 ITEM_15 ITEM_16 ITEM_17 ITEM_18 ITEM_19 TEXT_0 IMG_0 IMG_1 IMG_2 UP_YEAR UP_MONTH UP_DAY UP_HOUR UP_MINUTE END_DATE_YEAR END_DATE_MONTH END_DATE_DAY END_DATE_HOUR END_DATE_MINUTE CR_DATE_YEAR CR_DATE_MONTH CR_DATE_DAY CR_DATE_HOUR CR_DATE_MINUTE IS_ACTIVE COMMENT_COUNT);


$QUERY_CATEGORY		= 'ADFRAME_FORUMCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,TITLE,TEXT_0,TEXT_1,IMG_0,IMG_1,ITEM_1,ITEM_2,ITEM_3,ITEM_4,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),IS_ACTIVE';
$QUAL_CATEGORY		= '!ADFRAME_FORUMCATEGORY_ID!|!ADFRAME_CHANNEL!|!AREA!|!CATEGORY!|!TITLE!|!TEXT_0!|!TEXT_1!|!IMG_0!|!IMG_1!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!ITEM_4!|!YEAR!|!MONTH!|!DAY!|!IS_ACTIVE!';
@KEYS_CATEGORY		= qw(ADFRAME_FORUMCATEGORY_ID ADFRAME_CHANNEL AREA CATEGORY TITLE TEXT_0 TEXT_1 IMG_0 IMG_1 ITEM_1 ITEM_2 ITEM_3 ITEM_4 YEAR MONTH DAY IS_ACTIVE);

$QUAL_CATEGORY_FILE	= '!ADFRAME_FORUMCATEGORY_ID!|!LASTDATE!|!ITEMCOUNT!|!CATEGORY!|!TITLE!|!TEXT_0!|!TEXT_1!|!IMG_0!|!IMG_1!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!ITEM_4!|';


@MEMBER_COLS = qw(MEMBER_ADFRAME_USER_ID MEMBER_NAME MEMBER_ROLE MEMBER_AVATAR MEMBER_POST_COUNT MEMBER_IMAGE_COUNT MEMBER_STATUS MEMBER_DATE_DAY MEMBER_DATE_MONTH MEMBER_DATE_YEAR MEMBER_TITLE);


$STANDARD_ERROR_MESSAGE = 'Der Datensatz konnte nicht gespeichert werden';

		
		
# MEMBERS

sub getUserById {
	my $this	= shift;
	my $id		= shift;

	if ($id) {
		my $forumCount	= $this->getItemCountByUserId($ENV{ADFRAME_CHANNEL},'%',$id);
		my $imageCount	= $this->getImageCountByUserId($id);
		
		my $user	= $this->get($ENV{FORUM_USER_DB},'FIRSTNAME,NAME,SHOW_NAME,IMAGE,dayofmonth(CR_DATE),month(CR_DATE),year(CR_DATE)',"ADFRAME_USER_ID = '$id'");
		my @details 	= split(/\|/,$user);
		if ($details[2]	ne '1') { $name = $this->get('ADFRAME_USER','LOGIN',"ADFRAME_USER_ID = '$id'"); }
		else { $name = $details[0].' '.$details[1]; }
		
		my $roles	= $this->get('ADFRAME_USER','ROLES',"ADFRAME_USER_ID = '$id'");
		$title = '';
		$title = "Admin" if ($roles =~ /REDAKTEUR|ADMINISTRATOR/);
		my $userInfo 	= "$id|$name|$roles|$details[3]|$forumCount|$imageCount||$details[4]|$details[5]|$details[6]|$title";
		my @h		= split(/\|/,$userInfo);
		my %userRet;
		$n		= 0;
		foreach (@MEMBER_COLS)
		{
			$userRet{$_} = $h[$n];
			$n++;
		
		
		}
		$title = '';
		$title = "Admin" if ($roles =~ /REDAKTEUR|ADMINISTRATOR/);
		
		#main::debug(%userRet);
		return %userRet;
		
	
		}
	else
		{
		return false;
		
		}
	#main::debug($user);


}

sub getUserByIdOld {
	my $this	= shift;
	my $id		= shift;
	my $db		= shift;
	my $name	='';
	if ($id) {
		my $count1	= $this->getItemCountByUserId('surfers','%',$id);
		my $count2	= $this->getCommentCountByUserId('surfers','%',$id);
		my $count	= $count1 + $count2;
		my $user	= $this->get($db,'FIRSTNAME,NAME,SHOW_NAME,IMAGE_1,CR_DATE',"ADFRAME_USER_ID = '$id'");
		my @details 	= split(/\|/,$user);
		if ($details[2]	ne '1') { $name = $this->get('ADFRAME_USER','LOGIN',"ADFRAME_USER_ID = '$id'"); }
		else { $name = $details[0].' '.$details[1]; }
		my $crDate	= $this->get('ADFRAME_USER','dayofmonth(CR_DATE),month(CR_DATE),year(CR_DATE)',"ADFRAME_USER_ID = '$id'");
		$crDate		=~ s/\|/\./g;
		
		#main::debug($details[3]);
		return "$name|$details[3]|$count|$crDate";
		
		}
	else
		{
		return "|||";
		
		}
	#main::debug($user);


}

sub getImageCountByUserId
{
	my $this	= shift;
	my $id		= shift;
	
	my $count	= $this->get('ADFRAME_USER_FOTOS','count(*)',"ADFRAME_USER_ID = $id AND IS_ACTIVE=1");
	
	return $count;
}


sub getRolesById {
	my $this	= shift;
	my $id		= shift;
	my $roles	= $this->get('ADFRAME_USER','ROLES',"ADFRAME_USER_ID = '$id'");
	return $roles;

}


sub getMemberCount
{
	my $this	= shift;


	$memberCount = $this->get($ENV{FORUM_USER_DB},'count('.$ENV{FORUM_USER_DB}.'_ID)','IS_ACTIVE=1');

	return $memberCount;


}

sub getNewestMember
{
	my $this	= shift;
	
	$newestMember = $this->get($ENV{FORUM_USER_DB},'ADFRAME_USER_ID','IS_ACTIVE=1 order by CR_DATE desc LIMIT 1');

	return $this->getUserById($newestMember);



}

sub getLatestCommentUser 
{
	my $this	= shift;
	my $forumId	= shift;
	my $area	= shift || 'forum';
	my $id		= $this->get('ADFRAME_FORUM','ADFRAME_USER_ID',"REF_ADFRAME_FORUM_ID = '$forumId' AND AREA='$area' AND IS_ACTIVE=1 order by CR_DATE desc limit 1");

	my %user 	= $this->getUserById($id);
	$user{ANCHOR}= $this->get('ADFRAME_FORUM','ADFRAME_FORUM_ID',"REF_ADFRAME_FORUM_ID = '$forumId' AND AREA='$area' AND IS_ACTIVE=1 ORDER BY CR_DATE desc LIMIT 1");
	return %user;



}
sub getStarterName
{
	my $this	= shift;
	my $forumId	= shift;
	my $area	= shift || 'forum';
	my $id		= $this->get('ADFRAME_FORUM','ADFRAME_USER_ID',"ADFRAME_FORUM_ID = '$forumId' AND AREA='$area' AND IS_ACTIVE=1 order by CR_DATE desc limit 1");

	my %user 	= $this->getUserById($id);
	return $user{MEMBER_NAME};


}


sub getPostsByUserId
{
	my $this		= shift;
	my $ADFRAME_CHANNEL	= shift;
	my $AREA		= shift;
	my $userId		= shift;
	my $start		= shift;
	my $limit		= shift;
	
	my @items 		= $this->get('ADFRAME_FORUM',"ADFRAME_FORUMCATEGORY_ID,SUBJECT,COMMENT,DATE_FORMAT(CR_DATE,'%Y'),DATE_FORMAT(CR_DATE,'%m'),DATE_FORMAT(CR_DATE,'%d'),DATE_FORMAT(CR_DATE,'%H'),DATE_FORMAT(CR_DATE,'%i'),ADFRAME_FORUM_ID,AREA","ADFRAME_USER_ID = '$userId' and AREA like '$AREA' and IS_ACTIVE = 1",$start,$limit);
	
	
	my $qual = '!YEAR!|!MONTH!|!DAY!|!HOUR!|!MINUTE!|!FORUM_ID!|!RUBRIK!|!KATEGORY_ID!|!KATEGORY!|!SUBJECT!|!TEXT!|!COUNT!';

	my @all				= ();
	
	for (my $i=0;$i<=$#items;$i++) {
		@h = split(/\|/,$items[$i]);
		
		$h[2] = cut::cut($h[2],80); 
		$kat	= $this->get('ADFRAME_FORUMCATEGORY','TITLE',"ADFRAME_FORUMCATEGORY_ID = '$h[0]'");
		$count	= $this->getCommentCount($ADFRAME_CHANNEL,$AREA,$h[8]);
		
		push(@all,"$h[3]|$h[4]|$h[5]|$h[6]|$h[7]|$h[8]|$h[9]|$h[0]|$kat|$h[1]|$h[2]|$count Kommentare");
		
	}
	
	
	
	
	for (my $i=0;$i<=$#comments;$i++) {
		@h = split(/\|/,$comments[$i]);
		
		$h[1] = cut::cut($h[1],80); 
		
		$kat			= $this->query("select ADFRAME_FORUMCATEGORY.ADFRAME_FORUMCATEGORY_ID,TITLE from ADFRAME_FORUMCATEGORY inner join ADFRAME_FORUM on (ADFRAME_FORUM.ADFRAME_FORUMCATEGORY_ID = ADFRAME_FORUMCATEGORY.ADFRAME_FORUMCATEGORY_ID and ADFRAME_FORUM.ADFRAME_FORUM_ID = '$h[0]')");
		
		
		$info 			= $this->get('ADFRAME_FORUM','SUBJECT,ADFRAME_USER_ID',"ADFRAME_FORUM_ID = '$h[0]'");
		
		($subject,$user)	= split(/\|/,$info);
		$user_details		= $this->getUserById($user);
		@userRet		= split(/\|/,$user_details);
		
		
		$count			= "Zum Beitrag von $userRet[0]";	 
		push(@all,"$h[2]|$h[3]|$h[4]|$h[5]|$h[6]|$h[0]|$h[7]|$kat|Re: $subject|$h[1]|$count");
		
	}
	
	
	
	for (my $i=0;$i<=$#artikel;$i++) {
		@h = split(/\|/,$artikel[$i]);
		
		$h[1]	 		= cut::cut($h[1],80); 
		$info			= $this->get('ADFRAME_MCMS','HEADLINE,CATEGORY,A_NAME',"ADFRAME_MCMS_ID = '$h[0]'");
		($subject,$kat,$user)	= split(/\|/,$info);
		
		$count			= "Zum Artikel von $user";	 
		push(@all,"$h[2]|$h[3]|$h[4]|$h[5]|$h[6]|$h[0]|$h[7]|$kat|$kat|$subject|$h[1]|$count");
		
	}



	for (my $i=0;$i<=$#foto;$i++) {
		@h = split(/\|/,$foto[$i]);
		
		$h[1] 			= cut::cut($h[1],80); 
		$kat			= 'foto';
		$info 	= $this->get('ADFRAME_USER_FOTOS','TITLE,ADFRAME_USER_ID',"ADFRAME_USER_FOTO_ID = $h[0]");
		($subject,$user)	= split(/\|/,$info);
		$user_details	= $this->getUserById($user);
		@userRet	= split(/\|/,$user_details);
		$count		= "Zum Foto von $userRet[0]";	 
		push(@all,"$h[2]|$h[3]|$h[4]|$h[5]|$h[6]|$h[0]|$h[7]|$kat|$kat|$subject|$h[1]|$count");
		
	
	}
	
#main::debug(@all);

	my @ordnung 	= reverse(sort(@all));
	my @topTen	= ();
	
	if($#all > ($start+$limit)) { $anzahl=($start+$limit); }
	else {$anzahl=($#all); }
	for (my $i=$start;$i<=$anzahl;$i++) {
		push(@topTen,$ordnung[$i]);
	}

	return ($qual,@all);


}


sub getItemCountByUserId
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_USER_ID 		= shift;
	my $count = $this->get('ADFRAME_FORUM','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA like '$AREA' and ADFRAME_USER_ID=$ADFRAME_USER_ID and IS_ACTIVE=1");
	return $count;
}
sub getCommentCountByUserId
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_USER_ID 		= shift;
	my $cond					= "ADFRAME_USER_ID=$ADFRAME_USER_ID and IS_ACTIVE=1";
	my $count = $this->get('ADFRAME_FORUMCOMMENT','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA like '$AREA' and ADFRAME_USER_ID=$ADFRAME_USER_ID and IS_ACTIVE=1");	
	return $count;
}



sub getItemCount
{
	my $this				= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA				= shift;
	my $ADFRAME_FORUMCATEGORY_ID 		= shift;
	my $adCond				= shift;
	my $categoryCond			= "ADFRAME_FORUMCATEGORY_ID>0";
	if ($ADFRAME_FORUMCATEGORY_ID>0)
	{
		$categoryCond			= "ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID";
	}
	my $count = $this->get('ADFRAME_FORUM','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' AND REF_ADFRAME_FORUM_ID = -1 AND IS_ACTIVE=1 and AREA like '$AREA' $adCond and $categoryCond");
	return $count;
}

sub getCategoryOverviewList
{
	my $this	= shift;
	my $file	= shift;
	my @lines	= ();
	if (open(HA,$file))
	{
		@lines = <HA>;
		close(HA);
	}
	return @lines; 
}
sub getCategoryOverviewData
{
	my $this	= shift;
	my $file	= shift;
	my %catdata	= ();
	if (open(HA,$file))
	{
		my @lines = <HA>;
		close(HA);
		
		my @help	= ();
		foreach my $k (@lines)
		{
			if ($k !~ /^\s*$/)
			{
				@help = split(/\|/,$k);	
				if ($help[0] ne '')
				{
					$catdata{$help[0]}->{lastdate}  = $help[1];
					$catdata{$help[0]}->{allitems}  = $help[2];
					$catdata{$help[0]}->{CATEGORY}  = $help[3];
					$catdata{$help[0]}->{TITLE} 	= $help[4];
					$catdata{$help[0]}->{TEXT_0} 	= $help[5];
					$catdata{$help[0]}->{TEXT_1} 	= $help[6];
					$catdata{$help[0]}->{IMG_0} 	= $help[7];
					$catdata{$help[0]}->{IMG_1} 	= $help[8];
					$catdata{$help[0]}->{ITEM_1} 	= $help[9];
					$catdata{$help[0]}->{ITEM_2} 	= $help[10];
					$catdata{$help[0]}->{ITEM_3} 	= $help[11];
					$catdata{$help[0]}->{ITEM_4} 	= $help[12];
				}
			}
		}
		
	}
	return %catdata; 
}

sub getCategoryIdByName
{
	my $this						= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA						= shift;
	my $CATEGORY					= shift;
	my $condition					= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and CATEGORY='$CATEGORY'";
	my $ADFRAME_FORUMCATEGORY_ID	= $this->get('ADFRAME_FORUMCATEGORY','ADFRAME_FORUMCATEGORY_ID',$condition);
	return $ADFRAME_FORUMCATEGORY_ID;
}
sub updateCategoryOverviewData
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA				= shift;
	my $file				= shift;
	my ($qual,$categoryRef)	= $this->getCategories($ADFRAME_CHANNEL,$AREA,'','');
	my @categories			= @{ $categoryRef };
	my %lastItem			= ();
	my $allitems			= 0;
	my @h					= ();
	
	if (open(HA,">$file"))
	{	
		for (my $i=0;$i<=$#categories;$i++)
		{
			$categories[$i] =~ s/\x0d/<br>/g;
			$categories[$i] =~ s/\n/<br>/g;
			@h = split(/\|/, $categories[$i]);
			%lastItem = $this->getLastItemByCategoryId($ADFRAME_CHANNEL,$AREA,$h[0]);
			$allitems = $this->getItemCount($ADFRAME_CHANNEL,$AREA,$h[0]);

			if ($lastItem{YEAR} eq '')
			{
				$lastItem{DAY} 		= '-';
				$lastItem{MONTH}	= '-';
				$lastItem{YEAR}		= '-';
				$lastItem{HOUR}		= '-';
				$lastItem{MINUTE}	= '-';
			}
			
			print HA "$h[0]|".$lastItem{DAY}.'.'.$lastItem{MONTH}.'.'.$lastItem{YEAR}.', '.$lastItem{HOUR}.':'.$lastItem{MINUTE}."|$allitems|$h[3]|$h[4]|$h[5]|$h[6]|$h[7]|$h[8]|$h[9]|$h[10]|$h[11]|$h[12]\n";
		}
		close(HA);
		return 1;
	}
	return 0;
}


sub getCategoryById
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_FORUMCATEGORY_ID		= shift;
	my $condition						= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID";
	my @data 							= split(/\|/,$this->get('ADFRAME_FORUMCATEGORY',$QUERY_CATEGORY,$condition));
	my %dataHash						= ();	
	for (my $i=0;$i<=$#KEYS_CATEGORY;$i++)
	{
		$dataHash{"$KEYS_CATEGORY[$i]"} = $data[$i];
	}
	return %dataHash;
}


sub getCategories
{
	my $this				= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA				= shift;
	my $start				= shift;
	my $limit				= shift;
	my $condition				= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' order by ITEM_1";
	if ($start>0 && $limit>0)
	{
		$condition.=" limit $start,$limit"; 
	}
	my @categories = $this->get('ADFRAME_FORUMCATEGORY',$QUERY_CATEGORY,$condition); 
	return ($QUAL_CATEGORY,\@categories);
}

sub getLastItemByCategoryId
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_FORUMCATEGORY_ID 		= shift;
	my @data 					= split(/\|/,$this->get('ADFRAME_FORUM',$FORUM_QUERY_COLS,"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID order by ADFRAME_FORUM_ID desc limit 0,1"));
	my %dataHash				= ();	
	for (my $i=0;$i<=$#FORUM_KEYS;$i++)
	{
		$dataHash{"$FORUM_KEYS[$i]"} = $data[$i];
	}
	return %dataHash;	
}

# Forum:



sub getItems
{
	my $this					= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUMCATEGORY_ID 			= shift;
	my $start					= shift;
	my $itemsPerPage				= shift;
	my $limitCommentText				= shift;
	my $sort					= shift;
	my $addCond					= shift;
	my $categoryCond				= "ADFRAME_FORUMCATEGORY_ID>0";
	$sort = 'UP_DATE desc' if ($sort eq '');
	if ($ADFRAME_FORUMCATEGORY_ID>0)
	{
		$categoryCond			= "ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID";
	}
	my $condition	= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' AND REF_ADFRAME_FORUM_ID = -1 AND AREA='$AREA' and $categoryCond $addCond and ADFRAME_FORUM_ID>0 AND IS_ACTIVE= 1 order by ".$sort." limit $start,$itemsPerPage";	
#main::debug($condition);
	my @data		= $this->get('ADFRAME_FORUM',$FORUM_QUERY_COLS,$condition);
	
	#main::debug(@data);
	
	my @retData		= ();
	my @help		= ();
	my $val			= '';
	my $commentCount = 0;
	
	for (my $i=0;$i<=$#data;$i++)
	{
		@help = split(/\|/,$data[$i]);
			
		$val = '';
		$help[38] = $this->extendNum2($help[38]);

		
	
		$commentCount = $this->get('ADFRAME_FORUM','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and REF_ADFRAME_FORUM_ID=$help[0] and IS_ACTIVE=1");
		
		$help[7] 			= cut::cut($help[7],$limitCommentText); 
		#$help[10]  =~ s/\x0d/<br>/g;
		#$help[10]  =~ s/\n/<br>/g;	
		#$help[10]  =~ s/(<br>)+/<br>/g;	

		for (my $h=0;$h<=$#help;$h++)
		{
			$val.="$help[$h]|";
		}
		$val.= $commentCount;
		
		push(@retData,$val);
		#main::debug($val);
	}
	
	return ($FORUM_QUAL,\@retData);
}



sub getIndexItems
{
	my $this					= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA					= shift;
	my $limitCommentText				= shift;
	my $sort					= shift;
	my $addCond					= shift;
	my $categoryCond				= "ADFRAME_FORUMCATEGORY_ID>0";
	my $INDEX_QUAL= '!ADFRAME_FORUMCATEGORY_ID!|!CATEGORY_TITLE!|!CATEGORY_DESCR!|!CATEGORY_GROUP!|!CATEGORY_IMAGE!|!CATEGORY_COUNT!|!ADFRAME_FORUM_ID!|!SUBJECT!|!COMMENT!|!COMMENT_COUNT!|!LATEST_DATE!|!ADFRAME_USER_ID!|!USERNAME!|!LATEST_USERNAME!|!ANCHOR!|!CLOSED!';
	$sort = 'UP_DATE desc' if ($sort eq '');
	
	my $categories	= $this->getCategories($ADFRAME_CHANNEL,$AREA);
	
	
	my @catArr	= @{$categories};
	my @indexRet	= ();
	for (my $i=0;$i<=$#catArr;$i++)
	{
		my @vals = split(/\|/,$catArr[$i]);
		my $catCount = $this->get('ADFRAME_FORUM','COUNT(ADFRAME_FORUM_ID)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUMCATEGORY_ID=$vals[0] AND REF_ADFRAME_FORUM_ID='-1' AND IS_ACTIVE=1");
		$catInfo = "$vals[0]|$vals[4]|$vals[5]|$vals[9]|$vals[8]|$catCount";
		my $condition	= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUMCATEGORY_ID=$vals[0] AND IS_ACTIVE=1 AND REF_ADFRAME_FORUM_ID = '-1' order by UP_DATE desc limit 1";	

		my @data		= $this->get('ADFRAME_FORUM','ADFRAME_FORUM_ID,SUBJECT,COMMENT,ADFRAME_USER_ID,dayofmonth(UP_DATE),month(UP_DATE),year(UP_DATE),hour(UP_DATE),minute(UP_DATE),ITEM_8',$condition);
		my @h = split(/\|/,$data[0]);
		
		#main::debug($condition,@data);
		
		
		%postUser = $this->getUserById($h[3]);
		my @latest		= $this->get('ADFRAME_FORUM','ADFRAME_FORUM_ID,ADFRAME_USER_ID',"AREA='$AREA' AND REF_ADFRAME_FORUM_ID=$h[0] order by CR_DATE desc limit 1");
		my @help = split(/\|/,$latest[0]);
		%latestUser = $this->getUserById($help[1]);
		#main::debug(@h);
		$h[2] 			= cut::cut($h[2],$limitCommentText); 
		
		my $count = $this->get('ADFRAME_FORUM','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and REF_ADFRAME_FORUM_ID=$h[0] and IS_ACTIVE=1");
		
	
		$h[8] = $this->extendNum2($h[8]);
		$h[0] =~ s/\D//g;
		push(@indexRet,"$catInfo|$h[0]|$h[1]|$h[2]|$count|$h[4].$h[5].$h[6], $h[7]:$h[8]|$h[3]|$postUser{MEMBER_NAME}|$latestUser{MEMBER_NAME}|$help[0]|$h[9]");
	}
	
	#main::debug(@indexRet);

	
	return ($INDEX_QUAL,\@indexRet);
}



sub getLastItems
{
	my $this			= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA			= shift;
	my $userDb			= shift;
	my $limit			= shift;
	my ($itemQual,$itemRef) 	= $this->getItems($ADFRAME_CHANNEL,$AREA,'',0,10);
	my ($commentQual,$commentRef)	= $this->getComments($ADFRAME_CHANNEL,$AREA,'',10,'desc');
	my $qual = '!YEAR!|!MONTH!|!DAY!|!HOUR!|!MINUTE!|!FORUM_ID!|!USER_ID!|!SUBJECT!|!TEXT!|!USER_NAME!|!USER_IMAGE!|!USER_COUNT!|!USER_DATE!|!KATEGORY_ID!|!KATEGORY!';
	my @items			= @{$itemRef};
	my @comments			= @{$commentRef};
	my @all				= ();
	for (my $i=0;$i<=$#items;$i++) {
		@h = split(/\|/,$items[$i]);
		$user 	= $this->getUserById($h[4],$userDb);
		@text 	= $h[10] =~ /(.{1,100}\W)/gms;
		$kat	= $this->get('ADFRAME_FORUMCATEGORY','TITLE',"ADFRAME_FORUMCATEGORY_ID = '$h[3]'");
		push(@all,"$h[12]|$h[13]|$h[14]|$h[15]|$h[16]|$h[0]|$h[4]|$h[9]|$text[0] ...|$user|$h[3]|$kat");
		
	}
	for (my $i=0;$i<=$#comments;$i++) {
		@h = split(/\|/,$comments[$i]);
		$user 		= $this->getUserById($h[5],$userDb);
		@text 		= $h[10] =~ /(.{1,100}\W)/gms;
		$kat	= $this->query("select ADFRAME_FORUMCATEGORY.ADFRAME_FORUMCATEGORY_ID,TITLE from ADFRAME_FORUMCATEGORY inner join ADFRAME_FORUM on (ADFRAME_FORUM.ADFRAME_FORUMCATEGORY_ID = ADFRAME_FORUMCATEGORY.ADFRAME_FORUMCATEGORY_ID and ADFRAME_FORUM.ADFRAME_FORUM_ID = '$h[3]')");
		$subject 	= 'Re: '.$this->get('ADFRAME_FORUM','SUBJECT',"ADFRAME_FORUM_ID = '$h[3]'");
		push(@all,"$h[12]|$h[13]|$h[14]|$h[15]|$h[16]|$h[3]|$h[5]|$subject|$text[0] ...|$user|$kat");
		
	}
	my @ordnung 	= reverse(sort(@all));
	my @topTen	= ();
	for (my $i=0;$i<=$limit;$i++) {
		push(@topTen,$ordnung[$i]);
	}

	return ($qual,@topTen);


}


sub getAllByUserId
{
	my $this			= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA			= shift;
	my $userId			= shift;
	my $start			= shift;
	my $limit			= shift;
	
	
	
	my @items 			= $this->get('ADFRAME_FORUM',$FORUM_QUERY_COLS,"ADFRAME_USER_ID = '$userId' and AREA like '$AREA' and IS_ACTIVE = 1 order by CR_DATE desc");
	
	#main::debug(@items);
	
	my @all				= ();
	
	for (my $i=0;$i<=$#items;$i++) {
		@h = split(/\|/,$items[$i]);
		
		$h[7] = cut::cut($h[7],80); 
		$kat	= $this->get('ADFRAME_FORUMCATEGORY','TITLE',"ADFRAME_FORUMCATEGORY_ID = '$h[3]'");
		if($h[5] eq -1)
		{
			$h[5] 	= $h[0];
			$count	= $this->getCommentCount($ADFRAME_CHANNEL,'forum',$h[0]).' Kommentare';
			$kat	= $this->get('ADFRAME_FORUMCATEGORY','TITLE',"ADFRAME_FORUMCATEGORY_ID = '$h[3]'");
			#$kat 	= 'forum';
		}
		elsif($h[2] eq 'forum')
		{
			$info 			= $this->get('ADFRAME_FORUM','SUBJECT,ADFRAME_USER_ID',"ADFRAME_FORUM_ID = '$h[5]'");
		
			($subject,$user)	= split(/\|/,$info);
			%userDetails		= $this->getUserById($user);
			$h[6]			= "Re: $subject";
			$count			= "Zum Beitrag von $userDetails{MEMBER_NAME}";
			$kat	= $this->get('ADFRAME_FORUMCATEGORY','TITLE',"ADFRAME_FORUMCATEGORY_ID = '$h[3]'");
		}
		if($h[2] eq 'artikelforum')
		{
			$info			= $this->get('ADFRAME_MCMS','HEADLINE,CATEGORY,A_NAME',"ADFRAME_MCMS_ID = '$h[5]'");
			($subject,$kat,$user)	= split(/\|/,$info);
			$h[6]			= $subject;
			$count			= "Zum Artikel von $user";
			#$area			= $kat;
		}
		if($h[2] eq 'fotoforum')
		{
			$info 			= $this->get('ADFRAME_USER_FOTOS','TITLE,ADFRAME_USER_ID',"ADFRAME_USER_FOTO_ID = $h[5]");
			($kat,$user)	= split(/\|/,$info);
			%userDetails		= $this->getUserById($user);
			#$kat			= 'foto';
			$count			= "Zum Foto von $userDetails{MEMBER_NAME}";
		}		
		push(@all,join('|',@h)."|$count|$kat");
		
	}
	

	#main::debug(@all);
	

	return ($FORUM_QUAL.'|!KATEGORY!',@all);


}











sub getItemById
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUM_ID	= shift;
	my @data 					= split(/\|/,$this->get('ADFRAME_FORUM',$FORUM_QUERY_COLS,"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUM_ID=$ADFRAME_FORUM_ID"));
#main::debug(@data);
	my %dataHash				= ();	
	for (my $i=0;$i<=$#FORUM_KEYS;$i++)
	{
		$dataHash{"$FORUM_KEYS[$i]"} = $data[$i];
		
	}
	$dataHash{CR_DATE_MINUTE} = $this->extendNum2($dataHash{CR_DATE_MINUTE});

	#main::debug(%dataHash);
	return %dataHash;
}

sub getCommentById
{
	my $this					= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUM_ID				= shift;
	my @data 					= split(/\|/,$this->get('ADFRAME_FORUM',$FORUM_QUERY_COLS,"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUM_ID=$ADFRAME_FORUM_ID"));
	my %dataHash				= ();	
	for (my $i=0;$i<=$#FORUM_KEYS;$i++)
	{
		$dataHash{"$FORUM_KEYS[$i]"} = $data[$i];
	}
	return %dataHash;
}


sub getComments
{
	my $this			= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA			= shift;
	my $ADFRAME_FORUM_ID		= shift;
	my $limit			= shift;
	my $sort 			= shift;
	
	$sort = 'asc' if ($sort eq '');
	if ($limit ne "") { $limitQ = 'limit '.$limit; }
	
	if ($ADFRAME_FORUM_ID ne '') { $idQ = 'and REF_ADFRAME_FORUM_ID='.$ADFRAME_FORUM_ID; }
	
	
	
 	my @data = $this->get('ADFRAME_FORUM',$FORUM_QUERY_COLS,"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' $idQ AND IS_ACTIVE=1 order by ADFRAME_FORUM_ID $sort $limitQ");
	
#	main::debug(@data);
	
	my @retData		= ();
	my @help		= ();

	for (my $i=0;$i<=$#data;$i++)
	{
		@help = split(/\|/,$data[$i]);
		
		$help[48] = $this->extendNum2($help[48]);
		push(@retData,join('|',@help));
			
	}
	return ($FORUM_QUAL,\@retData);
}

sub getCommentCount
{
	my $this			= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA			= shift;
	my $ADFRAME_FORUM_ID 		= shift;
	my $adCond			= "and REF_ADFRAME_FORUM_ID=$ADFRAME_FORUM_ID" if ($ADFRAME_FORUM_ID >0);
	my $count = $this->get('ADFRAME_FORUM','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA like '$AREA' $adCond and IS_ACTIVE=1");	
	return $count;
}



sub saveEntity
{
	use de::adframe::components::forum::gen::ClassADFRAME_FORUM;
	my $forum	= new ClassADFRAME_FORUM();

	my $this					= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUMCATEGORY_ID 			= shift;
	my $ADFRAME_USER_ID				= shift;
	my $SUBJECT					= shift;
	my $COMMENT					= shift;
	my $ITEM_0					= shift;
	my $ITEM_1					= shift;
	my $ITEM_2					= shift;
	my $ITEM_3					= shift;
	my $ITEM_4					= shift;
	my $ITEM_5					= shift;
	my $ITEM_6					= shift;
	
	my $URL						= shift;
	my $USERROLE					= shift;
	my $END_DATE					= shift;
	my $ITEM_7					= shift;
	my $IMAGE 					= 'DEFIMG_0.gif';
	my $ADFRAME_FORUM_ID				= 0;
	my $uman					= new AdframeUser($ADFRAME_CHANNEL);
	my $textFormat					= new TextFormat;

	if ($END_DATE eq '') {
	 ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdat) = localtime( time + (14 * 24 * 60 *60));
	 	$END_DATE= ($year + 1900)."-".($mon +1)."-".$mday." $hour:$min:$sec"; }
	 	
	($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdat) = localtime(time);
	$UP_DATE= ($year + 1900)."-".($mon +1)."-".$mday." $hour:$min:$sec"; 
	$SUBJECT =~ s/<(?:[^>'"]*|(['"]).*?\1)*>//gs;
	$SUBJECT =~ s/\'/\\\'/g;
	$textFormat->setText($SUBJECT);
	$textFormat->convertToHtml();
	$SUBJECT = $textFormat->getConvertedText();
	$COMMENT =~ s/<(([^ >]|\n)*)>//g;
	$COMMENT =~ s/\'/\\\'/g;
	$textFormat->setText($COMMENT);
	$textFormat->convertToHtml();
	$COMMENT = $textFormat->getConvertedText();

	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_FORUMCATEGORY_ID>0) && ($ADFRAME_USER_ID>0))
	{
		$forum->setADFRAME_CHANNEL($ADFRAME_CHANNEL);
		$forum->setAREA($AREA);
		$forum->setADFRAME_FORUMCATEGORY_ID($ADFRAME_FORUMCATEGORY_ID);
		$forum->setADFRAME_USER_ID($ADFRAME_USER_ID);
		$forum->setSUBJECT($SUBJECT);
		$forum->setCOMMENT($COMMENT);
		$forum->setREF_ADFRAME_FORUM_ID(-1);
		
		$forum->setITEM_0(' ');
		$forum->setITEM_1(' ');
		$forum->setITEM_2(' ');
		$forum->setITEM_3(' ');
		$forum->setITEM_4(' ');
		$forum->setITEM_5(' ');
		$forum->setITEM_6(' ');
		$forum->setITEM_7(' ');
		$forum->setITEM_9(' ');
		$forum->setITEM_10(0);
		$forum->setITEM_11(' ');
		$forum->setITEM_12(' ');
		$forum->setITEM_13(' ');
		$forum->setITEM_14(' ');
		$forum->setITEM_15(' ');
		$forum->setITEM_16(' ');
		$forum->setITEM_17(' ');
		$forum->setITEM_18(' ');
		$forum->setITEM_19(' ');
		$forum->setTEXT_0(' ');
		$forum->setIMG_0($IMAGE);
		$forum->setIMG_1($IMAGE);
		$forum->setIMG_2($IMAGE);
		$forum->setEND_DATE($END_DATE);
		$forum->setUP_DATE($UP_DATE);
		$forum->setIS_ACTIVE(1);
		$ADFRAME_FORUM_ID = $forum->save();
		
		
	}
	return $ADFRAME_FORUM_ID;
}



sub setForumIMAGE
{
	my $this	= shift;
	my $FORUM_ID	= shift;
	my $FIELD	= shift;
	my $IMAGE	= shift;
	
	$this->update('ADFRAME_FORUM',$FIELD."='$IMAGE'","ADFRAME_FORUM_ID = '$FORUM_ID'");
	
}

sub setCommentIMAGE
{
	my $this	= shift;
	my $FORUM_ID	= shift;
	my $IMAGE	= shift;
	
	$this->update('ADFRAME_FORUM',"IMG_0='$IMAGE'","ADFRAME_FORUM_ID = '$FORUM_ID'");
	
}

sub saveComment
{
	use de::adframe::components::forum::gen::ClassADFRAME_FORUM;
	my $forum	= new ClassADFRAME_FORUM();

	my $this					= shift;
	my $ADFRAME_CHANNEL				= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUMCATEGORY_ID 			= shift;
	my $ADFRAME_USER_ID				= shift;
	my $REF_ADFRAME_FORUM_ID			= shift;
	my $SUBJECT					= shift;
	my $COMMENT					= shift;
	my $URL						= shift;
	my $NAME					= shift;
	my $URL						= shift;
	my $ITEM_0					= shift;
	my $ITEM_1					= shift;
	my $ITEM_2					= shift;
	my $ITEM_3					= shift;
	my $ITEM_4					= shift;
	my $ITEM_5					= shift;
	my $ITEM_6					= shift;
	

	my $USERROLE					= shift;
	my $END_DATE					= shift;

	my $IMAGE 					= 'DEFIMG_0.gif';
	
	my $uman					= new AdframeUser($ADFRAME_CHANNEL);
	my $textFormat					= new TextFormat;

	if ($END_DATE eq '') {
	 ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdat) = localtime( time + (14 * 24 * 60 *60));
	 	$END_DATE= ($year + 1900)."-".($mon +1)."-".$mday." $hour:$min:$sec"; }
	 	
	($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdat) = localtime(time);
	$UP_DATE= ($year + 1900)."-".($mon +1)."-".$mday." $hour:$min:$sec"; 
	$SUBJECT =~ s/<(?:[^>'"]*|(['"]).*?\1)*>//gs;
	$SUBJECT =~ s/\'/\\\'/g;
	$textFormat->setText($SUBJECT);
	$textFormat->convertToHtml();
	$SUBJECT = $textFormat->getConvertedText();
	$COMMENT =~ s/<(([^ >]|\n)*)>//g;
	$COMMENT =~ s/\'/\\\'/g;
	$textFormat->setText($COMMENT);
	$textFormat->convertToHtml();
	$COMMENT = $textFormat->getConvertedText();

	if (($ADFRAME_CHANNEL ne '') && ($AREA ne ''))
	{
		$forum->setADFRAME_CHANNEL($ADFRAME_CHANNEL);
		$forum->setAREA($AREA);
		$forum->setADFRAME_FORUMCATEGORY_ID($ADFRAME_FORUMCATEGORY_ID);
		$forum->setADFRAME_USER_ID($ADFRAME_USER_ID);
		$forum->setSUBJECT($SUBJECT);
		$forum->setCOMMENT($COMMENT);
		$forum->setNAME($NAME);
		$forum->setURL($URL);
		$forum->setITEM_0($ITEM_0);
		$forum->setREF_ADFRAME_FORUM_ID($REF_ADFRAME_FORUM_ID);
		$forum->setITEM_7('');
		$forum->setIMG_0($IMAGE);
		$forum->setIMG_1($IMAGE);
		$forum->setIMG_2($IMAGE);
		$forum->setEND_DATE($END_DATE);
		$forum->setUP_DATE($UP_DATE);
		$forum->setIS_ACTIVE(1);
		$ADFRAME_FORUM_ID = $forum->save();
		
		$forum->initById($REF_ADFRAME_FORUM_ID);
		$forum->setUP_DATE($UP_DATE);
		$forum->save();
		
		
	}
	return $ADFRAME_FORUM_ID;
}




sub deleteItem
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUM_ID		= shift;
	my $ok						= 0;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_FORUM_ID>0))
	{
		$this->delete('ADFRAME_FORUM',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUM_ID=$ADFRAME_FORUM_ID");
		$this->delete('ADFRAME_FORUMCOMMENT',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUM_ID=$ADFRAME_FORUM_ID");
		$ok = 1;
	}
	return $ok;
}
sub deleteComment
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUMCOMMENT_ID	= shift;
	my $ok						= 0;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_FORUMCOMMENT_ID>0))
	{
		$this->delete('ADFRAME_FORUMCOMMENT',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA'  and ADFRAME_FORUMCOMMENT_ID=$ADFRAME_FORUMCOMMENT_ID");
		$ok = 1;
	}
	return $ok;
}
sub updateItem
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_FORUM_ID		= shift;
	my $col						= shift;
	my $val						= shift;
	my $file					= shift;
	my $ok						= 0;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_FORUM_ID>0) && ($col ne ''))
	{
		$this->update('ADFRAME_FORUM',"$col='$val'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUM_ID=$ADFRAME_FORUM_ID");
		if (($file ne '') && (-f $file))
		{
			unlink($file);
		}		
		$ok = 1;
	}
	return $ok;
}
# CATEGORY:
sub saveCategory
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_FORUMCATEGORY_ID		= shift;
	my $CATEGORY						= shift;
	my $TITLE							= shift;
	my $TEXT_0							= shift;
	my $TEXT_1							= shift;
	my $ITEM_1							= shift;
	my $ITEM_2							= shift;
	my $ITEM_3							= shift;
	my $ITEM_4							= shift;
	my $file							= shift;
	$CATEGORY =~ s/\'/\\\'/g;
	$TITLE =~ s/\'/\\\'/g;
	$TEXT_0 =~ s/\'/\\\'/g;
	$TEXT_1 =~ s/\'/\\\'/g;
	$ITEM_1 =~ s/\'/\\\'/g;
	$ITEM_2 =~ s/\'/\\\'/g;
	$ITEM_3 =~ s/\'/\\\'/g;
	$ITEM_4 =~ s/\'/\\\'/g;
	
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($CATEGORY ne ''))
	{
		if ($ADFRAME_FORUMCATEGORY_ID<1)
		{
			my $testCat = $this->get('ADFRAME_FORUMCATEGORY','CATEGORY',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and CATEGORY='$CATEGORY'");
			if ($testCat ne $CATEGORY)
			{
				my @values	= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","'$CATEGORY'","'$TITLE'","'$TEXT_0'","'$TEXT_1'","'DEFIMG_1.gif'","'DEFIMG_2.gif'","'$ITEM_1'","'$ITEM_2'","'$ITEM_3'","'$ITEM_4'","now()","1");
				$ADFRAME_FORUMCATEGORY_ID = $this->insert('ADFRAME_FORUMCATEGORY','ADFRAME_FORUMCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,TITLE,TEXT_0,TEXT_1,IMG_0,IMG_1,ITEM_1,ITEM_2,ITEM_3,ITEM_4,CR_DATE,IS_ACTIVE',@values);
				if (($file ne '') && (-f $file))
				{
					unlink($file);
				}
			}
			else
			{
				$ADFRAME_FORUMCATEGORY_ID = 0;
				$this->{errormessage} = 'Diese Kategorie existiert bereits';
			}
		}
		else
		{
			my $testCat = $this->get('ADFRAME_FORUMCATEGORY','CATEGORY',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUMCATEGORY_ID<>$ADFRAME_FORUMCATEGORY_ID and CATEGORY='$CATEGORY'");
			if ($testCat ne $CATEGORY)
			{
				$this->update('ADFRAME_FORUMCATEGORY',"CATEGORY='$CATEGORY',TITLE='$TITLE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");
				$this->update('ADFRAME_FORUMCATEGORY',"TEXT_0='$TEXT_0'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");
				$this->update('ADFRAME_FORUMCATEGORY',"TEXT_1='$TEXT_1'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");
				$this->update('ADFRAME_FORUMCATEGORY',"ITEM_1='$ITEM_1'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");
				$this->update('ADFRAME_FORUMCATEGORY',"ITEM_2='$ITEM_2'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");
				$this->update('ADFRAME_FORUMCATEGORY',"ITEM_3='$ITEM_3'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");
				$this->update('ADFRAME_FORUMCATEGORY',"ITEM_4='$ITEM_4'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");
				if (($file ne '') && (-f $file))
				{
					unlink($file);
				}			
			}
			else
			{
				$ADFRAME_FORUMCATEGORY_ID = 0;
				$this->{errormessage} = 'Diese Kategorie existiert bereits';
			}
		}
	}
	else
	{
		$ADFRAME_FORUMCATEGORY_ID	= 0;
		$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
	}
	return $ADFRAME_FORUMCATEGORY_ID;
}
sub deleteCategory
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_FORUMCATEGORY_ID		= shift;
	my $file							= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_FORUMCATEGORY_ID >0))
	{
		my @testCats = $this->get('ADFRAME_FORUM','ADFRAME_FORUM_ID',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID");

		if (@testCats == ())
		{
			if ($this->delete('ADFRAME_FORUMCATEGORY',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID"))
			{
				if (($file ne '') && (-f $file))
				{
					unlink($file);
				}			
				return 1;
			}
			else
			{
				$this->{errormessage} = $STANDARD_ERROR_MESSAGE;
			}
		}
		else
		{	
			$this->{errormessage} = 'Es existieren noch Eintrge mit dieser Kategorie!\nBitte zuerst l schen';
		}
	}
	return 0;
}
sub getCategoryByName
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $CATEGORY						= shift;
	my $condition						= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and CATEGORY='$CATEGORY'";
	my @data 							= split(/\|/,$this->get('ADFRAME_FORUMCATEGORY',$QUERY_CATEGORY,$condition));
	my %dataHash						= ();	
	for (my $i=0;$i<=$#KEYS_CATEGORY;$i++)
	{
		$dataHash{"$KEYS_CATEGORY[$i]"} = $data[$i];
	}
	return %dataHash;
}

sub getLastCommentsForUserid
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_USER_ID 		= shift;

	my @data		= $this->get('ADFRAME_FORUM as f, ADFRAME_FORUMCOMMENT as c','f.ADFRAME_FORUM_ID,f.ADFRAME_FORUMCATEGORY_ID,f.SUBJECT,c.ADFRAME_FORUMCOMMENT_ID,c.ADFRAME_USER_ID,c.LOGIN,c.COMMENT',"f.ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and f.AREA='$AREA' and f.ADFRAME_USER_ID=$ADFRAME_USER_ID and f.ADFRAME_FORUM_ID=c.ADFRAME_FORUM_ID and c.COMMENTTYPE='NEW' order by c.CR_DATE desc");
	
	return ('!ADFRAME_FORUM_ID!|!ADFRAME_FORUMCATEGORY_ID!|!SUBJECT!|!ADFRAME_FORUMCOMMENT_ID!|!COMMENT_ADFRAME_USER_ID!|!COMMENT_LOGIN!|!COMMENT_COMMENT!',\@data);
}


sub setCommentRead
{
	my $this							= shift;
	my $ADFRAME_FORUMCOMMENT_ID 		= shift;
	
	if ($ADFRAME_FORUMCOMMENT_ID>0)
	{
		
		$this->update('ADFRAME_FORUMCOMMENT',"COMMENTTYPE=''","ADFRAME_FORUMCOMMENT_ID=$ADFRAME_FORUMCOMMENT_ID");
		return 1;
	}
	return 0;
}

sub updateCategoryItem
{
	my $this				= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA				= shift;
	my $ADFRAME_FORUMCATEGORY_ID		= shift;
	my $KEY					= shift;
	my $VALUE				= shift;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_FORUMCATEGORY_ID > 0) && ($KEY ne '') && ($VALUE ne ''))
	{
		if ($this->update('ADFRAME_FORUMCATEGORY',"$KEY='$VALUE'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_FORUMCATEGORY_ID=$ADFRAME_FORUMCATEGORY_ID"))
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