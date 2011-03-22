package ClassFORUM_USER;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'FORUM_USER_ID,ADFRAME_USER_ID,FIRSTNAME,NAME,SHOW_NAME,EMAIL,AGE,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,ITEM_20,ITEM_21,ITEM_22,ITEM_23,ITEM_24,ITEM_25,ITEM_26,ITEM_27,ITEM_28,ITEM_29,IMAGE,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,CR_DATE,IS_ACTIVE';

sub getFORUM_USER_ID
{
	my $this	= shift;
	return $this->{col}->{'FORUM_USER_ID'};
}

sub setADFRAME_USER_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_USER_ID'} = shift;
}
sub getADFRAME_USER_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USER_ID'};
}

sub setFIRSTNAME
{
	my $this	= shift;
	$this->{col}->{'FIRSTNAME'} = shift;
}
sub getFIRSTNAME
{
	my $this	= shift;
	return $this->{col}->{'FIRSTNAME'};
}

sub setNAME
{
	my $this	= shift;
	$this->{col}->{'NAME'} = shift;
}
sub getNAME
{
	my $this	= shift;
	return $this->{col}->{'NAME'};
}

sub setSHOW_NAME
{
	my $this	= shift;
	$this->{col}->{'SHOW_NAME'} = shift;
}
sub getSHOW_NAME
{
	my $this	= shift;
	return $this->{col}->{'SHOW_NAME'};
}

sub setEMAIL
{
	my $this	= shift;
	$this->{col}->{'EMAIL'} = shift;
}
sub getEMAIL
{
	my $this	= shift;
	return $this->{col}->{'EMAIL'};
}

sub setAGE
{
	my $this	= shift;
	$this->{col}->{'AGE'} = shift;
}
sub getAGE
{
	my $this	= shift;
	return $this->{col}->{'AGE'};
}

sub setITEM_0
{
	my $this	= shift;
	$this->{col}->{'ITEM_0'} = shift;
}
sub getITEM_0
{
	my $this	= shift;
	return $this->{col}->{'ITEM_0'};
}

sub setITEM_1
{
	my $this	= shift;
	$this->{col}->{'ITEM_1'} = shift;
}
sub getITEM_1
{
	my $this	= shift;
	return $this->{col}->{'ITEM_1'};
}

sub setITEM_2
{
	my $this	= shift;
	$this->{col}->{'ITEM_2'} = shift;
}
sub getITEM_2
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2'};
}

sub setITEM_3
{
	my $this	= shift;
	$this->{col}->{'ITEM_3'} = shift;
}
sub getITEM_3
{
	my $this	= shift;
	return $this->{col}->{'ITEM_3'};
}

sub setITEM_4
{
	my $this	= shift;
	$this->{col}->{'ITEM_4'} = shift;
}
sub getITEM_4
{
	my $this	= shift;
	return $this->{col}->{'ITEM_4'};
}

sub setITEM_5
{
	my $this	= shift;
	$this->{col}->{'ITEM_5'} = shift;
}
sub getITEM_5
{
	my $this	= shift;
	return $this->{col}->{'ITEM_5'};
}

sub setITEM_6
{
	my $this	= shift;
	$this->{col}->{'ITEM_6'} = shift;
}
sub getITEM_6
{
	my $this	= shift;
	return $this->{col}->{'ITEM_6'};
}

sub setITEM_7
{
	my $this	= shift;
	$this->{col}->{'ITEM_7'} = shift;
}
sub getITEM_7
{
	my $this	= shift;
	return $this->{col}->{'ITEM_7'};
}

sub setITEM_8
{
	my $this	= shift;
	$this->{col}->{'ITEM_8'} = shift;
}
sub getITEM_8
{
	my $this	= shift;
	return $this->{col}->{'ITEM_8'};
}

sub setITEM_9
{
	my $this	= shift;
	$this->{col}->{'ITEM_9'} = shift;
}
sub getITEM_9
{
	my $this	= shift;
	return $this->{col}->{'ITEM_9'};
}

sub setITEM_10
{
	my $this	= shift;
	$this->{col}->{'ITEM_10'} = shift;
}
sub getITEM_10
{
	my $this	= shift;
	return $this->{col}->{'ITEM_10'};
}

sub setITEM_11
{
	my $this	= shift;
	$this->{col}->{'ITEM_11'} = shift;
}
sub getITEM_11
{
	my $this	= shift;
	return $this->{col}->{'ITEM_11'};
}

sub setITEM_12
{
	my $this	= shift;
	$this->{col}->{'ITEM_12'} = shift;
}
sub getITEM_12
{
	my $this	= shift;
	return $this->{col}->{'ITEM_12'};
}

sub setITEM_13
{
	my $this	= shift;
	$this->{col}->{'ITEM_13'} = shift;
}
sub getITEM_13
{
	my $this	= shift;
	return $this->{col}->{'ITEM_13'};
}

sub setITEM_14
{
	my $this	= shift;
	$this->{col}->{'ITEM_14'} = shift;
}
sub getITEM_14
{
	my $this	= shift;
	return $this->{col}->{'ITEM_14'};
}

sub setITEM_15
{
	my $this	= shift;
	$this->{col}->{'ITEM_15'} = shift;
}
sub getITEM_15
{
	my $this	= shift;
	return $this->{col}->{'ITEM_15'};
}

sub setITEM_16
{
	my $this	= shift;
	$this->{col}->{'ITEM_16'} = shift;
}
sub getITEM_16
{
	my $this	= shift;
	return $this->{col}->{'ITEM_16'};
}

sub setITEM_17
{
	my $this	= shift;
	$this->{col}->{'ITEM_17'} = shift;
}
sub getITEM_17
{
	my $this	= shift;
	return $this->{col}->{'ITEM_17'};
}

sub setITEM_18
{
	my $this	= shift;
	$this->{col}->{'ITEM_18'} = shift;
}
sub getITEM_18
{
	my $this	= shift;
	return $this->{col}->{'ITEM_18'};
}

sub setITEM_19
{
	my $this	= shift;
	$this->{col}->{'ITEM_19'} = shift;
}
sub getITEM_19
{
	my $this	= shift;
	return $this->{col}->{'ITEM_19'};
}

sub setITEM_20
{
	my $this	= shift;
	$this->{col}->{'ITEM_20'} = shift;
}
sub getITEM_20
{
	my $this	= shift;
	return $this->{col}->{'ITEM_20'};
}

sub setITEM_21
{
	my $this	= shift;
	$this->{col}->{'ITEM_21'} = shift;
}
sub getITEM_21
{
	my $this	= shift;
	return $this->{col}->{'ITEM_21'};
}

sub setITEM_22
{
	my $this	= shift;
	$this->{col}->{'ITEM_22'} = shift;
}
sub getITEM_22
{
	my $this	= shift;
	return $this->{col}->{'ITEM_22'};
}

sub setITEM_23
{
	my $this	= shift;
	$this->{col}->{'ITEM_23'} = shift;
}
sub getITEM_23
{
	my $this	= shift;
	return $this->{col}->{'ITEM_23'};
}

sub setITEM_24
{
	my $this	= shift;
	$this->{col}->{'ITEM_24'} = shift;
}
sub getITEM_24
{
	my $this	= shift;
	return $this->{col}->{'ITEM_24'};
}

sub setITEM_25
{
	my $this	= shift;
	$this->{col}->{'ITEM_25'} = shift;
}
sub getITEM_25
{
	my $this	= shift;
	return $this->{col}->{'ITEM_25'};
}

sub setITEM_26
{
	my $this	= shift;
	$this->{col}->{'ITEM_26'} = shift;
}
sub getITEM_26
{
	my $this	= shift;
	return $this->{col}->{'ITEM_26'};
}

sub setITEM_27
{
	my $this	= shift;
	$this->{col}->{'ITEM_27'} = shift;
}
sub getITEM_27
{
	my $this	= shift;
	return $this->{col}->{'ITEM_27'};
}

sub setITEM_28
{
	my $this	= shift;
	$this->{col}->{'ITEM_28'} = shift;
}
sub getITEM_28
{
	my $this	= shift;
	return $this->{col}->{'ITEM_28'};
}

sub setITEM_29
{
	my $this	= shift;
	$this->{col}->{'ITEM_29'} = shift;
}
sub getITEM_29
{
	my $this	= shift;
	return $this->{col}->{'ITEM_29'};
}

sub setIMAGE
{
	my $this	= shift;
	$this->{col}->{'IMAGE'} = shift;
}
sub getIMAGE
{
	my $this	= shift;
	return $this->{col}->{'IMAGE'};
}

sub setIMAGE_1
{
	my $this	= shift;
	$this->{col}->{'IMAGE_1'} = shift;
}
sub getIMAGE_1
{
	my $this	= shift;
	return $this->{col}->{'IMAGE_1'};
}

sub setIMAGE_2
{
	my $this	= shift;
	$this->{col}->{'IMAGE_2'} = shift;
}
sub getIMAGE_2
{
	my $this	= shift;
	return $this->{col}->{'IMAGE_2'};
}

sub setIMAGE_3
{
	my $this	= shift;
	$this->{col}->{'IMAGE_3'} = shift;
}
sub getIMAGE_3
{
	my $this	= shift;
	return $this->{col}->{'IMAGE_3'};
}

sub setLAST_LOGIN
{
	my $this	= shift;
	$this->{col}->{'LAST_LOGIN'} = shift;
}
sub getLAST_LOGIN
{
	my $this	= shift;
	return $this->{col}->{'LAST_LOGIN'};
}

sub setLOGIN_COUNT
{
	my $this	= shift;
	$this->{col}->{'LOGIN_COUNT'} = shift;
}
sub getLOGIN_COUNT
{
	my $this	= shift;
	return $this->{col}->{'LOGIN_COUNT'};
}

sub setLAST_VIEW
{
	my $this	= shift;
	$this->{col}->{'LAST_VIEW'} = shift;
}
sub getLAST_VIEW
{
	my $this	= shift;
	return $this->{col}->{'LAST_VIEW'};
}

sub setVIEW_COUNT
{
	my $this	= shift;
	$this->{col}->{'VIEW_COUNT'} = shift;
}
sub getVIEW_COUNT
{
	my $this	= shift;
	return $this->{col}->{'VIEW_COUNT'};
}

sub setCR_DATE
{
	my $this	= shift;
	$this->{col}->{'CR_DATE'} = shift;
}
sub getCR_DATE
{
	my $this	= shift;
	return $this->{col}->{'CR_DATE'};
}

sub setIS_ACTIVE
{
	my $this	= shift;
	$this->{col}->{'IS_ACTIVE'} = shift;
}
sub getIS_ACTIVE
{
	my $this	= shift;
	return $this->{col}->{'IS_ACTIVE'};
}



sub save
{
	my $this	= shift;
	if ($this->{col}->{'FORUM_USER_ID'}<1)
	{
		my @values = ();
		my $valueFORUM_USER_ID = "NULL";
		$valueFORUM_USER_ID =~ s/\'/\\\'/g;
		if ($valueFORUM_USER_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueFORUM_USER_ID");
		}

		my $valueADFRAME_USER_ID = $this->{col}->{ADFRAME_USER_ID};
		$valueADFRAME_USER_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_USER_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USER_ID");
		}

		my $valueFIRSTNAME = $this->{col}->{FIRSTNAME};
		$valueFIRSTNAME =~ s/\'/\\\'/g;
		if ($valueFIRSTNAME eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueFIRSTNAME'");
		}

		my $valueNAME = $this->{col}->{NAME};
		$valueNAME =~ s/\'/\\\'/g;
		if ($valueNAME eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueNAME'");
		}

		my $valueSHOW_NAME = $this->{col}->{SHOW_NAME};
		$valueSHOW_NAME =~ s/\'/\\\'/g;
		if ($valueSHOW_NAME eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSHOW_NAME'");
		}

		my $valueEMAIL = $this->{col}->{EMAIL};
		$valueEMAIL =~ s/\'/\\\'/g;
		if ($valueEMAIL eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEMAIL'");
		}

		my $valueAGE = $this->{col}->{AGE};
		$valueAGE =~ s/\'/\\\'/g;
		if ($valueAGE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueAGE'");
		}

		my $valueITEM_0 = $this->{col}->{ITEM_0};
		$valueITEM_0 =~ s/\'/\\\'/g;
		if ($valueITEM_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_0'");
		}

		my $valueITEM_1 = $this->{col}->{ITEM_1};
		$valueITEM_1 =~ s/\'/\\\'/g;
		if ($valueITEM_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_1'");
		}

		my $valueITEM_2 = $this->{col}->{ITEM_2};
		$valueITEM_2 =~ s/\'/\\\'/g;
		if ($valueITEM_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2'");
		}

		my $valueITEM_3 = $this->{col}->{ITEM_3};
		$valueITEM_3 =~ s/\'/\\\'/g;
		if ($valueITEM_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_3'");
		}

		my $valueITEM_4 = $this->{col}->{ITEM_4};
		$valueITEM_4 =~ s/\'/\\\'/g;
		if ($valueITEM_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_4'");
		}

		my $valueITEM_5 = $this->{col}->{ITEM_5};
		$valueITEM_5 =~ s/\'/\\\'/g;
		if ($valueITEM_5 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_5'");
		}

		my $valueITEM_6 = $this->{col}->{ITEM_6};
		$valueITEM_6 =~ s/\'/\\\'/g;
		if ($valueITEM_6 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_6'");
		}

		my $valueITEM_7 = $this->{col}->{ITEM_7};
		$valueITEM_7 =~ s/\'/\\\'/g;
		if ($valueITEM_7 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_7'");
		}

		my $valueITEM_8 = $this->{col}->{ITEM_8};
		$valueITEM_8 =~ s/\'/\\\'/g;
		if ($valueITEM_8 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_8'");
		}

		my $valueITEM_9 = $this->{col}->{ITEM_9};
		$valueITEM_9 =~ s/\'/\\\'/g;
		if ($valueITEM_9 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_9'");
		}

		my $valueITEM_10 = $this->{col}->{ITEM_10};
		$valueITEM_10 =~ s/\'/\\\'/g;
		if ($valueITEM_10 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_10'");
		}

		my $valueITEM_11 = $this->{col}->{ITEM_11};
		$valueITEM_11 =~ s/\'/\\\'/g;
		if ($valueITEM_11 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_11'");
		}

		my $valueITEM_12 = $this->{col}->{ITEM_12};
		$valueITEM_12 =~ s/\'/\\\'/g;
		if ($valueITEM_12 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_12'");
		}

		my $valueITEM_13 = $this->{col}->{ITEM_13};
		$valueITEM_13 =~ s/\'/\\\'/g;
		if ($valueITEM_13 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_13'");
		}

		my $valueITEM_14 = $this->{col}->{ITEM_14};
		$valueITEM_14 =~ s/\'/\\\'/g;
		if ($valueITEM_14 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_14'");
		}

		my $valueITEM_15 = $this->{col}->{ITEM_15};
		$valueITEM_15 =~ s/\'/\\\'/g;
		if ($valueITEM_15 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_15'");
		}

		my $valueITEM_16 = $this->{col}->{ITEM_16};
		$valueITEM_16 =~ s/\'/\\\'/g;
		if ($valueITEM_16 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_16'");
		}

		my $valueITEM_17 = $this->{col}->{ITEM_17};
		$valueITEM_17 =~ s/\'/\\\'/g;
		if ($valueITEM_17 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_17'");
		}

		my $valueITEM_18 = $this->{col}->{ITEM_18};
		$valueITEM_18 =~ s/\'/\\\'/g;
		if ($valueITEM_18 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_18'");
		}

		my $valueITEM_19 = $this->{col}->{ITEM_19};
		$valueITEM_19 =~ s/\'/\\\'/g;
		if ($valueITEM_19 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_19'");
		}

		my $valueITEM_20 = $this->{col}->{ITEM_20};
		$valueITEM_20 =~ s/\'/\\\'/g;
		if ($valueITEM_20 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_20'");
		}

		my $valueITEM_21 = $this->{col}->{ITEM_21};
		$valueITEM_21 =~ s/\'/\\\'/g;
		if ($valueITEM_21 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_21'");
		}

		my $valueITEM_22 = $this->{col}->{ITEM_22};
		$valueITEM_22 =~ s/\'/\\\'/g;
		if ($valueITEM_22 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_22'");
		}

		my $valueITEM_23 = $this->{col}->{ITEM_23};
		$valueITEM_23 =~ s/\'/\\\'/g;
		if ($valueITEM_23 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_23'");
		}

		my $valueITEM_24 = $this->{col}->{ITEM_24};
		$valueITEM_24 =~ s/\'/\\\'/g;
		if ($valueITEM_24 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_24'");
		}

		my $valueITEM_25 = $this->{col}->{ITEM_25};
		$valueITEM_25 =~ s/\'/\\\'/g;
		if ($valueITEM_25 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_25'");
		}

		my $valueITEM_26 = $this->{col}->{ITEM_26};
		$valueITEM_26 =~ s/\'/\\\'/g;
		if ($valueITEM_26 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_26'");
		}

		my $valueITEM_27 = $this->{col}->{ITEM_27};
		$valueITEM_27 =~ s/\'/\\\'/g;
		if ($valueITEM_27 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_27'");
		}

		my $valueITEM_28 = $this->{col}->{ITEM_28};
		$valueITEM_28 =~ s/\'/\\\'/g;
		if ($valueITEM_28 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_28'");
		}

		my $valueITEM_29 = $this->{col}->{ITEM_29};
		$valueITEM_29 =~ s/\'/\\\'/g;
		if ($valueITEM_29 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_29'");
		}

		my $valueIMAGE = $this->{col}->{IMAGE};
		$valueIMAGE =~ s/\'/\\\'/g;
		if ($valueIMAGE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE'");
		}

		my $valueIMAGE_1 = $this->{col}->{IMAGE_1};
		$valueIMAGE_1 =~ s/\'/\\\'/g;
		if ($valueIMAGE_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_1'");
		}

		my $valueIMAGE_2 = $this->{col}->{IMAGE_2};
		$valueIMAGE_2 =~ s/\'/\\\'/g;
		if ($valueIMAGE_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_2'");
		}

		my $valueIMAGE_3 = $this->{col}->{IMAGE_3};
		$valueIMAGE_3 =~ s/\'/\\\'/g;
		if ($valueIMAGE_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_3'");
		}

		my $valueLAST_LOGIN = $this->{col}->{LAST_LOGIN};
		$valueLAST_LOGIN =~ s/\'/\\\'/g;
		if ($valueLAST_LOGIN eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueLAST_LOGIN'");
		}

		my $valueLOGIN_COUNT = $this->{col}->{LOGIN_COUNT};
		$valueLOGIN_COUNT =~ s/\'/\\\'/g;
		if ($valueLOGIN_COUNT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueLOGIN_COUNT");
		}

		my $valueLAST_VIEW = $this->{col}->{LAST_VIEW};
		$valueLAST_VIEW =~ s/\'/\\\'/g;
		if ($valueLAST_VIEW eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueLAST_VIEW'");
		}

		my $valueVIEW_COUNT = $this->{col}->{VIEW_COUNT};
		$valueVIEW_COUNT =~ s/\'/\\\'/g;
		if ($valueVIEW_COUNT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueVIEW_COUNT");
		}

		my $valueCR_DATE = $this->{col}->{CR_DATE};
		$valueCR_DATE =~ s/\'/\\\'/g;
		if ($valueCR_DATE eq "")
		{
			push(@values,"now()");
		}
		else
		{
			push(@values,"'$valueCR_DATE'");
		}

		my $valueIS_ACTIVE = $this->{col}->{IS_ACTIVE};
		$valueIS_ACTIVE =~ s/\'/\\\'/g;
		if ($valueIS_ACTIVE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueIS_ACTIVE");
		}


		$this->{col}->{'FORUM_USER_ID'} = $this->insert('FORUM_USER','FORUM_USER_ID,ADFRAME_USER_ID,FIRSTNAME,NAME,SHOW_NAME,EMAIL,AGE,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,ITEM_20,ITEM_21,ITEM_22,ITEM_23,ITEM_24,ITEM_25,ITEM_26,ITEM_27,ITEM_28,ITEM_29,IMAGE,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'FORUM_USER_ID'};
	}
	elsif ($this->{col}->{'FORUM_USER_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ADFRAME_USER_ID=$value","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID=$value with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'FIRSTNAME'})
		{
			my $value = $this->{col}->{'FIRSTNAME'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"FIRSTNAME='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update FIRSTNAME='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'NAME'})
		{
			my $value = $this->{col}->{'NAME'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"NAME='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update NAME='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_NAME'})
		{
			my $value = $this->{col}->{'SHOW_NAME'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"SHOW_NAME='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SHOW_NAME='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'EMAIL'})
		{
			my $value = $this->{col}->{'EMAIL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"EMAIL='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update EMAIL='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'AGE'})
		{
			my $value = $this->{col}->{'AGE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"AGE='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update AGE='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_0'})
		{
			my $value = $this->{col}->{'ITEM_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_0='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_0='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1'})
		{
			my $value = $this->{col}->{'ITEM_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_1='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2'})
		{
			my $value = $this->{col}->{'ITEM_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_2='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3'})
		{
			my $value = $this->{col}->{'ITEM_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_3='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_4'})
		{
			my $value = $this->{col}->{'ITEM_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_4='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_4='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_5'})
		{
			my $value = $this->{col}->{'ITEM_5'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_5='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_5='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_6'})
		{
			my $value = $this->{col}->{'ITEM_6'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_6='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_6='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_7'})
		{
			my $value = $this->{col}->{'ITEM_7'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_7='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_7='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_8'})
		{
			my $value = $this->{col}->{'ITEM_8'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_8='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_8='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_9'})
		{
			my $value = $this->{col}->{'ITEM_9'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_9='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_9='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_10'})
		{
			my $value = $this->{col}->{'ITEM_10'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_10='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_10='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_11'})
		{
			my $value = $this->{col}->{'ITEM_11'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_11='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_11='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_12'})
		{
			my $value = $this->{col}->{'ITEM_12'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_12='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_12='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_13'})
		{
			my $value = $this->{col}->{'ITEM_13'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_13='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_13='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_14'})
		{
			my $value = $this->{col}->{'ITEM_14'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_14='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_14='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_15'})
		{
			my $value = $this->{col}->{'ITEM_15'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_15='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_15='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_16'})
		{
			my $value = $this->{col}->{'ITEM_16'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_16='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_16='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_17'})
		{
			my $value = $this->{col}->{'ITEM_17'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_17='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_17='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_18'})
		{
			my $value = $this->{col}->{'ITEM_18'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_18='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_18='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_19'})
		{
			my $value = $this->{col}->{'ITEM_19'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_19='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_19='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_20'})
		{
			my $value = $this->{col}->{'ITEM_20'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_20='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_20='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_21'})
		{
			my $value = $this->{col}->{'ITEM_21'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_21='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_21='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_22'})
		{
			my $value = $this->{col}->{'ITEM_22'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_22='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_22='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_23'})
		{
			my $value = $this->{col}->{'ITEM_23'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_23='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_23='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_24'})
		{
			my $value = $this->{col}->{'ITEM_24'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_24='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_24='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_25'})
		{
			my $value = $this->{col}->{'ITEM_25'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_25='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_25='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_26'})
		{
			my $value = $this->{col}->{'ITEM_26'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_26='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_26='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_27'})
		{
			my $value = $this->{col}->{'ITEM_27'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_27='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_27='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_28'})
		{
			my $value = $this->{col}->{'ITEM_28'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_28='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_28='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_29'})
		{
			my $value = $this->{col}->{'ITEM_29'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"ITEM_29='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_29='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE'})
		{
			my $value = $this->{col}->{'IMAGE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"IMAGE='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_1'})
		{
			my $value = $this->{col}->{'IMAGE_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"IMAGE_1='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE_1='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_2'})
		{
			my $value = $this->{col}->{'IMAGE_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"IMAGE_2='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE_2='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_3'})
		{
			my $value = $this->{col}->{'IMAGE_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"IMAGE_3='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE_3='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LAST_LOGIN'})
		{
			my $value = $this->{col}->{'LAST_LOGIN'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"LAST_LOGIN='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update LAST_LOGIN='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LOGIN_COUNT'})
		{
			my $value = $this->{col}->{'LOGIN_COUNT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"LOGIN_COUNT=$value","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update LOGIN_COUNT=$value with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LAST_VIEW'})
		{
			my $value = $this->{col}->{'LAST_VIEW'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"LAST_VIEW='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update LAST_VIEW='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEW_COUNT'})
		{
			my $value = $this->{col}->{'VIEW_COUNT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"VIEW_COUNT=$value","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIEW_COUNT=$value with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"CR_DATE='$value'","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('FORUM_USER',"IS_ACTIVE=$value","FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
			}
		}


		
		return $this->{col}->{'FORUM_USER_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('FORUM_USER',"$SQL_COLS","FORUM_USER_ID=$id"));
		if ($data[0] ne '')
		{
			my @colKeys = split(/,/, $SQL_COLS);
			for (my $i=0;$i<=$#colKeys;$i++)
			{
				$this->{col}->{"$colKeys[$i]"} = $data[$i];
				#eval($this.'->set'.$colKeys[$i].'('..');');
			}
			return 1;
		}
		else
		{
			$this->addErrorMessage('Cannot create Object, data empty!');
		}
	}
	else
	{
		$this->addErrorMessage('Cannot create Object at initById() - FORUM_USER_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('FORUM_USER','FORUM_USER_ID',"$condition");
	if ($ids[1]>0)
	{
		$this->addErrorMessage("Multiple datasets found with Condition $condition at initByCondition()");
	}
	else
	{
		if ($this->initById($ids[0]))
		{
			return $ids[0];
		}
	}
	return 0;
}

sub getDataHash
{
	my $this		= shift;
	return %{ $this->{col} };
}
sub getDataHashRef
{
	my $this		= shift;
	return $this->{col};
}

sub setValue
{
	my $this		= shift;
	my $key			= shift;
	my $value		= shift;
	$this->{col}->{"$key"} = $value;
}
sub getValue
{
	my $this		= shift;
	my $key			= shift;
	return $this->{col}->{"$key"};
}

sub deleteFromDB
{
	my $this		= shift;
	if ($this->{col}->{'FORUM_USER_ID'}>0)
	{
		$this->delete('FORUM_USER',"FORUM_USER_ID=$this->{col}->{'FORUM_USER_ID'}");
		return 1;
	}
	else
	{
		$this->addErrorMessage('PK-Value not set, cannot delete Dataset!');
	}
	return 0;
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
	$this->{errormessage}.='ClassFORUM_USER: '.$mess.'\n';   
}
sub setFORUM_USER_ID
{
	my $this	= shift;
	my $FORUM_USER_ID = shift;
	if ($this->{col}->{'FORUM_USER_ID'} < 1)
	{
		$this->{col}->{'FORUM_USER_ID'} = $FORUM_USER_ID;
	}
}

1;
__END__

=head1 NAME ClassFORUM_USER

=head2 extends DbAdapter

=head1 METHODS

 getFORUM_USER_ID

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setFIRSTNAME(String: value)
 getFIRSTNAME()

 setNAME(String: value)
 getNAME()

 setSHOW_NAME(String: value)
 getSHOW_NAME()

 setEMAIL(String: value)
 getEMAIL()

 setAGE(String: value)
 getAGE()

 setITEM_0(String: value)
 getITEM_0()

 setITEM_1(String: value)
 getITEM_1()

 setITEM_2(String: value)
 getITEM_2()

 setITEM_3(String: value)
 getITEM_3()

 setITEM_4(String: value)
 getITEM_4()

 setITEM_5(String: value)
 getITEM_5()

 setITEM_6(String: value)
 getITEM_6()

 setITEM_7(String: value)
 getITEM_7()

 setITEM_8(String: value)
 getITEM_8()

 setITEM_9(String: value)
 getITEM_9()

 setITEM_10(String: value)
 getITEM_10()

 setITEM_11(String: value)
 getITEM_11()

 setITEM_12(String: value)
 getITEM_12()

 setITEM_13(String: value)
 getITEM_13()

 setITEM_14(String: value)
 getITEM_14()

 setITEM_15(String: value)
 getITEM_15()

 setITEM_16(String: value)
 getITEM_16()

 setITEM_17(String: value)
 getITEM_17()

 setITEM_18(String: value)
 getITEM_18()

 setITEM_19(String: value)
 getITEM_19()

 setITEM_20(String: value)
 getITEM_20()

 setITEM_21(String: value)
 getITEM_21()

 setITEM_22(String: value)
 getITEM_22()

 setITEM_23(String: value)
 getITEM_23()

 setITEM_24(String: value)
 getITEM_24()

 setITEM_25(String: value)
 getITEM_25()

 setITEM_26(String: value)
 getITEM_26()

 setITEM_27(String: value)
 getITEM_27()

 setITEM_28(String: value)
 getITEM_28()

 setITEM_29(String: value)
 getITEM_29()

 setIMAGE(String: value)
 getIMAGE()

 setIMAGE_1(String: value)
 getIMAGE_1()

 setIMAGE_2(String: value)
 getIMAGE_2()

 setIMAGE_3(String: value)
 getIMAGE_3()

 setLAST_LOGIN(String: value)
 getLAST_LOGIN()

 setLOGIN_COUNT(String: value)
 getLOGIN_COUNT()

 setLAST_VIEW(String: value)
 getLAST_VIEW()

 setVIEW_COUNT(String: value)
 getVIEW_COUNT()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 