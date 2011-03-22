package ClassADFRAME_USERROLE;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USERROLE_ID,ADFRAME_CHANNEL,ROLE,DESCR,CR_DATE,ADMIT';

sub getADFRAME_USERROLE_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USERROLE_ID'};
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

sub setROLE
{
	my $this	= shift;
	$this->{col}->{'ROLE'} = shift;
}
sub getROLE
{
	my $this	= shift;
	return $this->{col}->{'ROLE'};
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
	if ($this->{col}->{'ADFRAME_USERROLE_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_USERROLE_ID = "NULL";
		$valueADFRAME_USERROLE_ID =~ s/\'/\\\'/g;
		if ("$valueADFRAME_USERROLE_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USERROLE_ID");
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

		my $valueROLE = $this->{col}->{ROLE};
		$valueROLE =~ s/\'/\\\'/g;
		if ("'$valueROLE'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueROLE'");
		}

		my $valueDESCR = $this->{col}->{DESCR};
		$valueDESCR =~ s/\'/\\\'/g;
		if ("'$valueDESCR'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueDESCR'");
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


		$this->{col}->{'ADFRAME_USERROLE_ID'} = $this->insert('ADFRAME_USERROLE','ADFRAME_USERROLE_ID,ADFRAME_CHANNEL,ROLE,DESCR,CR_DATE,ADMIT',@values);
		return $this->{col}->{'ADFRAME_USERROLE_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_USERROLE_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USERROLE',"ADFRAME_CHANNEL='$value'","ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}");
			}
		}

		if (defined $this->{col}->{'ROLE'})
		{
			my $value = $this->{col}->{'ROLE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USERROLE',"ROLE='$value'","ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}"))
			{
				$this->addErrorMessage("Cannot update ROLE='$value' with ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}");
			}
		}

		if (defined $this->{col}->{'DESCR'})
		{
			my $value = $this->{col}->{'DESCR'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USERROLE',"DESCR='$value'","ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}"))
			{
				$this->addErrorMessage("Cannot update DESCR='$value' with ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}");
			}
		}

		if (defined $this->{col}->{'ADMIT'})
		{
			my $value = $this->{col}->{'ADMIT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_USERROLE',"ADMIT=$value","ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADMIT=$value with ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_USERROLE_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if ($id>0)
	{
		my @data = split(/\|/, $this->get('ADFRAME_USERROLE',"$SQL_COLS","ADFRAME_USERROLE_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_USERROLE_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_USERROLE','ADFRAME_USERROLE_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_USERROLE_ID'}>0)
	{
		$this->delete('ADFRAME_USERROLE',"ADFRAME_USERROLE_ID=$this->{col}->{'ADFRAME_USERROLE_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_USERROLE: '.$mess.'\n';   
}
sub setADFRAME_USERROLE_ID
{
	my $this	= shift;
	my $ADFRAME_USERROLE_ID = shift;
	if ($this->{col}->{'ADFRAME_USERROLE_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_USERROLE_ID'} = $ADFRAME_USERROLE_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_USERROLE

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_USERROLE_ID
 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setROLE(String: value)
 getROLE()

 setDESCR(String: value)
 getDESCR()

 setCR_DATE(String: value)
 getCR_DATE()

 setADMIT(String: value)
 getADMIT()



 initById(PK)
 
 getErrorMessage()
 