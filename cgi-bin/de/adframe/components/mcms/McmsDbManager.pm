package McmsDbManager;
# extends:
use de::adframe::lib::db::DbAdapter; @ISA = (DbAdapter);
1;

sub getNextRankNo
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA				= shift;
	if (($ADFRAME_CHANNEL eq '') || ($AREA eq ''))
	{
		return -1;
	}
	else
	{
		my $lastRank			= $this->get('ADFRAME_MCMS','RANK_NO',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and (AREA like '$AREA') and IS_ACTIVE>0 order by RANK_NO desc limit 0,1");
		if ($lastRank eq '')
		{
			$lastRank = 0;
		}
		$lastRank++;
		return $lastRank;
	}
}
sub getRankAllNo
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my @rankno	= $this->get('ADFRAME_MCMS','ADFRAME_MCMS_ID,RANK_NO',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and (AREA like '$AREA') and IS_ACTIVE>0 order by RANK_NO");
	return @rankno;
}
sub getRankNo
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $AREA							= shift;
	my $ADFRAME_MCMS_ID			= shift;
	return $this->get('ADFRAME_MCMS','RANK_NO',"ADFRAME_MCMS_ID=$ADFRAME_MCMS_ID");
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
		if ($rank_a eq $rank_b) {$rank_b++; }
		#main::debug($CMS_ENTITY_ID_A,$rank_a,$CMS_ENTITY_ID_B,$rank_b);
		if (($rank_a>0) && ($rank_b>0))
		{
			$this->update('ADFRAME_MCMS',"RANK_NO=$rank_b","ADFRAME_MCMS_ID=$CMS_ENTITY_ID_A");
			$this->update('ADFRAME_MCMS',"RANK_NO=$rank_a","ADFRAME_MCMS_ID=$CMS_ENTITY_ID_B");
			$ok=1;
		}
	}
	return $ok;
}

sub toggleRank
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $AREA				= shift;
	my $ADFRAME_MCMS_ID		= shift;
	my $direction			= shift;
	my $ok					= 0;
	my $OTHER_CMS_ENTITY_ID	= -1;
	my $foundpos			= -1;
	my $otherpos			= -1;
	my @help				= ();

	my @allrank		= $this->getRankAllNo($ADFRAME_CHANNEL,$AREA);
	#main::debug(@allrank);
	for (my $i=0;$i<=$#allrank;$i++)
	{
		@help = split(/\|/,$allrank[$i]);
		if ($help[0] == $ADFRAME_MCMS_ID)
		{
			$foundpos = $i;
			if ($direction eq 'down')
			{
				$otherpos = $i-1;
			}
			elsif ($direction eq 'up')
			{
				$otherpos = $i+1;
			}
			else
			{
				return 0;
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
			$ok = $this->toggleRankByIds($ADFRAME_CHANNEL,$AREA,$ADFRAME_MCMS_ID,$OTHER_CMS_ENTITY_ID);
		}	
	}
	return $ok;
}

# Parent-Rank:
sub getNextParentRankNo
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $CATEGORY			= shift;
	if ($ADFRAME_CHANNEL eq '') 
	{
		return -1;
	}
	else
	{
		my $lastParentRank			= $this->get('ADFRAME_MCMS','PARENT_RANK_NO',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and (AREA like '%$CATEGORY%') and IS_ACTIVE>0 and P_STATUS>0 order by PARENT_RANK_NO desc limit 0,1");
		if ($lastParentRank eq '')
		{
			$lastParentRank = 0;
		}
		$lastParentRank++;
		return $lastParentRank;
	}
}

sub getParentRankAllNo
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $CATEGORY						= shift;
	my @parentrankno	= $this->get('ADFRAME_MCMS','ADFRAME_MCMS_ID,PARENT_RANK_NO',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and (AREA like '%$CATEGORY%') and IS_ACTIVE>0 and P_STATUS>0 order by PARENT_RANK_NO");
	return @parentrankno;
}
sub getParentRankNo
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $CATEGORY						= shift;
	my $ADFRAME_MCMS_ID					= shift;
	return $this->get('ADFRAME_MCMS','PARENT_RANK_NO',"ADFRAME_MCMS_ID=$ADFRAME_MCMS_ID");
}
sub toggleParentRankByIds
{
	my $this							= shift;
	my $ADFRAME_CHANNEL					= shift;
	my $CATEGORY						= shift;
	my $CMS_ENTITY_ID_A					= shift;
	my $CMS_ENTITY_ID_B					= shift;
	my $ok								= 0;
	if (($CMS_ENTITY_ID_A>0) && ($CMS_ENTITY_ID_B>0))
	{
	
		my $rank_a		= $this->getParentRankNo($ADFRAME_CHANNEL,$CATEGORY,$CMS_ENTITY_ID_A);
		my $rank_b		= $this->getParentRankNo($ADFRAME_CHANNEL,$CATEGORY,$CMS_ENTITY_ID_B);
		if ($rank_a eq $rank_b) {$rank_b++; }
		#main::debug($CMS_ENTITY_ID_A,$rank_a,$CMS_ENTITY_ID_B,$rank_b);
		if (($rank_a>0) && ($rank_b>0))
		{
		
			$this->update('ADFRAME_MCMS',"PARENT_RANK_NO=$rank_b","ADFRAME_MCMS_ID=$CMS_ENTITY_ID_A");
			$this->update('ADFRAME_MCMS',"PARENT_RANK_NO=$rank_a","ADFRAME_MCMS_ID=$CMS_ENTITY_ID_B");
			$ok=1;
		}
	}
	return $ok;
}

sub toggleParentRank
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $CATEGORY			= shift;
	my $ADFRAME_MCMS_ID		= shift;
	my $direction			= shift;
	my $ok					= 0;
	my $OTHER_CMS_ENTITY_ID	= -1;
	my $foundpos			= -1;
	my $otherpos			= -1;
	my @help				= ();

	my @allrank		= $this->getParentRankAllNo($ADFRAME_CHANNEL,$CATEGORY);
	#main::debug(@allrank);
	for (my $i=0;$i<=$#allrank;$i++)
	{
		@help = split(/\|/,$allrank[$i]);
		if ($help[0] == $ADFRAME_MCMS_ID)
		{
			$foundpos = $i;
			if ($direction eq 'down')
			{
				$otherpos = $i-1;
			}
			elsif ($direction eq 'up')
			{
				$otherpos = $i+1;
			}
			else
			{
				return 0;
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
			$ok = $this->toggleParentRankByIds($ADFRAME_CHANNEL,$CATEGORY,$ADFRAME_MCMS_ID,$OTHER_CMS_ENTITY_ID);
		}	
	}
	return $ok;
}