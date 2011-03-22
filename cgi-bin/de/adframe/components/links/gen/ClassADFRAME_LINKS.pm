package ClassADFRAME_LINKS;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_LINKS_ID,ADFRAME_CHANNEL,ADFRAME_LINKSCATEGORY_ID,TITLE,URL,DESCR,IMAGE_0,IMAGE_1,ITEM_0,ITEM_1,IS_ACTIVE';

sub getADFRAME_LINKS_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_LINKS_ID'};
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

sub setADFRAME_LINKSCATEGORY_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_LINKSCATEGORY_ID'} = shift;
}
sub getADFRAME_LINKSCATEGORY_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_LINKSCATEGORY_ID'};
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

sub setIMAGE_0
{
	my $this	= shift;
	$this->{col}->{'IMAGE_0'} = shift;
}
sub getIMAGE_0
{
	my $this	= shift;
	return $this->{col}->{'IMAGE_0'};
}

sub setIMAGE_1
{
	my $this	= shift;
	$this->{col}->{'IMAGE_1'} = shift;
}
sub getIMAGE_1
{
	my $this	= shift;
	return $this->{col}->{'IMAGE_1'};
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
	if ($this->{col}->{'ADFRAME_LINKS_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_LINKS_ID = "NULL";
		$valueADFRAME_LINKS_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_LINKS_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_LINKS_ID");
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

		my $valueADFRAME_LINKSCATEGORY_ID = $this->{col}->{ADFRAME_LINKSCATEGORY_ID};
		$valueADFRAME_LINKSCATEGORY_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_LINKSCATEGORY_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_LINKSCATEGORY_ID");
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

		my $valueDESCR = $this->{col}->{DESCR};
		$valueDESCR =~ s/\'/\\\'/g;
		if ($valueDESCR eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueDESCR'");
		}

		my $valueIMAGE_0 = $this->{col}->{IMAGE_0};
		$valueIMAGE_0 =~ s/\'/\\\'/g;
		if ($valueIMAGE_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_0'");
		}

		my $valueIMAGE_1 = $this->{col}->{IMAGE_1};
		$valueIMAGE_1 =~ s/\'/\\\'/g;
		if ($valueIMAGE_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_1'");
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


		$this->{col}->{'ADFRAME_LINKS_ID'} = $this->insert('ADFRAME_LINKS','ADFRAME_LINKS_ID,ADFRAME_CHANNEL,ADFRAME_LINKSCATEGORY_ID,TITLE,URL,DESCR,IMAGE_0,IMAGE_1,ITEM_0,ITEM_1,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_LINKS_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_LINKS_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"ADFRAME_CHANNEL='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_LINKSCATEGORY_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_LINKSCATEGORY_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"ADFRAME_LINKSCATEGORY_ID=$value","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_LINKSCATEGORY_ID=$value with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'TITLE'})
		{
			my $value = $this->{col}->{'TITLE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"TITLE='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TITLE='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'URL'})
		{
			my $value = $this->{col}->{'URL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"URL='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update URL='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'DESCR'})
		{
			my $value = $this->{col}->{'DESCR'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"DESCR='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update DESCR='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_0'})
		{
			my $value = $this->{col}->{'IMAGE_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"IMAGE_0='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE_0='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_1'})
		{
			my $value = $this->{col}->{'IMAGE_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"IMAGE_1='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMAGE_1='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_0'})
		{
			my $value = $this->{col}->{'ITEM_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"ITEM_0='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_0='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1'})
		{
			my $value = $this->{col}->{'ITEM_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"ITEM_1='$value'","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1='$value' with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_LINKS',"IS_ACTIVE=$value","ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_LINKS_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_LINKS',"$SQL_COLS","ADFRAME_LINKS_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_LINKS_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_LINKS','ADFRAME_LINKS_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_LINKS_ID'}>0)
	{
		$this->delete('ADFRAME_LINKS',"ADFRAME_LINKS_ID=$this->{col}->{'ADFRAME_LINKS_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_LINKS: '.$mess.'\n';   
}
sub setADFRAME_LINKS_ID
{
	my $this	= shift;
	my $ADFRAME_LINKS_ID = shift;
	if ($this->{col}->{'ADFRAME_LINKS_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_LINKS_ID'} = $ADFRAME_LINKS_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_LINKS

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_LINKS_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setADFRAME_LINKSCATEGORY_ID(String: value)
 getADFRAME_LINKSCATEGORY_ID()

 setTITLE(String: value)
 getTITLE()

 setURL(String: value)
 getURL()

 setDESCR(String: value)
 getDESCR()

 setIMAGE_0(String: value)
 getIMAGE_0()

 setIMAGE_1(String: value)
 getIMAGE_1()

 setITEM_0(String: value)
 getITEM_0()

 setITEM_1(String: value)
 getITEM_1()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 