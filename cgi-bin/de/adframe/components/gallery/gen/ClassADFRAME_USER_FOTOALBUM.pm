package ClassADFRAME_USER_FOTOALBUM;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USER_FOTOALBUM_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,TITLE,TEXT,COUNT,VIEWCOUNT,TITLE_IMG,RANK,UP_DATE,CR_DATE,IS_ACTIVE';

sub getADFRAME_USER_FOTOALBUM_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'};
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

sub setCOUNT
{
	my $this	= shift;
	$this->{col}->{'COUNT'} = shift;
}
sub getCOUNT
{
	my $this	= shift;
	return $this->{col}->{'COUNT'};
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

sub setTITLE_IMG
{
	my $this	= shift;
	$this->{col}->{'TITLE_IMG'} = shift;
}
sub getTITLE_IMG
{
	my $this	= shift;
	return $this->{col}->{'TITLE_IMG'};
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

sub setUP_DATE
{
	my $this	= shift;
	$this->{col}->{'UP_DATE'} = shift;
}
sub getUP_DATE
{
	my $this	= shift;
	return $this->{col}->{'UP_DATE'};
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
	if ($this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_USER_FOTOALBUM_ID = "NULL";
		$valueADFRAME_USER_FOTOALBUM_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_USER_FOTOALBUM_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USER_FOTOALBUM_ID");
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
			push(@values,"'$valueADFRAME_USER_ID'");
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

		my $valueCOUNT = $this->{col}->{COUNT};
		$valueCOUNT =~ s/\'/\\\'/g;
		if ($valueCOUNT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueCOUNT");
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

		my $valueTITLE_IMG = $this->{col}->{TITLE_IMG};
		$valueTITLE_IMG =~ s/\'/\\\'/g;
		if ($valueTITLE_IMG eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTITLE_IMG'");
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

		my $valueUP_DATE = $this->{col}->{UP_DATE};
		$valueUP_DATE =~ s/\'/\\\'/g;
		if ($valueUP_DATE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueUP_DATE'");
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


		$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'} = $this->insert('ADFRAME_USER_FOTOALBUM','ADFRAME_USER_FOTOALBUM_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,TITLE,TEXT,COUNT,VIEWCOUNT,TITLE_IMG,RANK,UP_DATE,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"ADFRAME_CHANNEL='$value'","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"ADFRAME_USER_ID='$value'","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID='$value' with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'TITLE'})
		{
			my $value = $this->{col}->{'TITLE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"TITLE='$value'","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TITLE='$value' with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT'})
		{
			my $value = $this->{col}->{'TEXT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"TEXT='$value'","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT='$value' with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'COUNT'})
		{
			my $value = $this->{col}->{'COUNT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"COUNT=$value","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update COUNT=$value with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEWCOUNT'})
		{
			my $value = $this->{col}->{'VIEWCOUNT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"VIEWCOUNT=$value","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIEWCOUNT=$value with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'TITLE_IMG'})
		{
			my $value = $this->{col}->{'TITLE_IMG'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"TITLE_IMG='$value'","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TITLE_IMG='$value' with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'RANK'})
		{
			my $value = $this->{col}->{'RANK'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"RANK=$value","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update RANK=$value with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'UP_DATE'})
		{
			my $value = $this->{col}->{'UP_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"UP_DATE='$value'","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update UP_DATE='$value' with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"CR_DATE='$value'","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_USER_FOTOALBUM',"IS_ACTIVE=$value","ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_USER_FOTOALBUM',"$SQL_COLS","ADFRAME_USER_FOTOALBUM_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_USER_FOTOALBUM_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_USER_FOTOALBUM','ADFRAME_USER_FOTOALBUM_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}>0)
	{
		$this->delete('ADFRAME_USER_FOTOALBUM',"ADFRAME_USER_FOTOALBUM_ID=$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_USER_FOTOALBUM: '.$mess.'\n';   
}
sub setADFRAME_USER_FOTOALBUM_ID
{
	my $this	= shift;
	my $ADFRAME_USER_FOTOALBUM_ID = shift;
	if ($this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_USER_FOTOALBUM_ID'} = $ADFRAME_USER_FOTOALBUM_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_USER_FOTOALBUM

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_USER_FOTOALBUM_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setTITLE(String: value)
 getTITLE()

 setTEXT(String: value)
 getTEXT()

 setCOUNT(String: value)
 getCOUNT()

 setVIEWCOUNT(String: value)
 getVIEWCOUNT()

 setTITLE_IMG(String: value)
 getTITLE_IMG()

 setRANK(String: value)
 getRANK()

 setUP_DATE(String: value)
 getUP_DATE()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 