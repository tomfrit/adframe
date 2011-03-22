package ClassADFRAME_VOTING_CATEGORY;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_VOTING_CATEGORY_ID,TITLE,TEXT,IMG,ITEM_0,IS_RAFFLE,VOTES,CR_DATE,END_DATE,IS_ACTIVE';

sub getADFRAME_VOTING_CATEGORY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'};
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

sub setTEXT
{
	my $this	= shift;
	$this->{col}->{'TEXT'} = shift;
}
sub getTEXT
{
	my $this	= shift;
	return $this->{col}->{'TEXT'};
}

sub setIMG
{
	my $this	= shift;
	$this->{col}->{'IMG'} = shift;
}
sub getIMG
{
	my $this	= shift;
	return $this->{col}->{'IMG'};
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

sub setIS_RAFFLE
{
	my $this	= shift;
	$this->{col}->{'IS_RAFFLE'} = shift;
}
sub getIS_RAFFLE
{
	my $this	= shift;
	return $this->{col}->{'IS_RAFFLE'};
}

sub setVOTES
{
	my $this	= shift;
	$this->{col}->{'VOTES'} = shift;
}
sub getVOTES
{
	my $this	= shift;
	return $this->{col}->{'VOTES'};
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
	if ($this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_VOTING_CATEGORY_ID = "NULL";
		$valueADFRAME_VOTING_CATEGORY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_VOTING_CATEGORY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_VOTING_CATEGORY_ID");
		}

		my $valueTITLE = $this->{col}->{TITLE};
		$valueTITLE =~ s/\'/\\\'/g;
		if ($valueTITLE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTITLE'");
		}

		my $valueTEXT = $this->{col}->{TEXT};
		$valueTEXT =~ s/\'/\\\'/g;
		if ($valueTEXT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT'");
		}

		my $valueIMG = $this->{col}->{IMG};
		$valueIMG =~ s/\'/\\\'/g;
		if ($valueIMG eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG'");
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

		my $valueIS_RAFFLE = $this->{col}->{IS_RAFFLE};
		$valueIS_RAFFLE =~ s/\'/\\\'/g;
		if ($valueIS_RAFFLE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueIS_RAFFLE");
		}

		my $valueVOTES = $this->{col}->{VOTES};
		$valueVOTES =~ s/\'/\\\'/g;
		if ($valueVOTES eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueVOTES");
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


		$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'} = $this->insert('ADFRAME_VOTING_CATEGORY','ADFRAME_VOTING_CATEGORY_ID,TITLE,TEXT,IMG,ITEM_0,IS_RAFFLE,VOTES,CR_DATE,END_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}>0)
	{
		if (defined $this->{col}->{'TITLE'})
		{
			my $value = $this->{col}->{'TITLE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"TITLE='$value'","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TITLE='$value' with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT'})
		{
			my $value = $this->{col}->{'TEXT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"TEXT='$value'","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT='$value' with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG'})
		{
			my $value = $this->{col}->{'IMG'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"IMG='$value'","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG='$value' with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_0'})
		{
			my $value = $this->{col}->{'ITEM_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"ITEM_0='$value'","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_0='$value' with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_RAFFLE'})
		{
			my $value = $this->{col}->{'IS_RAFFLE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"IS_RAFFLE=$value","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_RAFFLE=$value with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'VOTES'})
		{
			my $value = $this->{col}->{'VOTES'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"VOTES=$value","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VOTES=$value with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"CR_DATE='$value'","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'END_DATE'})
		{
			my $value = $this->{col}->{'END_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"END_DATE='$value'","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update END_DATE='$value' with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING_CATEGORY',"IS_ACTIVE=$value","ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_VOTING_CATEGORY',"$SQL_COLS","ADFRAME_VOTING_CATEGORY_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_VOTING_CATEGORY_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_VOTING_CATEGORY','ADFRAME_VOTING_CATEGORY_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}>0)
	{
		$this->delete('ADFRAME_VOTING_CATEGORY',"ADFRAME_VOTING_CATEGORY_ID=$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_VOTING_CATEGORY: '.$mess.'\n';   
}
sub setADFRAME_VOTING_CATEGORY_ID
{
	my $this	= shift;
	my $ADFRAME_VOTING_CATEGORY_ID = shift;
	if ($this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'} = $ADFRAME_VOTING_CATEGORY_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_VOTING_CATEGORY

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_VOTING_CATEGORY_ID

 setTITLE(String: value)
 getTITLE()

 setTEXT(String: value)
 getTEXT()

 setIMG(String: value)
 getIMG()

 setITEM_0(String: value)
 getITEM_0()

 setIS_RAFFLE(String: value)
 getIS_RAFFLE()

 setVOTES(String: value)
 getVOTES()

 setCR_DATE(String: value)
 getCR_DATE()

 setEND_DATE(String: value)
 getEND_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 