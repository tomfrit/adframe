package ClassADFRAME_MCMS_RATING;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'id,login,mcms_id,rating,CR_DATE';

sub getid
{
	my $this	= shift;
	return $this->{col}->{'id'};
}

sub setlogin
{
	my $this	= shift;
	$this->{col}->{'login'} = shift;
}
sub getlogin
{
	my $this	= shift;
	return $this->{col}->{'login'};
}

sub setmcms_id
{
	my $this	= shift;
	$this->{col}->{'mcms_id'} = shift;
}
sub getmcms_id
{
	my $this	= shift;
	return $this->{col}->{'mcms_id'};
}

sub setrating
{
	my $this	= shift;
	$this->{col}->{'rating'} = shift;
}
sub getrating
{
	my $this	= shift;
	return $this->{col}->{'rating'};
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
	if ($this->{col}->{'id'}<1)
	{
		my @values = ();
		my $valueid = "NULL";
		$valueid =~ s/\'/\\\'/g;
		if ($valueid eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueid");
		}

		my $valuelogin = $this->{col}->{login};
		$valuelogin =~ s/\'/\\\'/g;
		if ($valuelogin eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valuelogin");
		}

		my $valuemcms_id = $this->{col}->{mcms_id};
		$valuemcms_id =~ s/\'/\\\'/g;
		if ($valuemcms_id eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valuemcms_id");
		}

		my $valuerating = $this->{col}->{rating};
		$valuerating =~ s/\'/\\\'/g;
		if ($valuerating eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valuerating");
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


		$this->{col}->{'id'} = $this->insert('ADFRAME_MCMS_RATING','id,login,mcms_id,rating,CR_DATE',@values);
		return $this->{col}->{'id'};
	}
	elsif ($this->{col}->{'id'}>0)
	{
		if (defined $this->{col}->{'login'})
		{
			my $value = $this->{col}->{'login'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS_RATING',"login=$value","id=$this->{col}->{'id'}")<1)
			{
				$this->addErrorMessage("Cannot update login=$value with id=$this->{col}->{'id'}");
			}
		}

		if (defined $this->{col}->{'mcms_id'})
		{
			my $value = $this->{col}->{'mcms_id'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS_RATING',"mcms_id=$value","id=$this->{col}->{'id'}")<1)
			{
				$this->addErrorMessage("Cannot update mcms_id=$value with id=$this->{col}->{'id'}");
			}
		}

		if (defined $this->{col}->{'rating'})
		{
			my $value = $this->{col}->{'rating'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS_RATING',"rating=$value","id=$this->{col}->{'id'}")<1)
			{
				$this->addErrorMessage("Cannot update rating=$value with id=$this->{col}->{'id'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS_RATING',"CR_DATE='$value'","id=$this->{col}->{'id'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with id=$this->{col}->{'id'}");
			}
		}


		
		return $this->{col}->{'id'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_MCMS_RATING',"$SQL_COLS","id=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - id < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_MCMS_RATING','id',"$condition");
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
	if ($this->{col}->{'id'}>0)
	{
		$this->delete('ADFRAME_MCMS_RATING',"id=$this->{col}->{'id'}");
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
	$this->{errormessage}.='ClassADFRAME_MCMS_RATING: '.$mess.'\n';   
}
sub setid
{
	my $this	= shift;
	my $id = shift;
	if ($this->{col}->{'id'} < 1)
	{
		$this->{col}->{'id'} = $id;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_MCMS_RATING

=head2 extends DbAdapter

=head1 METHODS

 getid

 setlogin(String: value)
 getlogin()

 setmcms_id(String: value)
 getmcms_id()

 setrating(String: value)
 getrating()

 setCR_DATE(String: value)
 getCR_DATE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 