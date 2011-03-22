package GuestbookDbManager;
# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);

use de::adframe::components::user::AdframeUser;
1;

$GUEST_COLS			= 'ADFRAME_GUESTBOOK_ID,ADFRAME_CHANNEL,AREA,ADFRAME_USER_ID,FIRSTNAME,NAME,LOGIN,EMAIL,SUBJECT,COMMENT,URL,CR_DATE,IS_ACTIVE';
$GUEST_QUERY_COLS	= 'ADFRAME_GUESTBOOK_ID,ADFRAME_CHANNEL,AREA,ADFRAME_USER_ID,FIRSTNAME,NAME,LOGIN,EMAIL,SUBJECT,COMMENT,URL,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$GUEST_QUAL			= '!ADFRAME_GUESTBOOK_ID!|!ADFRAME_CHANNEL!|!AREA!|!ADFRAME_USER_ID!|!FIRSTNAME!|!NAME!|!LOGIN!|!EMAIL!|!SUBJECT!|!COMMENT!|!URL!|!YEAR!|!MONTH!|!DAY!|!HOUR!|!MINUTE!|!IS_ACTIVE!';
@GUEST_KEYS			= qw(ADFRAME_GUESTBOOK_ID ADFRAME_CHANNEL AREA ADFRAME_USER_ID FIRSTNAME NAME LOGIN EMAIL SUBJECT COMMENT URL YEAR MONTH DAY HOUR MINUTE IS_ACTIVE);

$COMMENT_COLS		= 'ADFRAME_GUESTBOOKCOMMENT_ID,ADFRAME_CHANNEL,AREA,ADFRAME_GUESTBOOK_ID,ADFRAME_USER_ID,FIRSTNAME,NAME,LOGIN,EMAIL,COMMENT,COMMENTTYPE,CR_DATE,IS_ACTIVE';
$COMMENT_QUERY_COLS	= 'ADFRAME_GUESTBOOKCOMMENT_ID,ADFRAME_CHANNEL,AREA,ADFRAME_GUESTBOOK_ID,ADFRAME_USER_ID,FIRSTNAME,NAME,LOGIN,EMAIL,COMMENT,COMMENTTYPE,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$COMMENT_QUAL		= '!COMMENT_ADFRAME_GUESTBOOKCOMMENT_ID!|!COMMENT_ADFRAME_CHANNEL!|!COMMENT_AREA!|!COMMENT_ADFRAME_GUESTBOOK_ID!|!COMMENT_ADFRAME_USER_ID!|!COMMENT_FIRSTNAME!|!COMMENT_NAME!|!COMMENT_LOGIN!|!COMMENT_EMAIL!|!COMMENT_COMMENT!|!COMMENT_COMMENTTYPE!|!COMMENT_YEAR!|!COMMENT_MONTH!|!COMMENT_DAY!|!COMMENT_HOUR!|!COMMENT_MINUTE!|!COMMENT_IS_ACTIVE!';
$ADMINCOMMENT_QUAL	= '!ADMIN_COMMENT_ADFRAME_GUESTBOOKCOMMENT_ID!|!ADMIN_COMMENT_ADFRAME_CHANNEL!|!ADMIN_COMMENT_AREA!|!ADMIN_COMMENT_ADFRAME_GUESTBOOK_ID!|!ADMIN_COMMENT_ADFRAME_USER_ID!|!ADMIN_COMMENT_FIRSTNAME!|!ADMIN_COMMENT_NAME!|!ADMIN_COMMENT_LOGIN!|!ADMIN_COMMENT_EMAIL!|!ADMIN_COMMENT_COMMENT!|!ADMIN_COMMENT_COMMENTTYPE!|!ADMIN_COMMENT_YEAR!|!ADMIN_COMMENT_MONTH!|!ADMIN_COMMENT_DAY!|!ADMIN_COMMENT_HOUR!|!ADMIN_COMMENT_MINUTE!|!ADMIN_COMMENT_IS_ACTIVE!';
@COMMENT_KEYS		= qw(ADFRAME_GUESTBOOKCOMMENT_ID ADFRAME_CHANNEL AREA ADFRAME_GUESTBOOK_ID ADFRAME_USER_ID FIRSTNAME NAME LOGIN EMAIL COMMENT COMMENTTYPE YEAR MONTH DAY HOUR MINUTE IS_ACTIVE);

sub saveEntity
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_USER_ID			= shift;
	my $FIRSTNAME				= shift;
	my $NAME					= shift;
	my $LOGIN					= shift;
	my $EMAIL					= shift;
	my $SUBJECT					= shift;
	my $COMMENT					= shift;
	my $URL						= shift;
	my $uman					= new AdframeUser($ADFRAME_CHANNEL);
	my $ADFRAME_GUESTBOOK_ID	= 0;
	
	$COMMENT =~ s/\'/\\\'/g;
	
	if (! $uman->initById($ADFRAME_USER_ID))
	{
		$uman->setFIRSTNAME($FIRSTNAME);
		$uman->setNAME($NAME);
		$uman->setLOGIN($LOGIN);
		$uman->setEMAIL($EMAIL);
		$ADFRAME_USER_ID = $uman->save(); 
	}
	else
	{
		$FIRSTNAME	= $uman->getFIRSTNAME();
		$NAME		= $uman->getNAME();
		$LOGIN		= $uman->getLOGIN();
		$EMAIL		= $uman->getEMAIL();
	}
	
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_USER_ID>0))
	{
		my @values		= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","$ADFRAME_USER_ID","'$FIRSTNAME'","'$NAME'","'$LOGIN'","'$EMAIL'","'$SUBJECT'","'$COMMENT'","'$URL'","now()","1");
		$ADFRAME_GUESTBOOK_ID = $this->insert('ADFRAME_GUESTBOOK',$GUEST_COLS,@values);
	}
	return $ADFRAME_GUESTBOOK_ID;
}
sub saveComment
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOK_ID	= shift;
	my $ADFRAME_USER_ID			= shift;
	my $FIRSTNAME				= shift;
	my $NAME					= shift;
	my $LOGIN					= shift;
	my $EMAIL					= shift;
	my $COMMENT					= shift;
	my $uman					= new AdframeUser($ADFRAME_CHANNEL);
	my $ADFRAME_GUESTBOOKCOMMENT_ID	= 0;
	
	$COMMENT =~ s/\'/\\\'/g;
	
	if (! $uman->initById($ADFRAME_USER_ID))
	{
		$uman->setFIRSTNAME($FIRSTNAME);
		$uman->setNAME($NAME);
		$uman->setLOGIN($LOGIN);
		$uman->setEMAIL($EMAIL);
		$ADFRAME_USER_ID = $uman->save(); 
	}
	else
	{
		$FIRSTNAME	= $uman->getFIRSTNAME();
		$NAME		= $uman->getNAME();
		$LOGIN		= $uman->getLOGIN();
		$EMAIL		= $uman->getEMAIL();
	}	
	
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_USER_ID>0) && ($ADFRAME_GUESTBOOK_ID>0))
	{
		my @values		= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","$ADFRAME_GUESTBOOK_ID","$ADFRAME_USER_ID","'$FIRSTNAME'","'$NAME'","'$LOGIN'","'$EMAIL'","'$COMMENT'","''","now()","1");
		$ADFRAME_GUESTBOOKCOMMENT_ID = $this->insert('ADFRAME_GUESTBOOKCOMMENT',$COMMENT_COLS,@values);
	}
	return $ADFRAME_GUESTBOOKCOMMENT_ID;	
}

sub saveAdminComment
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOK_ID	= shift;
	my $ADFRAME_USER_ID			= shift;
	my $COMMENT					= shift;
	my $ADFRAME_GUESTBOOKCOMMENT_ID	= 0;
	my $uman					= new AdframeUser($ADFRAME_CHANNEL);
	if ($uman->initById($ADFRAME_USER_ID))
	{	
		$COMMENT =~ s/\'/\\\'/g;
	
		my $FIRSTNAME 	= $uman->getFIRSTNAME();
		my $NAME 		= $uman->getNAME();
		my $LOGIN 		= $uman->getLOGIN();
		my $EMAIL 		= $uman->getEMAIL();
		
		if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_GUESTBOOK_ID>0))
		{
			my @values		= ("NULL","'$ADFRAME_CHANNEL'","'$AREA'","$ADFRAME_GUESTBOOK_ID","$ADFRAME_USER_ID","'$FIRSTNAME'","'$NAME'","'$LOGIN'","'$EMAIL'","'$COMMENT'","'RED'","now()","1");
			$ADFRAME_GUESTBOOKCOMMENT_ID = $this->insert('ADFRAME_GUESTBOOKCOMMENT',$COMMENT_COLS,@values);
		}
	}
	return $ADFRAME_GUESTBOOKCOMMENT_ID;	
}

sub getItemCount
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $count = $this->get('ADFRAME_GUESTBOOK','count(*)',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA'");
	return $count;
}

sub getItems
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $start					= shift;
	my $itemsPerPage			= shift;
	my $condition	= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_GUESTBOOK_ID>0 order by ADFRAME_GUESTBOOK_ID desc limit $start,$itemsPerPage";
	my @data		= $this->get('ADFRAME_GUESTBOOK',$GUEST_QUERY_COLS,$condition);
	my @retData		= ();
	my @help		= ();
	my $val			= '';
	for (my $i=0;$i<=$#data;$i++)
	{
		@help = split(/\|/,$data[$i]);
		$val = '';
		$help[12] = $this->extendNum2($help[12]);
		$help[13] = $this->extendNum2($help[13]);
		$help[14] = $this->extendNum2($help[14]);
		$help[15] = $this->extendNum2($help[15]);
		for (my $h=0;$h<=$#help;$h++)
		{
			$val.="$help[$h]|";
		}
		chop($val);
		push(@retData,$val);
		
	}
	return ($GUEST_QUAL,\@retData);
}
sub getItemById
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOK_ID	= shift;
	my @data 					= split(/\|/,$this->get('ADFRAME_GUESTBOOK',$GUEST_QUERY_COLS,"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_GUESTBOOK_ID=$ADFRAME_GUESTBOOK_ID"));
	my %dataHash				= ();	
	for (my $i=0;$i<=$#GUEST_KEYS;$i++)
	{
		$dataHash{"$GUEST_KEYS[$i]"} = $data[$i];
	}
	return %dataHash;
}
sub getComments
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOK_ID	= shift;
    my @data = $this->get('ADFRAME_GUESTBOOKCOMMENT',$COMMENT_QUERY_COLS,"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_GUESTBOOK_ID=$ADFRAME_GUESTBOOK_ID and COMMENTTYPE =''");
	return ($COMMENT_QUAL,\@data);
}
sub getAdminComments
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOK_ID	= shift;
	my @data = $this->get('ADFRAME_GUESTBOOKCOMMENT',$COMMENT_QUERY_COLS,"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_GUESTBOOK_ID=$ADFRAME_GUESTBOOK_ID and COMMENTTYPE ='RED'");
	return ($ADMINCOMMENT_QUAL,\@data);
}
sub deleteItem
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOK_ID	= shift;
	my $ok						= 0;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_GUESTBOOK_ID>0))
	{
		$this->delete('ADFRAME_GUESTBOOK',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_GUESTBOOK_ID=$ADFRAME_GUESTBOOK_ID");
		$this->delete('ADFRAME_GUESTBOOKCOMMENT',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_GUESTBOOK_ID=$ADFRAME_GUESTBOOK_ID");
		$ok = 1;
	}
	return $ok;
}
sub deleteComment
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOKCOMMENT_ID	= shift;
	my $ok						= 0;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_GUESTBOOKCOMMENT_ID>0))
	{
		$this->delete('ADFRAME_GUESTBOOKCOMMENT',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA'  and ADFRAME_GUESTBOOKCOMMENT_ID=$ADFRAME_GUESTBOOKCOMMENT_ID");
		$ok = 1;
	}
	return $ok;
}
sub updateItem
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $AREA					= shift;
	my $ADFRAME_GUESTBOOK_ID	= shift;
	my $col						= shift;
	my $val						= shift;
	my $ok						= 0;
	if (($ADFRAME_CHANNEL ne '') && ($AREA ne '') && ($ADFRAME_GUESTBOOK_ID>0) && ($col ne ''))
	{
		$this->update('ADFRAME_GUESTBOOK',"$col='$val'","ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and AREA='$AREA' and ADFRAME_GUESTBOOK_ID=$ADFRAME_GUESTBOOK_ID");
		$ok = 1;
	}
	return $ok;
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