package ClassADFRAME_FOTO_RATING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_FOTO_RATING_ID,ADFRAME_USER_ID,ADFRAME_USER_FOTO_ID,RATING,CR_DATE';

sub getADFRAME_FOTO_RATING_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_FOTO_RATING_ID'};
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

sub setADFRAME_USER_FOTO_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_USER_FOTO_ID'} = shift;
}
sub getADFRAME_USER_FOTO_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USER_FOTO_ID'};
}

sub setRATING
{
	my $this	= shift;
	$this->{col}->{'RATING'} = shift;
}
sub getRATING
{
	my $this	= shift;
	return $this->{col}->{'RATING'};
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



sub save
{
	my $this	= shift;
	if ($this->{col}->{'ADFRAME_FOTO_RATING_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_FOTO_RATING_ID = "NULL";
		$valueADFRAME_FOTO_RATING_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_FOTO_RATING_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_FOTO_RATING_ID");
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

		my $valueADFRAME_USER_FOTO_ID = $this->{col}->{ADFRAME_USER_FOTO_ID};
		$valueADFRAME_USER_FOTO_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_USER_FOTO_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USER_FOTO_ID");
		}

		my $valueRATING = $this->{col}->{RATING};
		$valueRATING =~ s/\'/\\\'/g;
		if ($valueRATING eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueRATING");
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


		$this->{col}->{'ADFRAME_FOTO_RATING_ID'} = $this->insert('ADFRAME_FOTO_RATING','ADFRAME_FOTO_RATING_ID,ADFRAME_USER_ID,ADFRAME_USER_FOTO_ID,RATING,CR_DATE',@values);
		return $this->{col}->{'ADFRAME_FOTO_RATING_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_FOTO_RATING_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FOTO_RATING',"ADFRAME_USER_ID=$value","ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID=$value with ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_USER_FOTO_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_FOTO_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FOTO_RATING',"ADFRAME_USER_FOTO_ID=$value","ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_FOTO_ID=$value with ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}");
			}
		}

		if (defined $this->{col}->{'RATING'})
		{
			my $value = $this->{col}->{'RATING'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FOTO_RATING',"RATING=$value","ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update RATING=$value with ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_FOTO_RATING',"CR_DATE='$value'","ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_FOTO_RATING_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_FOTO_RATING',"$SQL_COLS","ADFRAME_FOTO_RATING_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_FOTO_RATING_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_FOTO_RATING','ADFRAME_FOTO_RATING_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_FOTO_RATING_ID'}>0)
	{
		$this->delete('ADFRAME_FOTO_RATING',"ADFRAME_FOTO_RATING_ID=$this->{col}->{'ADFRAME_FOTO_RATING_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_FOTO_RATING: '.$mess.'\n';   
}
sub setADFRAME_FOTO_RATING_ID
{
	my $this	= shift;
	my $ADFRAME_FOTO_RATING_ID = shift;
	if ($this->{col}->{'ADFRAME_FOTO_RATING_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_FOTO_RATING_ID'} = $ADFRAME_FOTO_RATING_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_FOTO_RATING

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_FOTO_RATING_ID

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setADFRAME_USER_FOTO_ID(String: value)
 getADFRAME_USER_FOTO_ID()

 setRATING(String: value)
 getRATING()

 setCR_DATE(String: value)
 getCR_DATE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 