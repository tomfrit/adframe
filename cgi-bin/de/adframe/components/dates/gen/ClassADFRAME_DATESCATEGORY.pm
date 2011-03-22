package ClassADFRAME_DATESCATEGORY;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_DATESCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,CR_DATE,IS_ACTIVE';

sub getADFRAME_DATESCATEGORY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_DATESCATEGORY_ID'};
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

sub setCATEGORY
{
	my $this	= shift;
	$this->{col}->{'CATEGORY'} = shift;
}
sub getCATEGORY
{
	my $this	= shift;
	return $this->{col}->{'CATEGORY'};
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
	if ($this->{col}->{'ADFRAME_DATESCATEGORY_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_DATESCATEGORY_ID = "NULL";
		$valueADFRAME_DATESCATEGORY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_DATESCATEGORY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_DATESCATEGORY_ID");
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

		my $valueCATEGORY = $this->{col}->{CATEGORY};
		$valueCATEGORY =~ s/\'/\\\'/g;
		if ($valueCATEGORY eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCATEGORY'");
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


		$this->{col}->{'ADFRAME_DATESCATEGORY_ID'} = $this->insert('ADFRAME_DATESCATEGORY','ADFRAME_DATESCATEGORY_ID,ADFRAME_CHANNEL,AREA,CATEGORY,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_DATESCATEGORY_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_DATESCATEGORY_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATESCATEGORY',"ADFRAME_CHANNEL='$value'","ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'AREA'})
		{
			my $value = $this->{col}->{'AREA'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATESCATEGORY',"AREA='$value'","ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update AREA='$value' with ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'CATEGORY'})
		{
			my $value = $this->{col}->{'CATEGORY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATESCATEGORY',"CATEGORY='$value'","ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CATEGORY='$value' with ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATESCATEGORY',"CR_DATE='$value'","ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_DATESCATEGORY',"IS_ACTIVE=$value","ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_DATESCATEGORY_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_DATESCATEGORY',"$SQL_COLS","ADFRAME_DATESCATEGORY_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_DATESCATEGORY_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_DATESCATEGORY','ADFRAME_DATESCATEGORY_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_DATESCATEGORY_ID'}>0)
	{
		$this->delete('ADFRAME_DATESCATEGORY',"ADFRAME_DATESCATEGORY_ID=$this->{col}->{'ADFRAME_DATESCATEGORY_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_DATESCATEGORY: '.$mess.'\n';   
}
sub setADFRAME_DATESCATEGORY_ID
{
	my $this	= shift;
	my $ADFRAME_DATESCATEGORY_ID = shift;
	if ($this->{col}->{'ADFRAME_DATESCATEGORY_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_DATESCATEGORY_ID'} = $ADFRAME_DATESCATEGORY_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_DATESCATEGORY

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_DATESCATEGORY_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setAREA(String: value)
 getAREA()

 setCATEGORY(String: value)
 getCATEGORY()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 