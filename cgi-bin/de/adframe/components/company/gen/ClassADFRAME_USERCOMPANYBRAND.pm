package ClassADFRAME_USERCOMPANYBRAND;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USERCOMPANYBRAND_ID,ADFRAME_CHANNEL,AREA,ADFRAME_USER_ID,ADFRAME_COMPANY_ID,ADFRAME_BRAND_ID,COMMENT,CR_DATE,STATUS,IS_ACTIVE';

sub getADFRAME_USERCOMPANYBRAND_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'};
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

sub setADFRAME_BRAND_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_BRAND_ID'} = shift;
}
sub getADFRAME_BRAND_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_BRAND_ID'};
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
	if ($this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_USERCOMPANYBRAND_ID = "NULL";
		$valueADFRAME_USERCOMPANYBRAND_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_USERCOMPANYBRAND_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USERCOMPANYBRAND_ID");
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

		my $valueADFRAME_COMPANY_ID = $this->{col}->{ADFRAME_COMPANY_ID};
		$valueADFRAME_COMPANY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_COMPANY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_COMPANY_ID");
		}

		my $valueADFRAME_BRAND_ID = $this->{col}->{ADFRAME_BRAND_ID};
		$valueADFRAME_BRAND_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_BRAND_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_BRAND_ID");
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


		$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'} = $this->insert('ADFRAME_USERCOMPANYBRAND','ADFRAME_USERCOMPANYBRAND_ID,ADFRAME_CHANNEL,AREA,ADFRAME_USER_ID,ADFRAME_COMPANY_ID,ADFRAME_BRAND_ID,COMMENT,CR_DATE,STATUS,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"ADFRAME_CHANNEL='$value'","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'AREA'})
		{
			my $value = $this->{col}->{'AREA'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"AREA='$value'","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update AREA='$value' with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"ADFRAME_USER_ID=$value","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID=$value with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_COMPANY_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_COMPANY_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"ADFRAME_COMPANY_ID=$value","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_COMPANY_ID=$value with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_BRAND_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_BRAND_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"ADFRAME_BRAND_ID=$value","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_BRAND_ID=$value with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'COMMENT'})
		{
			my $value = $this->{col}->{'COMMENT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"COMMENT='$value'","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COMMENT='$value' with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"CR_DATE='$value'","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'STATUS'})
		{
			my $value = $this->{col}->{'STATUS'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"STATUS='$value'","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update STATUS='$value' with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USERCOMPANYBRAND',"IS_ACTIVE=$value","ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_USERCOMPANYBRAND',"$SQL_COLS","ADFRAME_USERCOMPANYBRAND_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_USERCOMPANYBRAND_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_USERCOMPANYBRAND','ADFRAME_USERCOMPANYBRAND_ID',"$condition");
	if ($ids[1]>0)
	{
		$this->addErrorMessage("Multiple datasets found with Condition $condition at initByCondition()");
		if ($this->initById($ids[$#ids]))
		{
			return $ids[$#ids];
		}	
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
	if ($this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}>0)
	{
		$this->delete('ADFRAME_USERCOMPANYBRAND',"ADFRAME_USERCOMPANYBRAND_ID=$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_USERCOMPANYBRAND: '.$mess.'\n';   
}
sub setADFRAME_USERCOMPANYBRAND_ID
{
	my $this	= shift;
	my $ADFRAME_USERCOMPANYBRAND_ID = shift;
	if ($this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_USERCOMPANYBRAND_ID'} = $ADFRAME_USERCOMPANYBRAND_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_USERCOMPANYBRAND

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_USERCOMPANYBRAND_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setAREA(String: value)
 getAREA()

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setADFRAME_COMPANY_ID(String: value)
 getADFRAME_COMPANY_ID()

 setADFRAME_BRAND_ID(String: value)
 getADFRAME_BRAND_ID()

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
 