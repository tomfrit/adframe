package AdframeUserDbManager;
# extends:
use de::adframe::components::user::gen::ListADFRAME_USER; @ISA=qw(ListADFRAME_USER);

# use
use de::adframe::components::user::gen::ClassADFRAME_USER;

$QUAL	= $ListADFRAME_USER::QUAL;
$ADFRAME_USER_ITEMS_PER_PAGE 	= $ENV{ADFRAMEUSER_ITEMS_PER_PAGE} || 25;
1;

sub getUser
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $orderby				= shift;
	my $start				= shift;
	my $limit				= shift;
	my $condition			= shift;
	my $admitcond			= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL'";

	if ($condition ne '')
	{
		$admitcond.= " and $condition";
	}
	return $this->getADFRAME_USER($admitcond,$orderby,$start,$limit);
}

sub getUserCount
{
	my $this					= shift;
	my $ADFRAME_CHANNEL			= shift;
	my $condition				= shift;
	my $admitcond = "ADFRAME_CHANNEL='$ADFRAME_CHANNEL'";
	if ($condition ne '')
	{
		$admitcond.=" and $condition";
	}
	return $this->getCountADFRAME_USER($admitcond);
}

sub getUserWithConditionAndRole
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $condition			= shift;
	my $orderby				= shift;
	my $start				= shift;
	my $limit				= shift;
	my @roles				= @_;
	my $sqlCond				= '';
	
	if ($condition ne '')
	{
		$condition = "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and $condition";
	}
	else
	{
		$condition = "ADFRAME_CHANNEL='$ADFRAME_CHANNEL'";
	}
	
	if (@roles !=())
	{
		foreach my $k (@roles)
		{
			$sqlCond.= "$condition and ROLES like '%$k%' or ";
		}
		chop($sqlCond); 
		chop($sqlCond);
		chop($sqlCond); # or weg
	}
	else
	{
		$sqlCond = $condition;
	}
	#main::debug($sqlCond);
	return $this->getADFRAME_USER($sqlCond,$orderby,$start,$limit);
}

sub getUserCountWithConditionAndRole
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $condition			= shift;
	my @roles				= @_;
	my $sqlCond				= '';
	
	if ($condition ne '')
	{
		$condition = "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and $condition";
	}
	else
	{
		$condition = "ADFRAME_CHANNEL='$ADFRAME_CHANNEL'";
	}
	
	if (@roles !=())
	{
		foreach my $k (@roles)
		{
			$sqlCond.= "$condition and ROLES like '%$k,%' or ";
		}
		chop($sqlCond); 
		chop($sqlCond);
		chop($sqlCond); # or weg
	}
	else
	{
		$sqlCond = $condition;
	}
	return $this->getCountADFRAME_USER($sqlCond);
}

sub getUserIdByEmail
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $testemail			= shift;
	my $adframeUserId 		= $this->get('ADFRAME_USER','ADFRAME_USER_ID',"ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and EMAIL like '$testemail'"); 
	return $adframeUserId; 
}

sub getUserIdByLogin
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $LOGIN				= shift;
	my $PASSWD				= shift;
	my @roles				= @_;
	my $sqlCond				= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and LOGIN='$LOGIN' and PASSWD='$PASSWD'";
	
	foreach my $k (@roles)
	{
		$sqlCond.= " and ROLES like '%$k,%'";
	}
	my $adframeUserId 		= $this->get('ADFRAME_USER','ADFRAME_USER_ID',$sqlCond); 
	return $adframeUserId; 
}

sub getUserIdByLicencekey
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $LOGIN				= shift;
	my $LICENCEKEY			= shift;
	my @roles				= @_;
	my $sqlCond				= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and LOGIN='$LOGIN' and LICENCEKEY='$LICENCEKEY'";
	
	foreach my $k (@roles)
	{
		$sqlCond.= " and ROLES like '%$k,%'";
	}
	my $adframeUserId 		= $this->get('ADFRAME_USER','ADFRAME_USER_ID',$sqlCond); 
	return $adframeUserId; 
}

sub otherLoginExists
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $ADFRAME_USER_ID		= shift;
	my $LOGIN				= shift;
	my $sqlCond				= "ADFRAME_CHANNEL='$ADFRAME_CHANNEL' and ADFRAME_USER_ID<>$ADFRAME_USER_ID and LOGIN='$LOGIN'";
	my $adframeUserId 		= $this->get('ADFRAME_USER','ADFRAME_USER_ID',$sqlCond); 
	return $adframeUserId; 
}


sub deleteUser
{
	my $this				= shift;
	my $ADFRAME_CHANNEL		= shift;
	my $ADFRAME_USER_ID		= shift;
	my $ok					= 0;
	if ($ADFRAME_USER_ID>0)
	{
		my $user = new ClassADFRAME_USER($ADFRAME_CHANNEL);
		if ($user->initById($ADFRAME_USER_ID))
		{
			$user->setADFRAME_CHANNEL('DELETED_BY_ADFRAME_'.$user->getADFRAME_CHANNEL());
			$user->setFIRSTNAME('DELETED_BY_ADFRAME_'.$user->getFIRSTNAME());
			$user->setNAME('DELETED_BY_ADFRAME_'.$user->getNAME());
			$user->setLOGIN('');
			$user->setPASSWD('');
			$user->setADMIT(0);
			if ($user->save())
			{
				$ok = 1;
			}
		}
	}
	return $ok;
}
