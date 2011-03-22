package ClassADFRAME_COM_USER;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_COM_USER_ID,ADFRAME_USER_ID,PASSWD_QUESTION,PASSWD_ANSWER,URL,SHOW_NAME,SHOW_CITY,SHOW_STREET,SHOW_EMAIL,SHOW_URL,SHOW_BIRTHDAY,SHOW_HOBBY,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,CR_DATE,IS_ACTIVE';

sub getADFRAME_COM_USER_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_COM_USER_ID'};
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

sub setPASSWD_QUESTION
{
	my $this	= shift;
	$this->{col}->{'PASSWD_QUESTION'} = shift;
}
sub getPASSWD_QUESTION
{
	my $this	= shift;
	return $this->{col}->{'PASSWD_QUESTION'};
}

sub setPASSWD_ANSWER
{
	my $this	= shift;
	$this->{col}->{'PASSWD_ANSWER'} = shift;
}
sub getPASSWD_ANSWER
{
	my $this	= shift;
	return $this->{col}->{'PASSWD_ANSWER'};
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

sub setSHOW_NAME
{
	my $this	= shift;
	$this->{col}->{'SHOW_NAME'} = shift;
}
sub getSHOW_NAME
{
	my $this	= shift;
	return $this->{col}->{'SHOW_NAME'};
}

sub setSHOW_CITY
{
	my $this	= shift;
	$this->{col}->{'SHOW_CITY'} = shift;
}
sub getSHOW_CITY
{
	my $this	= shift;
	return $this->{col}->{'SHOW_CITY'};
}

sub setSHOW_STREET
{
	my $this	= shift;
	$this->{col}->{'SHOW_STREET'} = shift;
}
sub getSHOW_STREET
{
	my $this	= shift;
	return $this->{col}->{'SHOW_STREET'};
}

sub setSHOW_EMAIL
{
	my $this	= shift;
	$this->{col}->{'SHOW_EMAIL'} = shift;
}
sub getSHOW_EMAIL
{
	my $this	= shift;
	return $this->{col}->{'SHOW_EMAIL'};
}

sub setSHOW_URL
{
	my $this	= shift;
	$this->{col}->{'SHOW_URL'} = shift;
}
sub getSHOW_URL
{
	my $this	= shift;
	return $this->{col}->{'SHOW_URL'};
}

sub setSHOW_BIRTHDAY
{
	my $this	= shift;
	$this->{col}->{'SHOW_BIRTHDAY'} = shift;
}
sub getSHOW_BIRTHDAY
{
	my $this	= shift;
	return $this->{col}->{'SHOW_BIRTHDAY'};
}

sub setSHOW_HOBBY
{
	my $this	= shift;
	$this->{col}->{'SHOW_HOBBY'} = shift;
}
sub getSHOW_HOBBY
{
	my $this	= shift;
	return $this->{col}->{'SHOW_HOBBY'};
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

sub setIMAGE_2
{
	my $this	= shift;
	$this->{col}->{'IMAGE_2'} = shift;
}
sub getIMAGE_2
{
	my $this	= shift;
	return $this->{col}->{'IMAGE_2'};
}

sub setIMAGE_3
{
	my $this	= shift;
	$this->{col}->{'IMAGE_3'} = shift;
}
sub getIMAGE_3
{
	my $this	= shift;
	return $this->{col}->{'IMAGE_3'};
}

sub setLAST_LOGIN
{
	my $this	= shift;
	$this->{col}->{'LAST_LOGIN'} = shift;
}
sub getLAST_LOGIN
{
	my $this	= shift;
	return $this->{col}->{'LAST_LOGIN'};
}

sub setLOGIN_COUNT
{
	my $this	= shift;
	$this->{col}->{'LOGIN_COUNT'} = shift;
}
sub getLOGIN_COUNT
{
	my $this	= shift;
	return $this->{col}->{'LOGIN_COUNT'};
}

sub setLAST_VIEW
{
	my $this	= shift;
	$this->{col}->{'LAST_VIEW'} = shift;
}
sub getLAST_VIEW
{
	my $this	= shift;
	return $this->{col}->{'LAST_VIEW'};
}

sub setVIEW_COUNT
{
	my $this	= shift;
	$this->{col}->{'VIEW_COUNT'} = shift;
}
sub getVIEW_COUNT
{
	my $this	= shift;
	return $this->{col}->{'VIEW_COUNT'};
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
	if ($this->{col}->{'ADFRAME_COM_USER_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_COM_USER_ID = "NULL";
		$valueADFRAME_COM_USER_ID =~ s/\'/\\\'/g;
		if ("$valueADFRAME_COM_USER_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_COM_USER_ID");
		}

		my $valueADFRAME_USER_ID = $this->{col}->{ADFRAME_USER_ID};
		$valueADFRAME_USER_ID =~ s/\'/\\\'/g;
		if ("$valueADFRAME_USER_ID" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_USER_ID");
		}

		my $valuePASSWD_QUESTION = $this->{col}->{PASSWD_QUESTION};
		$valuePASSWD_QUESTION =~ s/\'/\\\'/g;
		if ("'$valuePASSWD_QUESTION'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePASSWD_QUESTION'");
		}

		my $valuePASSWD_ANSWER = $this->{col}->{PASSWD_ANSWER};
		$valuePASSWD_ANSWER =~ s/\'/\\\'/g;
		if ("'$valuePASSWD_ANSWER'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePASSWD_ANSWER'");
		}

		my $valueURL = $this->{col}->{URL};
		$valueURL =~ s/\'/\\\'/g;
		if ("'$valueURL'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueURL'");
		}

		my $valueSHOW_NAME = $this->{col}->{SHOW_NAME};
		$valueSHOW_NAME =~ s/\'/\\\'/g;
		if ("$valueSHOW_NAME" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSHOW_NAME");
		}

		my $valueSHOW_CITY = $this->{col}->{SHOW_CITY};
		$valueSHOW_CITY =~ s/\'/\\\'/g;
		if ("$valueSHOW_CITY" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSHOW_CITY");
		}

		my $valueSHOW_STREET = $this->{col}->{SHOW_STREET};
		$valueSHOW_STREET =~ s/\'/\\\'/g;
		if ("$valueSHOW_STREET" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSHOW_STREET");
		}

		my $valueSHOW_EMAIL = $this->{col}->{SHOW_EMAIL};
		$valueSHOW_EMAIL =~ s/\'/\\\'/g;
		if ("$valueSHOW_EMAIL" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSHOW_EMAIL");
		}

		my $valueSHOW_URL = $this->{col}->{SHOW_URL};
		$valueSHOW_URL =~ s/\'/\\\'/g;
		if ("$valueSHOW_URL" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSHOW_URL");
		}

		my $valueSHOW_BIRTHDAY = $this->{col}->{SHOW_BIRTHDAY};
		$valueSHOW_BIRTHDAY =~ s/\'/\\\'/g;
		if ("$valueSHOW_BIRTHDAY" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSHOW_BIRTHDAY");
		}

		my $valueSHOW_HOBBY = $this->{col}->{SHOW_HOBBY};
		$valueSHOW_HOBBY =~ s/\'/\\\'/g;
		if ("$valueSHOW_HOBBY" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueSHOW_HOBBY");
		}

		my $valueIMAGE_1 = $this->{col}->{IMAGE_1};
		$valueIMAGE_1 =~ s/\'/\\\'/g;
		if ("'$valueIMAGE_1'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_1'");
		}

		my $valueIMAGE_2 = $this->{col}->{IMAGE_2};
		$valueIMAGE_2 =~ s/\'/\\\'/g;
		if ("'$valueIMAGE_2'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_2'");
		}

		my $valueIMAGE_3 = $this->{col}->{IMAGE_3};
		$valueIMAGE_3 =~ s/\'/\\\'/g;
		if ("'$valueIMAGE_3'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMAGE_3'");
		}

		my $valueLAST_LOGIN = $this->{col}->{LAST_LOGIN};
		$valueLAST_LOGIN =~ s/\'/\\\'/g;
		if ("'$valueLAST_LOGIN'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueLAST_LOGIN'");
		}

		my $valueLOGIN_COUNT = $this->{col}->{LOGIN_COUNT};
		$valueLOGIN_COUNT =~ s/\'/\\\'/g;
		if ("$valueLOGIN_COUNT" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueLOGIN_COUNT");
		}

		my $valueLAST_VIEW = $this->{col}->{LAST_VIEW};
		$valueLAST_VIEW =~ s/\'/\\\'/g;
		if ("'$valueLAST_VIEW'" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueLAST_VIEW'");
		}

		my $valueVIEW_COUNT = $this->{col}->{VIEW_COUNT};
		$valueVIEW_COUNT =~ s/\'/\\\'/g;
		if ("$valueVIEW_COUNT" eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueVIEW_COUNT");
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


		$this->{col}->{'ADFRAME_COM_USER_ID'} = $this->insert('ADFRAME_COM_USER','ADFRAME_COM_USER_ID,ADFRAME_USER_ID,PASSWD_QUESTION,PASSWD_ANSWER,URL,SHOW_NAME,SHOW_CITY,SHOW_STREET,SHOW_EMAIL,SHOW_URL,SHOW_BIRTHDAY,SHOW_HOBBY,IMAGE_1,IMAGE_2,IMAGE_3,LAST_LOGIN,LOGIN_COUNT,LAST_VIEW,VIEW_COUNT,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_COM_USER_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_COM_USER_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_USER_ID'})
		{
			my $value = $this->{col}->{'ADFRAME_USER_ID'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"ADFRAME_USER_ID=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update ADFRAME_USER_ID=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'PASSWD_QUESTION'})
		{
			my $value = $this->{col}->{'PASSWD_QUESTION'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"PASSWD_QUESTION='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update PASSWD_QUESTION='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'PASSWD_ANSWER'})
		{
			my $value = $this->{col}->{'PASSWD_ANSWER'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"PASSWD_ANSWER='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update PASSWD_ANSWER='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'URL'})
		{
			my $value = $this->{col}->{'URL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"URL='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update URL='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_NAME'})
		{
			my $value = $this->{col}->{'SHOW_NAME'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"SHOW_NAME=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update SHOW_NAME=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_CITY'})
		{
			my $value = $this->{col}->{'SHOW_CITY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"SHOW_CITY=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update SHOW_CITY=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_STREET'})
		{
			my $value = $this->{col}->{'SHOW_STREET'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"SHOW_STREET=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update SHOW_STREET=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_EMAIL'})
		{
			my $value = $this->{col}->{'SHOW_EMAIL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"SHOW_EMAIL=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update SHOW_EMAIL=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_URL'})
		{
			my $value = $this->{col}->{'SHOW_URL'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"SHOW_URL=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update SHOW_URL=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_BIRTHDAY'})
		{
			my $value = $this->{col}->{'SHOW_BIRTHDAY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"SHOW_BIRTHDAY=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update SHOW_BIRTHDAY=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'SHOW_HOBBY'})
		{
			my $value = $this->{col}->{'SHOW_HOBBY'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"SHOW_HOBBY=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update SHOW_HOBBY=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_1'})
		{
			my $value = $this->{col}->{'IMAGE_1'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"IMAGE_1='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update IMAGE_1='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_2'})
		{
			my $value = $this->{col}->{'IMAGE_2'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"IMAGE_2='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update IMAGE_2='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IMAGE_3'})
		{
			my $value = $this->{col}->{'IMAGE_3'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"IMAGE_3='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update IMAGE_3='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LAST_LOGIN'})
		{
			my $value = $this->{col}->{'LAST_LOGIN'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"LAST_LOGIN='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update LAST_LOGIN='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LOGIN_COUNT'})
		{
			my $value = $this->{col}->{'LOGIN_COUNT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"LOGIN_COUNT=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update LOGIN_COUNT=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'LAST_VIEW'})
		{
			my $value = $this->{col}->{'LAST_VIEW'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"LAST_VIEW='$value'","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update LAST_VIEW='$value' with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEW_COUNT'})
		{
			my $value = $this->{col}->{'VIEW_COUNT'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"VIEW_COUNT=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update VIEW_COUNT=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if (! $this->update('ADFRAME_COM_USER',"IS_ACTIVE=$value","ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}"))
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_COM_USER_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if ($id>0)
	{
		my @data = split(/\|/, $this->get('ADFRAME_COM_USER',"$SQL_COLS","ADFRAME_COM_USER_ID=$id"));
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
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_COM_USER_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_COM_USER','ADFRAME_COM_USER_ID',"$condition");
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
	if ($this->{col}->{'ADFRAME_COM_USER_ID'}>0)
	{
		$this->delete('ADFRAME_COM_USER',"ADFRAME_COM_USER_ID=$this->{col}->{'ADFRAME_COM_USER_ID'}");
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
	$this->{errormessage}.='ClassADFRAME_COM_USER: '.$mess.'\n';   
}
sub setADFRAME_COM_USER_ID
{
	my $this	= shift;
	my $ADFRAME_COM_USER_ID = shift;
	if ($this->{col}->{'ADFRAME_COM_USER_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_COM_USER_ID'} = $ADFRAME_COM_USER_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_COM_USER

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_COM_USER_ID

 setADFRAME_USER_ID(String: value)
 getADFRAME_USER_ID()

 setPASSWD_QUESTION(String: value)
 getPASSWD_QUESTION()

 setPASSWD_ANSWER(String: value)
 getPASSWD_ANSWER()

 setURL(String: value)
 getURL()

 setSHOW_NAME(String: value)
 getSHOW_NAME()

 setSHOW_CITY(String: value)
 getSHOW_CITY()

 setSHOW_STREET(String: value)
 getSHOW_STREET()

 setSHOW_EMAIL(String: value)
 getSHOW_EMAIL()

 setSHOW_URL(String: value)
 getSHOW_URL()

 setSHOW_BIRTHDAY(String: value)
 getSHOW_BIRTHDAY()

 setSHOW_HOBBY(String: value)
 getSHOW_HOBBY()

 setIMAGE_1(String: value)
 getIMAGE_1()

 setIMAGE_2(String: value)
 getIMAGE_2()

 setIMAGE_3(String: value)
 getIMAGE_3()

 setLAST_LOGIN(String: value)
 getLAST_LOGIN()

 setLOGIN_COUNT(String: value)
 getLOGIN_COUNT()

 setLAST_VIEW(String: value)
 getLAST_VIEW()

 setVIEW_COUNT(String: value)
 getVIEW_COUNT()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 