package ClassADFRAME_USER;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USER_ID,ADFRAME_CHANNEL,ACCOUNT_NO,GENDER,TITLE,FIRSTNAME,NAME,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,MOBIL,BIRTHDAY,PROFESSION,COMPANY,ADFRAME_COMPANY_ID,POSITION,FON_COMPANY,HOBBY,EXTENSION,EXTENSION_ID,LOGIN,PASSWD,LICENCEKEY,ROLES,CR_DATE,ADMIT';

sub getADFRAME_USER_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USER_ID'};
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

sub setACCOUNT_NO
{
	my $this	= shift;
	$this->{col}->{'ACCOUNT_NO'} = shift;
}
sub getACCOUNT_NO
{
	my $this	= shift;
	return $this->{col}->{'ACCOUNT_NO'};
}

sub setGENDER
{
	my $this	= shift;
	$this->{col}->{'GENDER'} = shift;
}
sub getGENDER
{
	my $this	= shift;
	return $this->{col}->{'GENDER'};
}

sub setTITLE
{
	my $this	= shift;
	$this->{col}->{'TITLE'} = shift;
}
sub getTITLE
{
	my $this	= shift;
	return $this->{col}->{'TITLE'};
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

sub setMOBIL
{
	my $this	= shift;
	$this->{col}->{'MOBIL'} = shift;
}
sub getMOBIL
{
	my $this	= shift;
	return $this->{col}->{'MOBIL'};
}

sub setBIRTHDAY
{
	my $this	= shift;
	$this->{col}->{'BIRTHDAY'} = shift;
}
sub getBIRTHDAY
{
	my $this	= shift;
	return $this->{col}->{'BIRTHDAY'};
}

sub setPROFESSION
{
	my $this	= shift;
	$this->{col}->{'PROFESSION'} = shift;
}
sub getPROFESSION
{
	my $this	= shift;
	return $this->{col}->{'PROFESSION'};
}

sub setCOMPANY
{
	my $this	= shift;
	$this->{col}->{'COMPANY'} = shift;
}
sub getCOMPANY
{
	my $this	= shift;
	return $this->{col}->{'COMPANY'};
}

sub setADFRAME_COMPANY_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_COMPANY_ID'} = shift;
}
sub getADFRAME_COMPANY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_COMPANY_ID'};
}

sub setPOSITION
{
	my $this	= shift;
	$this->{col}->{'POSITION'} = shift;
}
sub getPOSITION
{
	my $this	= shift;
	return $this->{col}->{'POSITION'};
}

sub setFON_COMPANY
{
	my $this	= shift;
	$this->{col}->{'FON_COMPANY'} = shift;
}
sub getFON_COMPANY
{
	my $this	= shift;
	return $this->{col}->{'FON_COMPANY'};
}

sub setHOBBY
{
	my $this	= shift;
	$this->{col}->{'HOBBY'} = shift;
}
sub getHOBBY
{
	my $this	= shift;
	return $this->{col}->{'HOBBY'};
}

sub setEXTENSION
{
	my $this	= shift;
	$this->{col}->{'EXTENSION'} = shift;
}
sub getEXTENSION
{
	my $this	= shift;
	return $this->{col}->{'EXTENSION'};
}

sub setEXTENSION_ID
{
	my $this	= shift;
	$this->{col}->{'EXTENSION_ID'} = shift;
}
sub getEXTENSION_ID
{
	my $this	= shift;
	return $this->{col}->{'EXTENSION_ID'};
}

sub setLOGIN
{
	my $this	= shift;
	$this->{col}->{'LOGIN'} = shift;
}
sub getLOGIN
{
	my $this	= shift;
	return $this->{col}->{'LOGIN'};
}

sub setPASSWD
{
	my $this	= shift;
	$this->{col}->{'PASSWD'} = shift;
}
sub getPASSWD
{
	my $this	= shift;
	return $this->{col}->{'PASSWD'};
}

sub setLICENCEKEY
{
	my $this	= shift;
	$this->{col}->{'LICENCEKEY'} = shift;
}
sub getLICENCEKEY
{
	my $this	= shift;
	return $this->{col}->{'LICENCEKEY'};
}

sub setROLES
{
	my $this	= shift;
	$this->{col}->{'ROLES'} = shift;
}
sub getROLES
{
	my $this	= shift;
	return $this->{col}->{'ROLES'};
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

sub setADMIT
{
	my $this	= shift;
	$this->{col}->{'ADMIT'} = shift;
}
sub getADMIT
{
	my $this	= shift;
	return $this->{col}->{'ADMIT'};
}



sub save
{
	my $this	= shift;

	if ($this->{col}->{'ADFRAME_USER_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_USER_ID = "NULL";
		$valueADFRAME_USER_ID =~ s/\'/\\\'/g;
		if ("$valueADFRAME_USER_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USER_ID");
		}

		my $valueADFRAME_CHANNEL = $this->{col}->{ADFRAME_CHANNEL};
		$valueADFRAME_CHANNEL =~ s/\'/\\\'/g;
		if ("'$valueADFRAME_CHANNEL'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueADFRAME_CHANNEL'");
		}

		my $valueACCOUNT_NO = $this->{col}->{ACCOUNT_NO};
		$valueACCOUNT_NO =~ s/\'/\\\'/g;
		if ("'$valueACCOUNT_NO'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueACCOUNT_NO'");
		}

		my $valueGENDER = $this->{col}->{GENDER};
		$valueGENDER =~ s/\'/\\\'/g;
		if ("'$valueGENDER'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueGENDER'");
		}

		my $valueTITLE = $this->{col}->{TITLE};
		$valueTITLE =~ s/\'/\\\'/g;
		if ("'$valueTITLE'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTITLE'");
		}

		my $valueFIRSTNAME = $this->{col}->{FIRSTNAME};
		$valueFIRSTNAME =~ s/\'/\\\'/g;
		if ("'$valueFIRSTNAME'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueFIRSTNAME'");
		}

		my $valueNAME = $this->{col}->{NAME};
		$valueNAME =~ s/\'/\\\'/g;
		if ("'$valueNAME'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueNAME'");
		}

		my $valueSTREET = $this->{col}->{STREET};
		$valueSTREET =~ s/\'/\\\'/g;
		if ("'$valueSTREET'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSTREET'");
		}

		my $valueZIPCODE = $this->{col}->{ZIPCODE};
		$valueZIPCODE =~ s/\'/\\\'/g;
		if ("'$valueZIPCODE'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueZIPCODE'");
		}

		my $valueCITY = $this->{col}->{CITY};
		$valueCITY =~ s/\'/\\\'/g;
		if ("'$valueCITY'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCITY'");
		}

		my $valueCOUNTRY = $this->{col}->{COUNTRY};
		$valueCOUNTRY =~ s/\'/\\\'/g;
		if ("'$valueCOUNTRY'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCOUNTRY'");
		}

		my $valueEMAIL = $this->{col}->{EMAIL};
		$valueEMAIL =~ s/\'/\\\'/g;
		if ("'$valueEMAIL'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEMAIL'");
		}

		my $valueFON = $this->{col}->{FON};
		$valueFON =~ s/\'/\\\'/g;
		if ("'$valueFON'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueFON'");
		}

		my $valueFAX = $this->{col}->{FAX};
		$valueFAX =~ s/\'/\\\'/g;
		if ("'$valueFAX'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueFAX'");
		}

		my $valueMOBIL = $this->{col}->{MOBIL};
		$valueMOBIL =~ s/\'/\\\'/g;
		if ("'$valueMOBIL'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueMOBIL'");
		}

		my $valueBIRTHDAY = $this->{col}->{BIRTHDAY};
		$valueBIRTHDAY =~ s/\'/\\\'/g;
		if ("'$valueBIRTHDAY'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueBIRTHDAY'");
		}

		my $valuePROFESSION = $this->{col}->{PROFESSION};
		$valuePROFESSION =~ s/\'/\\\'/g;
		if ("'$valuePROFESSION'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePROFESSION'");
		}

		my $valueCOMPANY = $this->{col}->{COMPANY};
		$valueCOMPANY =~ s/\'/\\\'/g;
		if ("'$valueCOMPANY'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCOMPANY'");
		}

		my $valueADFRAME_COMPANY_ID = $this->{col}->{ADFRAME_COMPANY_ID};
		$valueADFRAME_COMPANY_ID =~ s/\'/\\\'/g;
		if ("$valueADFRAME_COMPANY_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_COMPANY_ID");
		}

		my $valuePOSITION = $this->{col}->{POSITION};
		$valuePOSITION =~ s/\'/\\\'/g;
		if ("'$valuePOSITION'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePOSITION'");
		}

		my $valueFON_COMPANY = $this->{col}->{FON_COMPANY};
		$valueFON_COMPANY =~ s/\'/\\\'/g;
		if ("'$valueFON_COMPANY'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueFON_COMPANY'");
		}

		my $valueHOBBY = $this->{col}->{HOBBY};
		$valueHOBBY =~ s/\'/\\\'/g;
		if ("'$valueHOBBY'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueHOBBY'");
		}

		my $valueEXTENSION = $this->{col}->{EXTENSION};
		$valueEXTENSION =~ s/\'/\\\'/g;
		if ("'$valueEXTENSION'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEXTENSION'");
		}

		my $valueEXTENSION_ID = $this->{col}->{EXTENSION_ID};
		$valueEXTENSION_ID =~ s/\'/\\\'/g;
		if ("'$valueEXTENSION_ID'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEXTENSION_ID'");
		}

		my $valueLOGIN = $this->{col}->{LOGIN};
		$valueLOGIN =~ s/\'/\\\'/g;
		if ("'$valueLOGIN'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueLOGIN'");
		}

		my $valuePASSWD = $this->{col}->{PASSWD};
		$valuePASSWD =~ s/\'/\\\'/g;
		if ("'$valuePASSWD'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePASSWD'");
		}

		my $valueLICENCEKEY = $this->{col}->{LICENCEKEY};
		$valueLICENCEKEY =~ s/\'/\\\'/g;
		if ("'$valueLICENCEKEY'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueLICENCEKEY'");
		}

		my $valueROLES = $this->{col}->{ROLES};
		$valueROLES =~ s/\'/\\\'/g;
		if ("'$valueROLES'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueROLES'");
		}

		my $valueCR_DATE = "now()";
		$valueCR_DATE =~ s/\'/\\\'/g;
		if ("$valueCR_DATE" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueCR_DATE");
		}

		my $valueADMIT = $this->{col}->{ADMIT};
		$valueADMIT =~ s/\'/\\\'/g;
		if ("$valueADMIT" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADMIT");
		}


		$this->{col}->{'ADFRAME_USER_ID'} = $this->insert('ADFRAME_USER','ADFRAME_USER_ID,ADFRAME_CHANNEL,ACCOUNT_NO,GENDER,TITLE,FIRSTNAME,NAME,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,MOBIL,BIRTHDAY,PROFESSION,COMPANY,ADFRAME_COMPANY_ID,POSITION,FON_COMPANY,HOBBY,EXTENSION,EXTENSION_ID,LOGIN,PASSWD,LICENCEKEY,ROLES,CR_DATE,ADMIT',@values);
		return $this->{col}->{'ADFRAME_USER_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_USER_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"ADFRAME_CHANNEL='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ACCOUNT_NO'})
		{
			my $value = $this->{col}->{'ACCOUNT_NO'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"ACCOUNT_NO='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update ACCOUNT_NO='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'GENDER'})
		{
			my $value = $this->{col}->{'GENDER'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"GENDER='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update GENDER='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'TITLE'})
		{
			my $value = $this->{col}->{'TITLE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"TITLE='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update TITLE='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'FIRSTNAME'})
		{
			my $value = $this->{col}->{'FIRSTNAME'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"FIRSTNAME='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update FIRSTNAME='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'NAME'})
		{
			my $value = $this->{col}->{'NAME'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"NAME='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update NAME='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'STREET'})
		{
			my $value = $this->{col}->{'STREET'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"STREET='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update STREET='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ZIPCODE'})
		{
			my $value = $this->{col}->{'ZIPCODE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"ZIPCODE='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update ZIPCODE='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'CITY'})
		{
			my $value = $this->{col}->{'CITY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"CITY='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update CITY='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'COUNTRY'})
		{
			my $value = $this->{col}->{'COUNTRY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"COUNTRY='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update COUNTRY='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'EMAIL'})
		{
			my $value = $this->{col}->{'EMAIL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"EMAIL='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update EMAIL='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'FON'})
		{
			my $value = $this->{col}->{'FON'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"FON='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update FON='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'FAX'})
		{
			my $value = $this->{col}->{'FAX'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"FAX='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update FAX='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'MOBIL'})
		{
			my $value = $this->{col}->{'MOBIL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"MOBIL='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update MOBIL='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'BIRTHDAY'})
		{
			my $value = $this->{col}->{'BIRTHDAY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"BIRTHDAY='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update BIRTHDAY='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'PROFESSION'})
		{
			my $value = $this->{col}->{'PROFESSION'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"PROFESSION='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update PROFESSION='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'COMPANY'})
		{
			my $value = $this->{col}->{'COMPANY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"COMPANY='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update COMPANY='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_COMPANY_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_COMPANY_ID'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"ADFRAME_COMPANY_ID=$value","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADFRAME_COMPANY_ID=$value with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'POSITION'})
		{
			my $value = $this->{col}->{'POSITION'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"POSITION='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update POSITION='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'FON_COMPANY'})
		{
			my $value = $this->{col}->{'FON_COMPANY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"FON_COMPANY='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update FON_COMPANY='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'HOBBY'})
		{
			my $value = $this->{col}->{'HOBBY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"HOBBY='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update HOBBY='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'EXTENSION'})
		{
			my $value = $this->{col}->{'EXTENSION'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"EXTENSION='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update EXTENSION='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'EXTENSION_ID'})
		{
			my $value = $this->{col}->{'EXTENSION_ID'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"EXTENSION_ID='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update EXTENSION_ID='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LOGIN'})
		{
			my $value = $this->{col}->{'LOGIN'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"LOGIN='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update LOGIN='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'PASSWD'})
		{
			my $value = $this->{col}->{'PASSWD'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"PASSWD='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update PASSWD='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LICENCEKEY'})
		{
			my $value = $this->{col}->{'LICENCEKEY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"LICENCEKEY='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update LICENCEKEY='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ROLES'})
		{
			my $value = $this->{col}->{'ROLES'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"ROLES='$value'","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update ROLES='$value' with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'ADMIT'})
		{
			my $value = $this->{col}->{'ADMIT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USER',"ADMIT=$value","ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADMIT=$value with ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_USER_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if ($id>0)
	{
		my @data = split(/\|/, $this->get('ADFRAME_USER',"$SQL_COLS","ADFRAME_USER_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_USER_ID < 1 !');
	}
	return 0;
}

sub getDataHash
{
	my $this		= shift;
	return %{ $this->{col} };
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_USER','ADFRAME_USER_ID',"$condition");
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

sub deleteFromDB
{
	my $this		= shift;
	if ($this->{col}->{'ADFRAME_USER_ID'}>0)
	{
		$this->delete('ADFRAME_USER',"ADFRAME_USER_ID=$this->{col}->{'ADFRAME_USER_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_USER: '.$mess.'\n';   
}
sub setADFRAME_USER_ID
{
	my $this	= shift;
	my $ADFRAME_USER_ID = shift;
	if ($this->{col}->{'ADFRAME_USER_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_USER_ID'} = $ADFRAME_USER_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_USER

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_USER_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setACCOUNT_NO(String: value)
 getACCOUNT_NO()

 setGENDER(String: value)
 getGENDER()

 setTITLE(String: value)
 getTITLE()

 setFIRSTNAME(String: value)
 getFIRSTNAME()

 setNAME(String: value)
 getNAME()

 setSTREET(String: value)
 getSTREET()

 setZIPCODE(String: value)
 getZIPCODE()

 setCITY(String: value)
 getCITY()

 setCOUNTRY(String: value)
 getCOUNTRY()

 setEMAIL(String: value)
 getEMAIL()

 setFON(String: value)
 getFON()

 setFAX(String: value)
 getFAX()

 setMOBIL(String: value)
 getMOBIL()

 setBIRTHDAY(String: value)
 getBIRTHDAY()

 setPROFESSION(String: value)
 getPROFESSION()

 setCOMPANY(String: value)
 getCOMPANY()

 setADFRAME_COMPANY_ID(String: value)
 getADFRAME_COMPANY_ID()

 setPOSITION(String: value)
 getPOSITION()

 setFON_COMPANY(String: value)
 getFON_COMPANY()

 setHOBBY(String: value)
 getHOBBY()

 setEXTENSION(String: value)
 getEXTENSION()

 setEXTENSION_ID(String: value)
 getEXTENSION_ID()

 setLOGIN(String: value)
 getLOGIN()

 setPASSWD(String: value)
 getPASSWD()

 setLICENCEKEY(String: value)
 getLICENCEKEY()

 setROLES(String: value)
 getROLES()

 setCR_DATE(String: value)
 getCR_DATE()

 setADMIT(String: value)
 getADMIT()



 initById(PK)
 
 getErrorMessage()
 