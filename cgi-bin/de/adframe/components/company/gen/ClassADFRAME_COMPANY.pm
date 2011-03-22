package ClassADFRAME_COMPANY;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_COMPANY_ID,ADFRAME_CHANNEL,AREA,ACCOUNT_NO,COMPANY,BRANCH,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,URL,BANK_ACCOUNTNAME,BANK_ACCOUNTNUMBER,BANK_INSTITUTE,BANK_CODE,SALES_TAX_ID,COMMENT,CR_DATE,STATUS,IS_ACTIVE';

sub getADFRAME_COMPANY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_COMPANY_ID'};
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

sub setBRANCH
{
	my $this	= shift;
	$this->{col}->{'BRANCH'} = shift;
}
sub getBRANCH
{
	my $this	= shift;
	return $this->{col}->{'BRANCH'};
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

sub setBANK_ACCOUNTNAME
{
	my $this	= shift;
	$this->{col}->{'BANK_ACCOUNTNAME'} = shift;
}
sub getBANK_ACCOUNTNAME
{
	my $this	= shift;
	return $this->{col}->{'BANK_ACCOUNTNAME'};
}

sub setBANK_ACCOUNTNUMBER
{
	my $this	= shift;
	$this->{col}->{'BANK_ACCOUNTNUMBER'} = shift;
}
sub getBANK_ACCOUNTNUMBER
{
	my $this	= shift;
	return $this->{col}->{'BANK_ACCOUNTNUMBER'};
}

sub setBANK_INSTITUTE
{
	my $this	= shift;
	$this->{col}->{'BANK_INSTITUTE'} = shift;
}
sub getBANK_INSTITUTE
{
	my $this	= shift;
	return $this->{col}->{'BANK_INSTITUTE'};
}

sub setBANK_CODE
{
	my $this	= shift;
	$this->{col}->{'BANK_CODE'} = shift;
}
sub getBANK_CODE
{
	my $this	= shift;
	return $this->{col}->{'BANK_CODE'};
}

sub setSALES_TAX_ID
{
	my $this	= shift;
	$this->{col}->{'SALES_TAX_ID'} = shift;
}
sub getSALES_TAX_ID
{
	my $this	= shift;
	return $this->{col}->{'SALES_TAX_ID'};
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

sub setSTATUS
{
	my $this	= shift;
	$this->{col}->{'STATUS'} = shift;
}
sub getSTATUS
{
	my $this	= shift;
	return $this->{col}->{'STATUS'};
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
	if ($this->{col}->{'ADFRAME_COMPANY_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_COMPANY_ID = "NULL";
		$valueADFRAME_COMPANY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_COMPANY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_COMPANY_ID");
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

		my $valueACCOUNT_NO = $this->{col}->{ACCOUNT_NO};
		$valueACCOUNT_NO =~ s/\'/\\\'/g;
		if ($valueACCOUNT_NO eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueACCOUNT_NO'");
		}

		my $valueCOMPANY = $this->{col}->{COMPANY};
		$valueCOMPANY =~ s/\'/\\\'/g;
		if ($valueCOMPANY eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCOMPANY'");
		}

		my $valueBRANCH = $this->{col}->{BRANCH};
		$valueBRANCH =~ s/\'/\\\'/g;
		if ($valueBRANCH eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueBRANCH'");
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

		my $valueBANK_ACCOUNTNAME = $this->{col}->{BANK_ACCOUNTNAME};
		$valueBANK_ACCOUNTNAME =~ s/\'/\\\'/g;
		if ($valueBANK_ACCOUNTNAME eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueBANK_ACCOUNTNAME'");
		}

		my $valueBANK_ACCOUNTNUMBER = $this->{col}->{BANK_ACCOUNTNUMBER};
		$valueBANK_ACCOUNTNUMBER =~ s/\'/\\\'/g;
		if ($valueBANK_ACCOUNTNUMBER eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueBANK_ACCOUNTNUMBER'");
		}

		my $valueBANK_INSTITUTE = $this->{col}->{BANK_INSTITUTE};
		$valueBANK_INSTITUTE =~ s/\'/\\\'/g;
		if ($valueBANK_INSTITUTE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueBANK_INSTITUTE'");
		}

		my $valueBANK_CODE = $this->{col}->{BANK_CODE};
		$valueBANK_CODE =~ s/\'/\\\'/g;
		if ($valueBANK_CODE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueBANK_CODE'");
		}

		my $valueSALES_TAX_ID = $this->{col}->{SALES_TAX_ID};
		$valueSALES_TAX_ID =~ s/\'/\\\'/g;
		if ($valueSALES_TAX_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSALES_TAX_ID'");
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

		my $valueSTATUS = $this->{col}->{STATUS};
		$valueSTATUS =~ s/\'/\\\'/g;
		if ($valueSTATUS eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSTATUS'");
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


		$this->{col}->{'ADFRAME_COMPANY_ID'} = $this->insert('ADFRAME_COMPANY','ADFRAME_COMPANY_ID,ADFRAME_CHANNEL,AREA,ACCOUNT_NO,COMPANY,BRANCH,STREET,ZIPCODE,CITY,COUNTRY,EMAIL,FON,FAX,URL,BANK_ACCOUNTNAME,BANK_ACCOUNTNUMBER,BANK_INSTITUTE,BANK_CODE,SALES_TAX_ID,COMMENT,CR_DATE,STATUS,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_COMPANY_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_COMPANY_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"ADFRAME_CHANNEL='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'AREA'})
		{
			my $value = $this->{col}->{'AREA'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"AREA='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update AREA='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'ACCOUNT_NO'})
		{
			my $value = $this->{col}->{'ACCOUNT_NO'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"ACCOUNT_NO='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ACCOUNT_NO='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'COMPANY'})
		{
			my $value = $this->{col}->{'COMPANY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"COMPANY='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COMPANY='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'BRANCH'})
		{
			my $value = $this->{col}->{'BRANCH'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"BRANCH='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update BRANCH='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'STREET'})
		{
			my $value = $this->{col}->{'STREET'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"STREET='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update STREET='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'ZIPCODE'})
		{
			my $value = $this->{col}->{'ZIPCODE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"ZIPCODE='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ZIPCODE='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'CITY'})
		{
			my $value = $this->{col}->{'CITY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"CITY='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CITY='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'COUNTRY'})
		{
			my $value = $this->{col}->{'COUNTRY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"COUNTRY='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COUNTRY='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'EMAIL'})
		{
			my $value = $this->{col}->{'EMAIL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"EMAIL='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update EMAIL='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'FON'})
		{
			my $value = $this->{col}->{'FON'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"FON='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update FON='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'FAX'})
		{
			my $value = $this->{col}->{'FAX'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"FAX='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update FAX='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'URL'})
		{
			my $value = $this->{col}->{'URL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"URL='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update URL='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'BANK_ACCOUNTNAME'})
		{
			my $value = $this->{col}->{'BANK_ACCOUNTNAME'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"BANK_ACCOUNTNAME='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update BANK_ACCOUNTNAME='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'BANK_ACCOUNTNUMBER'})
		{
			my $value = $this->{col}->{'BANK_ACCOUNTNUMBER'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"BANK_ACCOUNTNUMBER='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update BANK_ACCOUNTNUMBER='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'BANK_INSTITUTE'})
		{
			my $value = $this->{col}->{'BANK_INSTITUTE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"BANK_INSTITUTE='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update BANK_INSTITUTE='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'BANK_CODE'})
		{
			my $value = $this->{col}->{'BANK_CODE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"BANK_CODE='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update BANK_CODE='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'SALES_TAX_ID'})
		{
			my $value = $this->{col}->{'SALES_TAX_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"SALES_TAX_ID='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SALES_TAX_ID='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'COMMENT'})
		{
			my $value = $this->{col}->{'COMMENT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"COMMENT='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COMMENT='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"CR_DATE='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'STATUS'})
		{
			my $value = $this->{col}->{'STATUS'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"STATUS='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update STATUS='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_COMPANY',"IS_ACTIVE=$value","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_COMPANY_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_COMPANY',"$SQL_COLS","ADFRAME_COMPANY_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_COMPANY_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_COMPANY','ADFRAME_COMPANY_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_COMPANY_ID'}>0)
	{
		$this->delete('ADFRAME_COMPANY',"ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_COMPANY: '.$mess.'\n';   
}
sub setADFRAME_COMPANY_ID
{
	my $this	= shift;
	my $ADFRAME_COMPANY_ID = shift;
	if ($this->{col}->{'ADFRAME_COMPANY_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_COMPANY_ID'} = $ADFRAME_COMPANY_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_COMPANY

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_COMPANY_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setAREA(String: value)
 getAREA()

 setACCOUNT_NO(String: value)
 getACCOUNT_NO()

 setCOMPANY(String: value)
 getCOMPANY()

 setBRANCH(String: value)
 getBRANCH()

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

 setURL(String: value)
 getURL()

 setBANK_ACCOUNTNAME(String: value)
 getBANK_ACCOUNTNAME()

 setBANK_ACCOUNTNUMBER(String: value)
 getBANK_ACCOUNTNUMBER()

 setBANK_INSTITUTE(String: value)
 getBANK_INSTITUTE()

 setBANK_CODE(String: value)
 getBANK_CODE()

 setSALES_TAX_ID(String: value)
 getSALES_TAX_ID()

 setCOMMENT(String: value)
 getCOMMENT()

 setCR_DATE(String: value)
 getCR_DATE()

 setSTATUS(String: value)
 getSTATUS()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 