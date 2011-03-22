package ClassADFRAME_USER_FOTOS;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USER_FOTO_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,ADFRAME_USER_FOTOALBUM_ID,TITLE,TEXT,CREDIT,RIDER,SPOT,CITY,COUNTRY,ITEM_0,ITEM_1,ITEM_2,ITEM_3,URL,VIEWCOUNT,RANK,ALLOW_RATE,ALLOW_COMMENTS,CR_DATE,IS_ACTIVE';

sub getADFRAME_USER_FOTO_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USER_FOTO_ID'};
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

sub setADFRAME_USER_FOTOALBUM_ID
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'} = shift;
}
sub getADFRAME_USER_FOTOALBUM_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'};
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

sub setCREDIT
{
	my $this	= shift;
	$this->{col}->{'CREDIT'} = shift;
}
sub getCREDIT
{
	my $this	= shift;
	return $this->{col}->{'CREDIT'};
}

sub setRIDER
{
	my $this	= shift;
	$this->{col}->{'RIDER'} = shift;
}
sub getRIDER
{
	my $this	= shift;
	return $this->{col}->{'RIDER'};
}

sub setSPOT
{
	my $this	= shift;
	$this->{col}->{'SPOT'} = shift;
}
sub getSPOT
{
	my $this	= shift;
	return $this->{col}->{'SPOT'};
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

sub setVIEWCOUNT
{
	my $this	= shift;
	$this->{col}->{'VIEWCOUNT'} = shift;
}
sub getVIEWCOUNT
{
	my $this	= shift;
	return $this->{col}->{'VIEWCOUNT'};
}

sub setRANK
{
	my $this	= shift;
	$this->{col}->{'RANK'} = shift;
}
sub getRANK
{
	my $this	= shift;
	return $this->{col}->{'RANK'};
}

sub setALLOW_RATE
{
	my $this	= shift;
	$this->{col}->{'ALLOW_RATE'} = shift;
}
sub getALLOW_RATE
{
	my $this	= shift;
	return $this->{col}->{'ALLOW_RATE'};
}

sub setALLOW_COMMENTS
{
	my $this	= shift;
	$this->{col}->{'ALLOW_COMMENTS'} = shift;
}
sub getALLOW_COMMENTS
{
	my $this	= shift;
	return $this->{col}->{'ALLOW_COMMENTS'};
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
	if ($this->{col}->{'ADFRAME_USER_FOTO_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_USER_FOTO_ID = "NULL";
		$valueADFRAME_USER_FOTO_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_USER_FOTO_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USER_FOTO_ID");
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

		my $valueADFRAME_USER_FOTOALBUM_ID = $this->{col}->{ADFRAME_USER_FOTOALBUM_ID};
		$valueADFRAME_USER_FOTOALBUM_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_USER_FOTOALBUM_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USER_FOTOALBUM_ID");
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

		my $valueCREDIT = $this->{col}->{CREDIT};
		$valueCREDIT =~ s/\'/\\\'/g;
		if ($valueCREDIT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCREDIT'");
		}

		my $valueRIDER = $this->{col}->{RIDER};
		$valueRIDER =~ s/\'/\\\'/g;
		if ($valueRIDER eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueRIDER'");
		}

		my $valueSPOT = $this->{col}->{SPOT};
		$valueSPOT =~ s/\'/\\\'/g;
		if ($valueSPOT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSPOT'");
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

		my $valueVIEWCOUNT = $this->{col}->{VIEWCOUNT};
		$valueVIEWCOUNT =~ s/\'/\\\'/g;
		if ($valueVIEWCOUNT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueVIEWCOUNT");
		}

		my $valueRANK = $this->{col}->{RANK};
		$valueRANK =~ s/\'/\\\'/g;
		if ($valueRANK eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueRANK");
		}

		my $valueALLOW_RATE = $this->{col}->{ALLOW_RATE};
		$valueALLOW_RATE =~ s/\'/\\\'/g;
		if ($valueALLOW_RATE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueALLOW_RATE'");
		}

		my $valueALLOW_COMMENTS = $this->{col}->{ALLOW_COMMENTS};
		$valueALLOW_COMMENTS =~ s/\'/\\\'/g;
		if ($valueALLOW_COMMENTS eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueALLOW_COMMENTS'");
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


		$this->{col}->{'ADFRAME_USER_FOTO_ID'} = $this->insert('ADFRAME_USER_FOTOS','ADFRAME_USER_FOTO_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,ADFRAME_USER_FOTOALBUM_ID,TITLE,TEXT,CREDIT,RIDER,SPOT,CITY,COUNTRY,ITEM_0,ITEM_1,ITEM_2,ITEM_3,URL,VIEWCOUNT,RANK,ALLOW_RATE,ALLOW_COMMENTS,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_USER_FOTO_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_USER_FOTO_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ADFRAME_CHANNEL='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ADFRAME_USER_ID=$value","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID=$value with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ADFRAME_USER_FOTOALBUM_ID=$value","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_FOTOALBUM_ID=$value with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'TITLE'})
		{
			my $value = $this->{col}->{'TITLE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"TITLE='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TITLE='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT'})
		{
			my $value = $this->{col}->{'TEXT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"TEXT='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'CREDIT'})
		{
			my $value = $this->{col}->{'CREDIT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"CREDIT='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CREDIT='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'RIDER'})
		{
			my $value = $this->{col}->{'RIDER'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"RIDER='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update RIDER='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'SPOT'})
		{
			my $value = $this->{col}->{'SPOT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"SPOT='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SPOT='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'CITY'})
		{
			my $value = $this->{col}->{'CITY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"CITY='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CITY='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'COUNTRY'})
		{
			my $value = $this->{col}->{'COUNTRY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"COUNTRY='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COUNTRY='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_0'})
		{
			my $value = $this->{col}->{'ITEM_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ITEM_0='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_0='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1'})
		{
			my $value = $this->{col}->{'ITEM_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ITEM_1='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2'})
		{
			my $value = $this->{col}->{'ITEM_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ITEM_2='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3'})
		{
			my $value = $this->{col}->{'ITEM_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ITEM_3='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'URL'})
		{
			my $value = $this->{col}->{'URL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"URL='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update URL='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEWCOUNT'})
		{
			my $value = $this->{col}->{'VIEWCOUNT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"VIEWCOUNT=$value","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIEWCOUNT=$value with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'RANK'})
		{
			my $value = $this->{col}->{'RANK'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"RANK=$value","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update RANK=$value with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ALLOW_RATE'})
		{
			my $value = $this->{col}->{'ALLOW_RATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ALLOW_RATE='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ALLOW_RATE='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'ALLOW_COMMENTS'})
		{
			my $value = $this->{col}->{'ALLOW_COMMENTS'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"ALLOW_COMMENTS='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ALLOW_COMMENTS='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"CR_DATE='$value'","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOS',"IS_ACTIVE=$value","ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_USER_FOTO_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_USER_FOTOS',"$SQL_COLS","ADFRAME_USER_FOTO_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_USER_FOTO_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_USER_FOTOS','ADFRAME_USER_FOTO_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_USER_FOTO_ID'}>0)
	{
		$this->delete('ADFRAME_USER_FOTOS',"ADFRAME_USER_FOTO_ID=$this->{col}->{'ADFRAME_USER_FOTO_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_USER_FOTOS: '.$mess.'\n';   
}
sub setADFRAME_USER_FOTO_ID
{
	my $this	= shift;
	my $ADFRAME_USER_FOTO_ID = shift;
	if ($this->{col}->{'ADFRAME_USER_FOTO_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_USER_FOTO_ID'} = $ADFRAME_USER_FOTO_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_USER_FOTOS

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_USER_FOTO_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setADFRAME_USER_FOTOALBUM_ID(String: value)
 getADFRAME_USER_FOTOALBUM_ID()

 setTITLE(String: value)
 getTITLE()

 setTEXT(String: value)
 getTEXT()

 setCREDIT(String: value)
 getCREDIT()

 setRIDER(String: value)
 getRIDER()

 setSPOT(String: value)
 getSPOT()

 setCITY(String: value)
 getCITY()

 setCOUNTRY(String: value)
 getCOUNTRY()

 setITEM_0(String: value)
 getITEM_0()

 setITEM_1(String: value)
 getITEM_1()

 setITEM_2(String: value)
 getITEM_2()

 setITEM_3(String: value)
 getITEM_3()

 setURL(String: value)
 getURL()

 setVIEWCOUNT(String: value)
 getVIEWCOUNT()

 setRANK(String: value)
 getRANK()

 setALLOW_RATE(String: value)
 getALLOW_RATE()

 setALLOW_COMMENTS(String: value)
 getALLOW_COMMENTS()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 