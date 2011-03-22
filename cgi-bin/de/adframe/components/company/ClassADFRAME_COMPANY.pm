package ClassADFRAME_COMPANY;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_COMPANY_ID,ADFRAME_CHANNEL,PARENT_COMPANY_ID,COMPANY,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,EMAIL,HOMEPAGE,CR_DATE,IS_ACTIVE';

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

sub setPARENT_COMPANY_ID
{
	my $this	= shift;
	$this->{col}->{'PARENT_COMPANY_ID'} = shift;
}
sub getPARENT_COMPANY_ID
{
	my $this	= shift;
	return $this->{col}->{'PARENT_COMPANY_ID'};
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

sub setHOMEPAGE
{
	my $this	= shift;
	$this->{col}->{'HOMEPAGE'} = shift;
}
sub getHOMEPAGE
{
	my $this	= shift;
	return $this->{col}->{'HOMEPAGE'};
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
	if ($this->{col}->{'ADFRAME_COMPANY_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_COMPANY_ID = "NULL";
		$valueADFRAME_COMPANY_ID =~ s/\'/\\\'/g;
		if ("$valueADFRAME_COMPANY_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_COMPANY_ID");
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

		my $valuePARENT_COMPANY_ID = $this->{col}->{PARENT_COMPANY_ID};
		$valuePARENT_COMPANY_ID =~ s/\'/\\\'/g;
		if ("$valuePARENT_COMPANY_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valuePARENT_COMPANY_ID");
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

		my $valueHOMEPAGE = $this->{col}->{HOMEPAGE};
		$valueHOMEPAGE =~ s/\'/\\\'/g;
		if ("'$valueHOMEPAGE'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueHOMEPAGE'");
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

		my $valueIS_ACTIVE = $this->{col}->{IS_ACTIVE};
		$valueIS_ACTIVE =~ s/\'/\\\'/g;
		if ("$valueIS_ACTIVE" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueIS_ACTIVE");
		}


		$this->{col}->{'ADFRAME_COMPANY_ID'} = $this->insert('ADFRAME_COMPANY','ADFRAME_COMPANY_ID,ADFRAME_CHANNEL,PARENT_COMPANY_ID,COMPANY,STREET,ZIPCODE,CITY,COUNTRY,FON,FAX,EMAIL,HOMEPAGE,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_COMPANY_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_COMPANY_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"ADFRAME_CHANNEL='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'PARENT_COMPANY_ID'})
		{
			my $value = $this->{col}->{'PARENT_COMPANY_ID'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"PARENT_COMPANY_ID=$value","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update PARENT_COMPANY_ID=$value with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'COMPANY'})
		{
			my $value = $this->{col}->{'COMPANY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"COMPANY='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update COMPANY='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'STREET'})
		{
			my $value = $this->{col}->{'STREET'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"STREET='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update STREET='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'ZIPCODE'})
		{
			my $value = $this->{col}->{'ZIPCODE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"ZIPCODE='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update ZIPCODE='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'CITY'})
		{
			my $value = $this->{col}->{'CITY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"CITY='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update CITY='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'COUNTRY'})
		{
			my $value = $this->{col}->{'COUNTRY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"COUNTRY='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update COUNTRY='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'FON'})
		{
			my $value = $this->{col}->{'FON'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"FON='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update FON='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'FAX'})
		{
			my $value = $this->{col}->{'FAX'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"FAX='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update FAX='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'EMAIL'})
		{
			my $value = $this->{col}->{'EMAIL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"EMAIL='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update EMAIL='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'HOMEPAGE'})
		{
			my $value = $this->{col}->{'HOMEPAGE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"HOMEPAGE='$value'","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
			{
				$this->addErrorMessage("Cannot update HOMEPAGE='$value' with ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COMPANY',"IS_ACTIVE=$value","ADFRAME_COMPANY_ID=$this->{col}->{'ADFRAME_COMPANY_ID'}"))
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
	if ($id>0)
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
	$this->{errormessage}.="ClassADFRAME_COMPANY: $mess\n";   
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

 setPARENT_COMPANY_ID(String: value)
 getPARENT_COMPANY_ID()

 setCOMPANY(String: value)
 getCOMPANY()

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

 setEMAIL(String: value)
 getEMAIL()

 setHOMEPAGE(String: value)
 getHOMEPAGE()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 getErrorMessage()
 