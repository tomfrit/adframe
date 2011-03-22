package ClassADFRAME_FORUM;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_FORUM_ID,ADFRAME_CHANNEL,AREA,ADFRAME_FORUMCATEGORY_ID,ADFRAME_USER_ID,REF_ADFRAME_FORUM_ID,SUBJECT,COMMENT,URL,NAME,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,TEXT_0,IMG_0,IMG_1,IMG_2,UP_DATE,END_DATE,CR_DATE,IS_ACTIVE';

sub getADFRAME_FORUM_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_FORUM_ID'};
}

sub setADFRAME_CHANNEL
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_CHANNEL'} = shift;
}
sub getADFRAME_CHANNEL
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_CHANNEL'};
}

sub setAREA
{
	my $this	= shift;
	$this->{col}->{'AREA'} = shift;
}
sub getAREA
{
	my $this	= shift;
	return $this->{col}->{'AREA'};
}

sub setADFRAME_FORUMCATEGORY_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_FORUMCATEGORY_ID'} = shift;
}
sub getADFRAME_FORUMCATEGORY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_FORUMCATEGORY_ID'};
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

sub setREF_ADFRAME_FORUM_ID
{
	my $this	= shift;
	$this->{col}->{'REF_ADFRAME_FORUM_ID'} = shift;
}
sub getREF_ADFRAME_FORUM_ID
{
	my $this	= shift;
	return $this->{col}->{'REF_ADFRAME_FORUM_ID'};
}

sub setSUBJECT
{
	my $this	= shift;
	$this->{col}->{'SUBJECT'} = shift;
}
sub getSUBJECT
{
	my $this	= shift;
	return $this->{col}->{'SUBJECT'};
}

sub setCOMMENT
{
	my $this	= shift;
	$this->{col}->{'COMMENT'} = shift;
}
sub getCOMMENT
{
	my $this	= shift;
	return $this->{col}->{'COMMENT'};
}

sub setURL
{
	my $this	= shift;
	$this->{col}->{'URL'} = shift;
}
sub getURL
{
	my $this	= shift;
	return $this->{col}->{'URL'};
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

sub setTEXT_0
{
	my $this	= shift;
	$this->{col}->{'TEXT_0'} = shift;
}
sub getTEXT_0
{
	my $this	= shift;
	return $this->{col}->{'TEXT_0'};
}

sub setIMG_0
{
	my $this	= shift;
	$this->{col}->{'IMG_0'} = shift;
}
sub getIMG_0
{
	my $this	= shift;
	return $this->{col}->{'IMG_0'};
}

sub setIMG_1
{
	my $this	= shift;
	$this->{col}->{'IMG_1'} = shift;
}
sub getIMG_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_1'};
}

sub setIMG_2
{
	my $this	= shift;
	$this->{col}->{'IMG_2'} = shift;
}
sub getIMG_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_2'};
}

sub setUP_DATE
{
	my $this	= shift;
	$this->{col}->{'UP_DATE'} = shift;
}
sub getUP_DATE
{
	my $this	= shift;
	return $this->{col}->{'UP_DATE'};
}

sub setEND_DATE
{
	my $this	= shift;
	$this->{col}->{'END_DATE'} = shift;
}
sub getEND_DATE
{
	my $this	= shift;
	return $this->{col}->{'END_DATE'};
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
	if ($this->{col}->{'ADFRAME_FORUM_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_FORUM_ID = "NULL";
		$valueADFRAME_FORUM_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_FORUM_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_FORUM_ID");
		}

		my $valueADFRAME_CHANNEL = $this->{col}->{ADFRAME_CHANNEL};
		$valueADFRAME_CHANNEL =~ s/\'/\\\'/g;
		if ($valueADFRAME_CHANNEL eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueADFRAME_CHANNEL'");
		}

		my $valueAREA = $this->{col}->{AREA};
		$valueAREA =~ s/\'/\\\'/g;
		if ($valueAREA eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueAREA'");
		}

		my $valueADFRAME_FORUMCATEGORY_ID = $this->{col}->{ADFRAME_FORUMCATEGORY_ID};
		$valueADFRAME_FORUMCATEGORY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_FORUMCATEGORY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_FORUMCATEGORY_ID");
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

		my $valueREF_ADFRAME_FORUM_ID = $this->{col}->{REF_ADFRAME_FORUM_ID};
		$valueREF_ADFRAME_FORUM_ID =~ s/\'/\\\'/g;
		if ($valueREF_ADFRAME_FORUM_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueREF_ADFRAME_FORUM_ID");
		}

		my $valueSUBJECT = $this->{col}->{SUBJECT};
		$valueSUBJECT =~ s/\'/\\\'/g;
		if ($valueSUBJECT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSUBJECT'");
		}

		my $valueCOMMENT = $this->{col}->{COMMENT};
		$valueCOMMENT =~ s/\'/\\\'/g;
		if ($valueCOMMENT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCOMMENT'");
		}

		my $valueURL = $this->{col}->{URL};
		$valueURL =~ s/\'/\\\'/g;
		if ($valueURL eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueURL'");
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

		my $valueTEXT_0 = $this->{col}->{TEXT_0};
		$valueTEXT_0 =~ s/\'/\\\'/g;
		if ($valueTEXT_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_0'");
		}

		my $valueIMG_0 = $this->{col}->{IMG_0};
		$valueIMG_0 =~ s/\'/\\\'/g;
		if ($valueIMG_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_0'");
		}

		my $valueIMG_1 = $this->{col}->{IMG_1};
		$valueIMG_1 =~ s/\'/\\\'/g;
		if ($valueIMG_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_1'");
		}

		my $valueIMG_2 = $this->{col}->{IMG_2};
		$valueIMG_2 =~ s/\'/\\\'/g;
		if ($valueIMG_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_2'");
		}

		my $valueUP_DATE = $this->{col}->{UP_DATE};
		$valueUP_DATE =~ s/\'/\\\'/g;
		if ($valueUP_DATE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueUP_DATE'");
		}

		my $valueEND_DATE = $this->{col}->{END_DATE};
		$valueEND_DATE =~ s/\'/\\\'/g;
		if ($valueEND_DATE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEND_DATE'");
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


		$this->{col}->{'ADFRAME_FORUM_ID'} = $this->insert('ADFRAME_FORUM','ADFRAME_FORUM_ID,ADFRAME_CHANNEL,AREA,ADFRAME_FORUMCATEGORY_ID,ADFRAME_USER_ID,REF_ADFRAME_FORUM_ID,SUBJECT,COMMENT,URL,NAME,ITEM_0,ITEM_1,ITEM_2,ITEM_3,ITEM_4,ITEM_5,ITEM_6,ITEM_7,ITEM_8,ITEM_9,ITEM_10,ITEM_11,ITEM_12,ITEM_13,ITEM_14,ITEM_15,ITEM_16,ITEM_17,ITEM_18,ITEM_19,TEXT_0,IMG_0,IMG_1,IMG_2,UP_DATE,END_DATE,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_FORUM_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_FORUM_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ADFRAME_CHANNEL='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'AREA'})
		{
			my $value = $this->{col}->{'AREA'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"AREA='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update AREA='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_FORUMCATEGORY_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_FORUMCATEGORY_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ADFRAME_FORUMCATEGORY_ID=$value","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_FORUMCATEGORY_ID=$value with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ADFRAME_USER_ID=$value","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID=$value with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'REF_ADFRAME_FORUM_ID'})
		{
			my $value = $this->{col}->{'REF_ADFRAME_FORUM_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"REF_ADFRAME_FORUM_ID=$value","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update REF_ADFRAME_FORUM_ID=$value with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'SUBJECT'})
		{
			my $value = $this->{col}->{'SUBJECT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"SUBJECT='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SUBJECT='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'COMMENT'})
		{
			my $value = $this->{col}->{'COMMENT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"COMMENT='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COMMENT='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'URL'})
		{
			my $value = $this->{col}->{'URL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"URL='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update URL='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'NAME'})
		{
			my $value = $this->{col}->{'NAME'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"NAME='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update NAME='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_0'})
		{
			my $value = $this->{col}->{'ITEM_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_0='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_0='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1'})
		{
			my $value = $this->{col}->{'ITEM_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_1='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2'})
		{
			my $value = $this->{col}->{'ITEM_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_2='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3'})
		{
			my $value = $this->{col}->{'ITEM_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_3='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_4'})
		{
			my $value = $this->{col}->{'ITEM_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_4='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_4='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_5'})
		{
			my $value = $this->{col}->{'ITEM_5'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_5='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_5='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_6'})
		{
			my $value = $this->{col}->{'ITEM_6'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_6='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_6='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_7'})
		{
			my $value = $this->{col}->{'ITEM_7'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_7='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_7='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_8'})
		{
			my $value = $this->{col}->{'ITEM_8'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_8='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_8='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_9'})
		{
			my $value = $this->{col}->{'ITEM_9'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_9='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_9='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_10'})
		{
			my $value = $this->{col}->{'ITEM_10'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_10='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_10='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_11'})
		{
			my $value = $this->{col}->{'ITEM_11'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_11='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_11='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_12'})
		{
			my $value = $this->{col}->{'ITEM_12'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_12='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_12='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_13'})
		{
			my $value = $this->{col}->{'ITEM_13'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_13='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_13='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_14'})
		{
			my $value = $this->{col}->{'ITEM_14'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_14='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_14='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_15'})
		{
			my $value = $this->{col}->{'ITEM_15'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_15='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_15='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_16'})
		{
			my $value = $this->{col}->{'ITEM_16'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_16='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_16='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_17'})
		{
			my $value = $this->{col}->{'ITEM_17'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_17='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_17='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_18'})
		{
			my $value = $this->{col}->{'ITEM_18'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_18='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_18='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_19'})
		{
			my $value = $this->{col}->{'ITEM_19'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"ITEM_19='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_19='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_0'})
		{
			my $value = $this->{col}->{'TEXT_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"TEXT_0='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_0='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_0'})
		{
			my $value = $this->{col}->{'IMG_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"IMG_0='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_0='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_1'})
		{
			my $value = $this->{col}->{'IMG_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"IMG_1='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_1='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_2'})
		{
			my $value = $this->{col}->{'IMG_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"IMG_2='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_2='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'UP_DATE'})
		{
			my $value = $this->{col}->{'UP_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"UP_DATE='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update UP_DATE='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'END_DATE'})
		{
			my $value = $this->{col}->{'END_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"END_DATE='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update END_DATE='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"CR_DATE='$value'","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FORUM',"IS_ACTIVE=$value","ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_FORUM_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_FORUM',"$SQL_COLS","ADFRAME_FORUM_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_FORUM_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_FORUM','ADFRAME_FORUM_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_FORUM_ID'}>0)
	{
		$this->delete('ADFRAME_FORUM',"ADFRAME_FORUM_ID=$this->{col}->{'ADFRAME_FORUM_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_FORUM: '.$mess.'\n';   
}
sub setADFRAME_FORUM_ID
{
	my $this	= shift;
	my $ADFRAME_FORUM_ID = shift;
	if ($this->{col}->{'ADFRAME_FORUM_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_FORUM_ID'} = $ADFRAME_FORUM_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_FORUM

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_FORUM_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setAREA(String: value)
 getAREA()

 setADFRAME_FORUMCATEGORY_ID(String: value)
 getADFRAME_FORUMCATEGORY_ID()

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setREF_ADFRAME_FORUM_ID(String: value)
 getREF_ADFRAME_FORUM_ID()

 setSUBJECT(String: value)
 getSUBJECT()

 setCOMMENT(String: value)
 getCOMMENT()

 setURL(String: value)
 getURL()

 setNAME(String: value)
 getNAME()

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

 setTEXT_0(String: value)
 getTEXT_0()

 setIMG_0(String: value)
 getIMG_0()

 setIMG_1(String: value)
 getIMG_1()

 setIMG_2(String: value)
 getIMG_2()

 setUP_DATE(String: value)
 getUP_DATE()

 setEND_DATE(String: value)
 getEND_DATE()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 