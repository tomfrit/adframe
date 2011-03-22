package ClassADFRAME_DATES;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_DATES_ID,ADFRAME_CHANNEL,AREA,ADFRAME_DATESCATEGORY_ID,START_DATE,END_DATE,START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,CR_DATE,IS_ACTIVE';

sub getADFRAME_DATES_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_DATES_ID'};
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

sub setADFRAME_DATESCATEGORY_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_DATESCATEGORY_ID'} = shift;
}
sub getADFRAME_DATESCATEGORY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_DATESCATEGORY_ID'};
}

sub setSTART_DATE
{
	my $this	= shift;
	$this->{col}->{'START_DATE'} = shift;
}
sub getSTART_DATE
{
	my $this	= shift;
	return $this->{col}->{'START_DATE'};
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

sub setSTART_TIME
{
	my $this	= shift;
	$this->{col}->{'START_TIME'} = shift;
}
sub getSTART_TIME
{
	my $this	= shift;
	return $this->{col}->{'START_TIME'};
}

sub setEVENT
{
	my $this	= shift;
	$this->{col}->{'EVENT'} = shift;
}
sub getEVENT
{
	my $this	= shift;
	return $this->{col}->{'EVENT'};
}

sub setLOCATION
{
	my $this	= shift;
	$this->{col}->{'LOCATION'} = shift;
}
sub getLOCATION
{
	my $this	= shift;
	return $this->{col}->{'LOCATION'};
}

sub setCONTACT_PERSON
{
	my $this	= shift;
	$this->{col}->{'CONTACT_PERSON'} = shift;
}
sub getCONTACT_PERSON
{
	my $this	= shift;
	return $this->{col}->{'CONTACT_PERSON'};
}

sub setSTREET
{
	my $this	= shift;
	$this->{col}->{'STREET'} = shift;
}
sub getSTREET
{
	my $this	= shift;
	return $this->{col}->{'STREET'};
}

sub setZIPCODE
{
	my $this	= shift;
	$this->{col}->{'ZIPCODE'} = shift;
}
sub getZIPCODE
{
	my $this	= shift;
	return $this->{col}->{'ZIPCODE'};
}

sub setCITY
{
	my $this	= shift;
	$this->{col}->{'CITY'} = shift;
}
sub getCITY
{
	my $this	= shift;
	return $this->{col}->{'CITY'};
}

sub setCOUNTRY
{
	my $this	= shift;
	$this->{col}->{'COUNTRY'} = shift;
}
sub getCOUNTRY
{
	my $this	= shift;
	return $this->{col}->{'COUNTRY'};
}

sub setFON
{
	my $this	= shift;
	$this->{col}->{'FON'} = shift;
}
sub getFON
{
	my $this	= shift;
	return $this->{col}->{'FON'};
}

sub setFAX
{
	my $this	= shift;
	$this->{col}->{'FAX'} = shift;
}
sub getFAX
{
	my $this	= shift;
	return $this->{col}->{'FAX'};
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

sub setPRICE
{
	my $this	= shift;
	$this->{col}->{'PRICE'} = shift;
}
sub getPRICE
{
	my $this	= shift;
	return $this->{col}->{'PRICE'};
}

sub setDESCR
{
	my $this	= shift;
	$this->{col}->{'DESCR'} = shift;
}
sub getDESCR
{
	my $this	= shift;
	return $this->{col}->{'DESCR'};
}

sub setTEASERTEXT
{
	my $this	= shift;
	$this->{col}->{'TEASERTEXT'} = shift;
}
sub getTEASERTEXT
{
	my $this	= shift;
	return $this->{col}->{'TEASERTEXT'};
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
	if ($this->{col}->{'ADFRAME_DATES_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_DATES_ID = "NULL";
		$valueADFRAME_DATES_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_DATES_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_DATES_ID");
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

		my $valueADFRAME_DATESCATEGORY_ID = $this->{col}->{ADFRAME_DATESCATEGORY_ID};
		$valueADFRAME_DATESCATEGORY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_DATESCATEGORY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_DATESCATEGORY_ID");
		}

		my $valueSTART_DATE = $this->{col}->{START_DATE};
		$valueSTART_DATE =~ s/\'/\\\'/g;
		if ($valueSTART_DATE eq "")
		{
			push(@values,"now()");
		}
		else
		{
			push(@values,"'$valueSTART_DATE'");
		}

		my $valueEND_DATE = $this->{col}->{END_DATE};
		$valueEND_DATE =~ s/\'/\\\'/g;
		if ($valueEND_DATE eq "")
		{
			push(@values,"now()");
		}
		else
		{
			push(@values,"'$valueEND_DATE'");
		}

		my $valueSTART_TIME = $this->{col}->{START_TIME};
		$valueSTART_TIME =~ s/\'/\\\'/g;
		if ($valueSTART_TIME eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSTART_TIME'");
		}

		my $valueEVENT = $this->{col}->{EVENT};
		$valueEVENT =~ s/\'/\\\'/g;
		if ($valueEVENT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEVENT'");
		}

		my $valueLOCATION = $this->{col}->{LOCATION};
		$valueLOCATION =~ s/\'/\\\'/g;
		if ($valueLOCATION eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueLOCATION'");
		}

		my $valueCONTACT_PERSON = $this->{col}->{CONTACT_PERSON};
		$valueCONTACT_PERSON =~ s/\'/\\\'/g;
		if ($valueCONTACT_PERSON eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCONTACT_PERSON'");
		}

		my $valueSTREET = $this->{col}->{STREET};
		$valueSTREET =~ s/\'/\\\'/g;
		if ($valueSTREET eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSTREET'");
		}

		my $valueZIPCODE = $this->{col}->{ZIPCODE};
		$valueZIPCODE =~ s/\'/\\\'/g;
		if ($valueZIPCODE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueZIPCODE'");
		}

		my $valueCITY = $this->{col}->{CITY};
		$valueCITY =~ s/\'/\\\'/g;
		if ($valueCITY eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCITY'");
		}

		my $valueCOUNTRY = $this->{col}->{COUNTRY};
		$valueCOUNTRY =~ s/\'/\\\'/g;
		if ($valueCOUNTRY eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCOUNTRY'");
		}

		my $valueFON = $this->{col}->{FON};
		$valueFON =~ s/\'/\\\'/g;
		if ($valueFON eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueFON'");
		}

		my $valueFAX = $this->{col}->{FAX};
		$valueFAX =~ s/\'/\\\'/g;
		if ($valueFAX eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueFAX'");
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

		my $valuePRICE = $this->{col}->{PRICE};
		$valuePRICE =~ s/\'/\\\'/g;
		if ($valuePRICE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePRICE'");
		}

		my $valueDESCR = $this->{col}->{DESCR};
		$valueDESCR =~ s/\'/\\\'/g;
		if ($valueDESCR eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueDESCR'");
		}

		my $valueTEASERTEXT = $this->{col}->{TEASERTEXT};
		$valueTEASERTEXT =~ s/\'/\\\'/g;
		if ($valueTEASERTEXT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEASERTEXT'");
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


		$this->{col}->{'ADFRAME_DATES_ID'} = $this->insert('ADFRAME_DATES','ADFRAME_DATES_ID,ADFRAME_CHANNEL,AREA,ADFRAME_DATESCATEGORY_ID,START_DATE,END_DATE,START_TIME,EVENT,LOCATION,CONTACT_PERSON,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,URL,EMAIL,PRICE,DESCR,TEASERTEXT,IMAGE_1,IMAGE_2,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_DATES_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_DATES_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"ADFRAME_CHANNEL='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'AREA'})
		{
			my $value = $this->{col}->{'AREA'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"AREA='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update AREA='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_DATESCATEGORY_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_DATESCATEGORY_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"ADFRAME_DATESCATEGORY_ID=$value","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_DATESCATEGORY_ID=$value with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'START_DATE'})
		{
			my $value = $this->{col}->{'START_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"START_DATE='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update START_DATE='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'END_DATE'})
		{
			my $value = $this->{col}->{'END_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"END_DATE='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update END_DATE='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'START_TIME'})
		{
			my $value = $this->{col}->{'START_TIME'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"START_TIME='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update START_TIME='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'EVENT'})
		{
			my $value = $this->{col}->{'EVENT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"EVENT='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update EVENT='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'LOCATION'})
		{
			my $value = $this->{col}->{'LOCATION'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"LOCATION='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update LOCATION='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'CONTACT_PERSON'})
		{
			my $value = $this->{col}->{'CONTACT_PERSON'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"CONTACT_PERSON='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CONTACT_PERSON='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'STREET'})
		{
			my $value = $this->{col}->{'STREET'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"STREET='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update STREET='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'ZIPCODE'})
		{
			my $value = $this->{col}->{'ZIPCODE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"ZIPCODE='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ZIPCODE='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'CITY'})
		{
			my $value = $this->{col}->{'CITY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"CITY='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CITY='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'COUNTRY'})
		{
			my $value = $this->{col}->{'COUNTRY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"COUNTRY='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COUNTRY='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'FON'})
		{
			my $value = $this->{col}->{'FON'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"FON='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update FON='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'FAX'})
		{
			my $value = $this->{col}->{'FAX'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"FAX='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update FAX='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'URL'})
		{
			my $value = $this->{col}->{'URL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"URL='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update URL='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'EMAIL'})
		{
			my $value = $this->{col}->{'EMAIL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"EMAIL='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update EMAIL='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'PRICE'})
		{
			my $value = $this->{col}->{'PRICE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"PRICE='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update PRICE='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'DESCR'})
		{
			my $value = $this->{col}->{'DESCR'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"DESCR='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update DESCR='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'TEASERTEXT'})
		{
			my $value = $this->{col}->{'TEASERTEXT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"TEASERTEXT='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEASERTEXT='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_1'})
		{
			my $value = $this->{col}->{'IMAGE_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"IMAGE_1='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE_1='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_2'})
		{
			my $value = $this->{col}->{'IMAGE_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"IMAGE_2='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE_2='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"CR_DATE='$value'","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATES',"IS_ACTIVE=$value","ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_DATES_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_DATES',"$SQL_COLS","ADFRAME_DATES_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_DATES_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_DATES','ADFRAME_DATES_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_DATES_ID'}>0)
	{
		$this->delete('ADFRAME_DATES',"ADFRAME_DATES_ID=$this->{col}->{'ADFRAME_DATES_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_DATES: '.$mess.'\n';   
}
sub setADFRAME_DATES_ID
{
	my $this	= shift;
	my $ADFRAME_DATES_ID = shift;
	if ($this->{col}->{'ADFRAME_DATES_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_DATES_ID'} = $ADFRAME_DATES_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_DATES

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_DATES_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setAREA(String: value)
 getAREA()

 setADFRAME_DATESCATEGORY_ID(String: value)
 getADFRAME_DATESCATEGORY_ID()

 setSTART_DATE(String: value)
 getSTART_DATE()

 setEND_DATE(String: value)
 getEND_DATE()

 setSTART_TIME(String: value)
 getSTART_TIME()

 setEVENT(String: value)
 getEVENT()

 setLOCATION(String: value)
 getLOCATION()

 setCONTACT_PERSON(String: value)
 getCONTACT_PERSON()

 setSTREET(String: value)
 getSTREET()

 setZIPCODE(String: value)
 getZIPCODE()

 setCITY(String: value)
 getCITY()

 setCOUNTRY(String: value)
 getCOUNTRY()

 setFON(String: value)
 getFON()

 setFAX(String: value)
 getFAX()

 setURL(String: value)
 getURL()

 setEMAIL(String: value)
 getEMAIL()

 setPRICE(String: value)
 getPRICE()

 setDESCR(String: value)
 getDESCR()

 setTEASERTEXT(String: value)
 getTEASERTEXT()

 setIMAGE_1(String: value)
 getIMAGE_1()

 setIMAGE_2(String: value)
 getIMAGE_2()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 