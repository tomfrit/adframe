package ClassADFRAME_MCMS_EXT;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_MCMS_EXT_ID,ADFRAME_MCMS_ID,RANK_NO,ITEM_EXT_1,ITEM_EXT_2,IMG_EXT_1,IMG_EXT_2,TEXT_EXT,CR_DATE,IS_ACTIVE';

sub getADFRAME_MCMS_EXT_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_MCMS_EXT_ID'};
}

sub setADFRAME_MCMS_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_MCMS_ID'} = shift;
}
sub getADFRAME_MCMS_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_MCMS_ID'};
}

sub setRANK_NO
{
	my $this	= shift;
	$this->{col}->{'RANK_NO'} = shift;
}
sub getRANK_NO
{
	my $this	= shift;
	return $this->{col}->{'RANK_NO'};
}

sub setITEM_EXT_1
{
	my $this	= shift;
	$this->{col}->{'ITEM_EXT_1'} = shift;
}
sub getITEM_EXT_1
{
	my $this	= shift;
	return $this->{col}->{'ITEM_EXT_1'};
}

sub setITEM_EXT_2
{
	my $this	= shift;
	$this->{col}->{'ITEM_EXT_2'} = shift;
}
sub getITEM_EXT_2
{
	my $this	= shift;
	return $this->{col}->{'ITEM_EXT_2'};
}

sub setIMG_EXT_1
{
	my $this	= shift;
	$this->{col}->{'IMG_EXT_1'} = shift;
}
sub getIMG_EXT_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_EXT_1'};
}

sub setIMG_EXT_2
{
	my $this	= shift;
	$this->{col}->{'IMG_EXT_2'} = shift;
}
sub getIMG_EXT_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_EXT_2'};
}

sub setTEXT_EXT
{
	my $this	= shift;
	$this->{col}->{'TEXT_EXT'} = shift;
}
sub getTEXT_EXT
{
	my $this	= shift;
	return $this->{col}->{'TEXT_EXT'};
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
	if ($this->{col}->{'ADFRAME_MCMS_EXT_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_MCMS_EXT_ID = "NULL";
		$valueADFRAME_MCMS_EXT_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_MCMS_EXT_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_MCMS_EXT_ID");
		}

		my $valueADFRAME_MCMS_ID = $this->{col}->{ADFRAME_MCMS_ID};
		$valueADFRAME_MCMS_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_MCMS_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_MCMS_ID");
		}

		my $valueRANK_NO = $this->{col}->{RANK_NO};
		$valueRANK_NO =~ s/\'/\\\'/g;
		if ($valueRANK_NO eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueRANK_NO");
		}

		my $valueITEM_EXT_1 = $this->{col}->{ITEM_EXT_1};
		$valueITEM_EXT_1 =~ s/\'/\\\'/g;
		if ($valueITEM_EXT_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_EXT_1'");
		}

		my $valueITEM_EXT_2 = $this->{col}->{ITEM_EXT_2};
		$valueITEM_EXT_2 =~ s/\'/\\\'/g;
		if ($valueITEM_EXT_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_EXT_2'");
		}

		my $valueIMG_EXT_1 = $this->{col}->{IMG_EXT_1};
		$valueIMG_EXT_1 =~ s/\'/\\\'/g;
		if ($valueIMG_EXT_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_EXT_1'");
		}

		my $valueIMG_EXT_2 = $this->{col}->{IMG_EXT_2};
		$valueIMG_EXT_2 =~ s/\'/\\\'/g;
		if ($valueIMG_EXT_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_EXT_2'");
		}

		my $valueTEXT_EXT = $this->{col}->{TEXT_EXT};
		$valueTEXT_EXT =~ s/\'/\\\'/g;
		if ($valueTEXT_EXT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_EXT'");
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


		$this->{col}->{'ADFRAME_MCMS_EXT_ID'} = $this->insert('ADFRAME_MCMS_EXT','ADFRAME_MCMS_EXT_ID,ADFRAME_MCMS_ID,RANK_NO,ITEM_EXT_1,ITEM_EXT_2,IMG_EXT_1,IMG_EXT_2,TEXT_EXT,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_MCMS_EXT_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_MCMS_EXT_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_MCMS_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_MCMS_ID'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"ADFRAME_MCMS_ID=$value","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADFRAME_MCMS_ID=$value with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'RANK_NO'})
		{
			my $value = $this->{col}->{'RANK_NO'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"RANK_NO=$value","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update RANK_NO=$value with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_EXT_1'})
		{
			my $value = $this->{col}->{'ITEM_EXT_1'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"ITEM_EXT_1='$value'","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update ITEM_EXT_1='$value' with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_EXT_2'})
		{
			my $value = $this->{col}->{'ITEM_EXT_2'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"ITEM_EXT_2='$value'","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update ITEM_EXT_2='$value' with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_EXT_1'})
		{
			my $value = $this->{col}->{'IMG_EXT_1'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"IMG_EXT_1='$value'","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update IMG_EXT_1='$value' with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_EXT_2'})
		{
			my $value = $this->{col}->{'IMG_EXT_2'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"IMG_EXT_2='$value'","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update IMG_EXT_2='$value' with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_EXT'})
		{
			my $value = $this->{col}->{'TEXT_EXT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"TEXT_EXT='$value'","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update TEXT_EXT='$value' with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"CR_DATE='$value'","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_MCMS_EXT',"IS_ACTIVE=$value","ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}"))
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_MCMS_EXT_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if ($id !~/\D/)
	{
		my @data = split(/\|/, $this->get('ADFRAME_MCMS_EXT',"$SQL_COLS","ADFRAME_MCMS_EXT_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_MCMS_EXT_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_MCMS_EXT','ADFRAME_MCMS_EXT_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_MCMS_EXT_ID'}>0)
	{
		$this->delete('ADFRAME_MCMS_EXT',"ADFRAME_MCMS_EXT_ID=$this->{col}->{'ADFRAME_MCMS_EXT_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_MCMS_EXT: '.$mess.'\n';   
}
sub setADFRAME_MCMS_EXT_ID
{
	my $this	= shift;
	my $ADFRAME_MCMS_EXT_ID = shift;
	if ($this->{col}->{'ADFRAME_MCMS_EXT_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_MCMS_EXT_ID'} = $ADFRAME_MCMS_EXT_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_MCMS_EXT

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_MCMS_EXT_ID

 setADFRAME_MCMS_ID(String: value)
 getADFRAME_MCMS_ID()

 setRANK_NO(String: value)
 getRANK_NO()

 setITEM_EXT_1(String: value)
 getITEM_EXT_1()

 setITEM_EXT_2(String: value)
 getITEM_EXT_2()

 setIMG_EXT_1(String: value)
 getIMG_EXT_1()

 setIMG_EXT_2(String: value)
 getIMG_EXT_2()

 setTEXT_EXT(String: value)
 getTEXT_EXT()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 