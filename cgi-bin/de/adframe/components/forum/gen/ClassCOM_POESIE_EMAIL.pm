package ClassCOM_POESIE_EMAIL;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'COM_POESIE_EMAIL_ID,SENDER_ADFRAME_USER_ID,SENDER_LOGIN,RECIPIENT_ADFRAME_USER_ID,RECIPIENT_LOGIN,STATUS_SENDER,STATUS_RECIPIENT,EMAIL_SUBJECT,EMAIL_COMMENT,HIDDEN_FIELD,CR_DATE,IS_ACTIVE';

sub getCOM_POESIE_EMAIL_ID
{
	my $this	= shift;
	return $this->{col}->{'COM_POESIE_EMAIL_ID'};
}

sub setSENDER_ADFRAME_USER_ID
{
	my $this	= shift;
	$this->{col}->{'SENDER_ADFRAME_USER_ID'} = shift;
}
sub getSENDER_ADFRAME_USER_ID
{
	my $this	= shift;
	return $this->{col}->{'SENDER_ADFRAME_USER_ID'};
}

sub setSENDER_LOGIN
{
	my $this	= shift;
	$this->{col}->{'SENDER_LOGIN'} = shift;
}
sub getSENDER_LOGIN
{
	my $this	= shift;
	return $this->{col}->{'SENDER_LOGIN'};
}

sub setRECIPIENT_ADFRAME_USER_ID
{
	my $this	= shift;
	$this->{col}->{'RECIPIENT_ADFRAME_USER_ID'} = shift;
}
sub getRECIPIENT_ADFRAME_USER_ID
{
	my $this	= shift;
	return $this->{col}->{'RECIPIENT_ADFRAME_USER_ID'};
}

sub setRECIPIENT_LOGIN
{
	my $this	= shift;
	$this->{col}->{'RECIPIENT_LOGIN'} = shift;
}
sub getRECIPIENT_LOGIN
{
	my $this	= shift;
	return $this->{col}->{'RECIPIENT_LOGIN'};
}

sub setSTATUS_SENDER
{
	my $this	= shift;
	$this->{col}->{'STATUS_SENDER'} = shift;
}
sub getSTATUS_SENDER
{
	my $this	= shift;
	return $this->{col}->{'STATUS_SENDER'};
}

sub setSTATUS_RECIPIENT
{
	my $this	= shift;
	$this->{col}->{'STATUS_RECIPIENT'} = shift;
}
sub getSTATUS_RECIPIENT
{
	my $this	= shift;
	return $this->{col}->{'STATUS_RECIPIENT'};
}

sub setEMAIL_SUBJECT
{
	my $this	= shift;
	$this->{col}->{'EMAIL_SUBJECT'} = shift;
}
sub getEMAIL_SUBJECT
{
	my $this	= shift;
	return $this->{col}->{'EMAIL_SUBJECT'};
}

sub setEMAIL_COMMENT
{
	my $this	= shift;
	$this->{col}->{'EMAIL_COMMENT'} = shift;
}
sub getEMAIL_COMMENT
{
	my $this	= shift;
	return $this->{col}->{'EMAIL_COMMENT'};
}

sub setHIDDEN_FIELD
{
	my $this	= shift;
	$this->{col}->{'HIDDEN_FIELD'} = shift;
}
sub getHIDDEN_FIELD
{
	my $this	= shift;
	return $this->{col}->{'HIDDEN_FIELD'};
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
	if ($this->{col}->{'COM_POESIE_EMAIL_ID'}<1)
	{
		my @values = ();
		my $valueCOM_POESIE_EMAIL_ID = "NULL";
		$valueCOM_POESIE_EMAIL_ID =~ s/\'/\\\'/g;
		if ("$valueCOM_POESIE_EMAIL_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueCOM_POESIE_EMAIL_ID");
		}

		my $valueSENDER_ADFRAME_USER_ID = $this->{col}->{SENDER_ADFRAME_USER_ID};
		$valueSENDER_ADFRAME_USER_ID =~ s/\'/\\\'/g;
		if ("$valueSENDER_ADFRAME_USER_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSENDER_ADFRAME_USER_ID");
		}

		my $valueSENDER_LOGIN = $this->{col}->{SENDER_LOGIN};
		$valueSENDER_LOGIN =~ s/\'/\\\'/g;
		if ("'$valueSENDER_LOGIN'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSENDER_LOGIN'");
		}

		my $valueRECIPIENT_ADFRAME_USER_ID = $this->{col}->{RECIPIENT_ADFRAME_USER_ID};
		$valueRECIPIENT_ADFRAME_USER_ID =~ s/\'/\\\'/g;
		if ("$valueRECIPIENT_ADFRAME_USER_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueRECIPIENT_ADFRAME_USER_ID");
		}

		my $valueRECIPIENT_LOGIN = $this->{col}->{RECIPIENT_LOGIN};
		$valueRECIPIENT_LOGIN =~ s/\'/\\\'/g;
		if ("'$valueRECIPIENT_LOGIN'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueRECIPIENT_LOGIN'");
		}

		my $valueSTATUS_SENDER = $this->{col}->{STATUS_SENDER};
		$valueSTATUS_SENDER =~ s/\'/\\\'/g;
		if ("'$valueSTATUS_SENDER'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSTATUS_SENDER'");
		}

		my $valueSTATUS_RECIPIENT = $this->{col}->{STATUS_RECIPIENT};
		$valueSTATUS_RECIPIENT =~ s/\'/\\\'/g;
		if ("'$valueSTATUS_RECIPIENT'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSTATUS_RECIPIENT'");
		}

		my $valueEMAIL_SUBJECT = $this->{col}->{EMAIL_SUBJECT};
		$valueEMAIL_SUBJECT =~ s/\'/\\\'/g;
		if ("'$valueEMAIL_SUBJECT'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEMAIL_SUBJECT'");
		}

		my $valueEMAIL_COMMENT = $this->{col}->{EMAIL_COMMENT};
		$valueEMAIL_COMMENT =~ s/\'/\\\'/g;
		if ("'$valueEMAIL_COMMENT'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueEMAIL_COMMENT'");
		}

		my $valueHIDDEN_FIELD = $this->{col}->{HIDDEN_FIELD};
		$valueHIDDEN_FIELD =~ s/\'/\\\'/g;
		if ("'$valueHIDDEN_FIELD'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueHIDDEN_FIELD'");
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

		my $valueIS_ACTIVE = $this->{col}->{IS_ACTIVE};
		$valueIS_ACTIVE =~ s/\'/\\\'/g;
		if ("$valueIS_ACTIVE" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueIS_ACTIVE");
		}


		$this->{col}->{'COM_POESIE_EMAIL_ID'} = $this->insert('COM_POESIE_EMAIL','COM_POESIE_EMAIL_ID,SENDER_ADFRAME_USER_ID,SENDER_LOGIN,RECIPIENT_ADFRAME_USER_ID,RECIPIENT_LOGIN,STATUS_SENDER,STATUS_RECIPIENT,EMAIL_SUBJECT,EMAIL_COMMENT,HIDDEN_FIELD,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'COM_POESIE_EMAIL_ID'};
	}
	elsif ($this->{col}->{'COM_POESIE_EMAIL_ID'}>0)
	{
		if (defined $this->{col}->{'SENDER_ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'SENDER_ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"SENDER_ADFRAME_USER_ID=$value","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update SENDER_ADFRAME_USER_ID=$value with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'SENDER_LOGIN'})
		{
			my $value = $this->{col}->{'SENDER_LOGIN'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"SENDER_LOGIN='$value'","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update SENDER_LOGIN='$value' with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'RECIPIENT_ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'RECIPIENT_ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"RECIPIENT_ADFRAME_USER_ID=$value","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update RECIPIENT_ADFRAME_USER_ID=$value with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'RECIPIENT_LOGIN'})
		{
			my $value = $this->{col}->{'RECIPIENT_LOGIN'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"RECIPIENT_LOGIN='$value'","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update RECIPIENT_LOGIN='$value' with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'STATUS_SENDER'})
		{
			my $value = $this->{col}->{'STATUS_SENDER'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"STATUS_SENDER='$value'","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update STATUS_SENDER='$value' with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'STATUS_RECIPIENT'})
		{
			my $value = $this->{col}->{'STATUS_RECIPIENT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"STATUS_RECIPIENT='$value'","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update STATUS_RECIPIENT='$value' with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'EMAIL_SUBJECT'})
		{
			my $value = $this->{col}->{'EMAIL_SUBJECT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"EMAIL_SUBJECT='$value'","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update EMAIL_SUBJECT='$value' with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'EMAIL_COMMENT'})
		{
			my $value = $this->{col}->{'EMAIL_COMMENT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"EMAIL_COMMENT='$value'","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update EMAIL_COMMENT='$value' with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'HIDDEN_FIELD'})
		{
			my $value = $this->{col}->{'HIDDEN_FIELD'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"HIDDEN_FIELD='$value'","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update HIDDEN_FIELD='$value' with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('COM_POESIE_EMAIL',"IS_ACTIVE=$value","COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}"))
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
			}
		}


		
		return $this->{col}->{'COM_POESIE_EMAIL_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if ($id>0)
	{
		my @data = split(/\|/, $this->get('COM_POESIE_EMAIL',"$SQL_COLS","COM_POESIE_EMAIL_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - COM_POESIE_EMAIL_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('COM_POESIE_EMAIL','COM_POESIE_EMAIL_ID',"$condition");
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

sub deleteFromDB
{
	my $this		= shift;
	if ($this->{col}->{'COM_POESIE_EMAIL_ID'}>0)
	{
		$this->delete('COM_POESIE_EMAIL',"COM_POESIE_EMAIL_ID=$this->{col}->{'COM_POESIE_EMAIL_ID'}");
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
	$this->{errormessage}.='ClassCOM_POESIE_EMAIL: '.$mess.'\n';   
}
sub setCOM_POESIE_EMAIL_ID
{
	my $this	= shift;
	my $COM_POESIE_EMAIL_ID = shift;
	if ($this->{col}->{'COM_POESIE_EMAIL_ID'} < 1)
	{
		$this->{col}->{'COM_POESIE_EMAIL_ID'} = $COM_POESIE_EMAIL_ID;
	}
}

1;
__END__

=head1 NAME ClassCOM_POESIE_EMAIL

=head2 extends DbAdapter

=head1 METHODS

 getCOM_POESIE_EMAIL_ID

 setSENDER_ADFRAME_USER_ID(String: value)
 getSENDER_ADFRAME_USER_ID()

 setSENDER_LOGIN(String: value)
 getSENDER_LOGIN()

 setRECIPIENT_ADFRAME_USER_ID(String: value)
 getRECIPIENT_ADFRAME_USER_ID()

 setRECIPIENT_LOGIN(String: value)
 getRECIPIENT_LOGIN()

 setSTATUS_SENDER(String: value)
 getSTATUS_SENDER()

 setSTATUS_RECIPIENT(String: value)
 getSTATUS_RECIPIENT()

 setEMAIL_SUBJECT(String: value)
 getEMAIL_SUBJECT()

 setEMAIL_COMMENT(String: value)
 getEMAIL_COMMENT()

 setHIDDEN_FIELD(String: value)
 getHIDDEN_FIELD()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 