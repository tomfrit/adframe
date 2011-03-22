package ClassADFRAME_VOTING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_VOTING_ID,ADFRAME_VOTING_CATEGORY_ID,ADFRAME_USER_ID,VALUE,ITEM_0,ITEM_1,ITEM_2,ITEM_3,CR_DATE,IS_ACTIVE';

sub getADFRAME_VOTING_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_VOTING_ID'};
}

sub setADFRAME_VOTING_CATEGORY_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'} = shift;
}
sub getADFRAME_VOTING_CATEGORY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'};
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

sub setVALUE
{
	my $this	= shift;
	$this->{col}->{'VALUE'} = shift;
}
sub getVALUE
{
	my $this	= shift;
	return $this->{col}->{'VALUE'};
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
	if ($this->{col}->{'ADFRAME_VOTING_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_VOTING_ID = "NULL";
		$valueADFRAME_VOTING_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_VOTING_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_VOTING_ID");
		}

		my $valueADFRAME_VOTING_CATEGORY_ID = $this->{col}->{ADFRAME_VOTING_CATEGORY_ID};
		$valueADFRAME_VOTING_CATEGORY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_VOTING_CATEGORY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_VOTING_CATEGORY_ID");
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

		my $valueVALUE = $this->{col}->{VALUE};
		$valueVALUE =~ s/\'/\\\'/g;
		if ($valueVALUE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueVALUE");
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


		$this->{col}->{'ADFRAME_VOTING_ID'} = $this->insert('ADFRAME_VOTING','ADFRAME_VOTING_ID,ADFRAME_VOTING_CATEGORY_ID,ADFRAME_USER_ID,VALUE,ITEM_0,ITEM_1,ITEM_2,ITEM_3,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_VOTING_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_VOTING_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_VOTING_CATEGORY_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"ADFRAME_VOTING_CATEGORY_ID=$value","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_VOTING_CATEGORY_ID=$value with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"ADFRAME_USER_ID=$value","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID=$value with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'VALUE'})
		{
			my $value = $this->{col}->{'VALUE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"VALUE=$value","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VALUE=$value with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_0'})
		{
			my $value = $this->{col}->{'ITEM_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"ITEM_0='$value'","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_0='$value' with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1'})
		{
			my $value = $this->{col}->{'ITEM_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"ITEM_1='$value'","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1='$value' with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2'})
		{
			my $value = $this->{col}->{'ITEM_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"ITEM_2='$value'","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2='$value' with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3'})
		{
			my $value = $this->{col}->{'ITEM_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"ITEM_3='$value'","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3='$value' with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"CR_DATE='$value'","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_VOTING',"IS_ACTIVE=$value","ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_VOTING_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_VOTING',"$SQL_COLS","ADFRAME_VOTING_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_VOTING_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_VOTING','ADFRAME_VOTING_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_VOTING_ID'}>0)
	{
		$this->delete('ADFRAME_VOTING',"ADFRAME_VOTING_ID=$this->{col}->{'ADFRAME_VOTING_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_VOTING: '.$mess.'\n';   
}
sub setADFRAME_VOTING_ID
{
	my $this	= shift;
	my $ADFRAME_VOTING_ID = shift;
	if ($this->{col}->{'ADFRAME_VOTING_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_VOTING_ID'} = $ADFRAME_VOTING_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_VOTING

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_VOTING_ID

 setADFRAME_VOTING_CATEGORY_ID(String: value)
 getADFRAME_VOTING_CATEGORY_ID()

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setVALUE(String: value)
 getVALUE()

 setITEM_0(String: value)
 getITEM_0()

 setITEM_1(String: value)
 getITEM_1()

 setITEM_2(String: value)
 getITEM_2()

 setITEM_3(String: value)
 getITEM_3()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 