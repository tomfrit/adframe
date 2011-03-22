package SqlClassGenerator;
use de::adframe::resources::generator::Col;
use de::adframe::lib::io::MiniTemplate;
1;
%SQL_DATATYPES = (DATE=>'DATE',DATETIME=>'DATETIME',INT=>'NUMBER',REAL=>'NUMBER',FLOAT=>'NUMBER',BOOL=>'NUMBER');
sub new
{
	my $class					= shift;
	my $this					= {};
	bless $this,$class;
	$this->{classtemplate} 		= new MiniTemplate();
	$this->{classcachetemplate}	= new MiniTemplate();
	$this->{classlisttemplate} 	= new MiniTemplate();
	$this->{listtemplate} 		= new MiniTemplate();
	$this->{cachelisttemplate} 	= new MiniTemplate();
	$this->{cols}				= ();
	if ($this->{classtemplate}->loadSourceFile("DbClassTemplate.txt"))
	{
		if ($this->{classcachetemplate}->loadSourceFile("DbCacheTemplate.txt"))
		{	
			if ($this->{classlisttemplate}->loadSourceFile("DbClassListTemplate.txt"))
			{
				if ($this->{listtemplate}->loadSourceFile("DbListTemplate.txt"))
				{
					if ($this->{cachelisttemplate}->loadSourceFile("DbCacheListTemplate.txt"))
					{
						return $this;
					}
					else
					{
						die "Cannot open CacheListTemplate de/adframe/resources/generator/DbCacheListTemplate.txt\n";					
					}
				}
				else
				{
					die "Cannot open Template de/adframe/resources/generator/DbListTemplate.txt\n";
				}
			}
			else
			{
				die "Cannot open Template de/adframe/resources/generator/DbClassListTemplate.txt\n";
			}
		}
		else
		{
			die "Cannot open Template de/adframe/resources/generator/DbClassListTemplateThin.txt\n";
		}
	}
	else
	{
		die "Cannot open Template de/adframe/resources/generator/DbClassTemplate.txt\n";
	}
}

sub loadSqlFile
{
	my $this	= shift;
	my $file	= shift;
	if (open(HA,$file))
	{
		while (<HA>)
		{
			$this->{sqlline}.=$_;	
		}
		close (HA);
		return 1;
	}
	return 0;
}

sub setTablename
{
	my $this		= shift;
	my $tablename	= shift;
	$this->{tablename} = $tablename;
}

sub setGenPath
{
	my $this		= shift;
	my $genpath		= shift;
	$this->{genpath} = $genpath;
}
sub parseSql
{
	my $this		= shift;
	$this->{cols}	= ();
	
	if ($this->{tablename} ne '' && $this->{sqlline} ne '')
	{
		my @sqlLines = split(/\n/,$this->{sqlline});
		
		my $foundTable  = 0;
		my $thisLine	= '';
		my $col			= '';
		my $datatype	= '';
		my $colconter	= 0;
		
		for (my $i=0;$i<=$#sqlLines; $i++)
		{
			$thisLine = $sqlLines[$i];
			$thisLine=~ s/^\s+//;
			#$thisLine=~ s/\s+$//;
			
			if ($thisLine =~ /create\s+table\s+$this->{tablename}\s+/i)
			{
				$foundTable = 1;
				next;
			}
			if (($foundTable) && ($thisLine =~ /^\)/))
			{
				$foundTable = 0;
				last;
			}
			if ($foundTable)
			{
				if (($thisLine =~ /^\(/) || ($thisLine eq '') || ($thisLine =~ /#/))
				{
					next;
				}
				else
				{
					if ($thisLine =~ /^(.*?)\s(.*?)$/)
					{
						$col = $1;;
						$col =~ s/^\s+//g;
						$col =~ s/\s+$//g;
						$datatype = $2;
						$datatype =~ s/\,//g;
						$datatype =~ s/^\s+//g;
						$datatype =~ s/\s+$//g;	
						$colconter++;
						
						if ($col !~ /KEY/i)
						{
							my $newCol = new Col($col);
							
							foreach my $k (keys %SQL_DATATYPES)
							{
							
								if ($datatype =~ /$k/i)
								{
								
									$newCol->setDatatype($SQL_DATATYPES{$k});
									last;
								}
								else
								{
									$newCol->setDatatype('STRING');
								}
							}
							
							if ($datatype =~ /PRIMARY\s+KEY/i)
							{
								$newCol->setFunction('PK');
							}
							if ($col =~ /CR_DATE/)
							{
								$newCol->setFunction('CR_DATE');
							}
							elsif ($datatype =~ /^date$/i)
							{
								$newCol->setFunction('DATE');
							}
							elsif ($datatype =~ /^datetime$/i)
							{
								$newCol->setFunction('DATETIME');
							}
						
							push(@{ $this->{cols} }, $newCol);
						}
					#	elsif (($datatype =~ /PRIMARY/i) && ($datatype =~ /KEY/i))
					#	{
#
					#		my $pk = $col;
					#		$pk =~ s/KEY//i;
					#		$pk =~ s/\(//;
					#		$pk =~ s/\)//;
					#		$pk =~ s/\s//g;
					#		my $colObj = $this->getColByName($pk);
					#		die "$pk";
					#		if (ref $colObj)
					#		{
					#		
					#			$colObj->setFunction('PK');
					#		}
					#	}
					}
				}
			}
		}
		return 1;
	}
	else
	{
		$this->addErrorMessage('Tablename or Sql-File empty'); 
	}
	return 0;
}

sub getCols
{
	my $this	= shift;
	return @{ $this->{cols} };
}

sub getColByName
{
	my $this	= shift;
	my $colname	= shift;
	my $foundCol	= undef;
	foreach my $c (@{ $this->{cols} })
	{
		if ($c->getName() eq $colname)
		{
			$foundCol = $c;
			last;
		}
	}
	return $foundCol;
}

sub process
{
	my $this		= shift;
	if ($this->parseSql())
	{
		my $SQL_COLS 				= '';
		my $SQL_QUERY_COLS 			= '';
		my $QUAL					= '';
		my $SWITCH_SAVE_CR_DATE		= 'off';
		my $SWITCH_PK				= 'off';
		my $COL_CR_DATE				= '';
		my @T_LOOP_COLS				= ();	
		my @T_LOOP_INSERT_COLS		= ();
		my @T_LOOP_UPDATE_COLS		= ();
		my @T_LOOP_DESCR_METHODS 	= ();
		
		my @allCols	= $this->getCols();
		$this->{classtemplate}->setToDict('PK_NAME','selfdefined','PK_NOT_USED');
		$this->{classcachetemplate}->setToDict('PK_NAME','selfdefined','PK_NOT_USED');
		
		for (my $i=0;$i<=$#allCols;$i++)
		{
			my $name	 = $allCols[$i]->getName();
			my $datatype = $allCols[$i]->getDatatype();
			my $function = $allCols[$i]->getFunction();

			my $quote = '';
			   if (($datatype eq 'STRING') || ($datatype eq 'DATE') || ($datatype eq 'DATETIME'))
			   {
    		   		$quote = "'";
    		   }

			
			if ($function eq 'PK')
			{
				$this->{classtemplate}->setToDict('PK_NAME','selfdefined',$name);
				$this->{classcachetemplate}->setToDict('PK_NAME','selfdefined',$name);
				$this->{classlisttemplate}->setToDict('PK_NAME','selfdefined',$name);
				$this->{listtemplate}->setToDict('PK_NAME','selfdefined',$name);
				$this->{cachelisttemplate}->setToDict('PK_NAME','selfdefined',$name);
				$SWITCH_PK = 'on';
				$SQL_QUERY_COLS.=",$name";
				$SQL_COLS.=",$name";
				$QUAL.='!'.$name.'!|';
				push(@T_LOOP_INSERT_COLS,"$name|\"NULL\"||NULL");
			}
			elsif ($function eq 'CR_DATE')
			{
				$SQL_QUERY_COLS.=",year($name),month($name),dayofmonth($name),hour($name),minute($name)";
				$SQL_COLS.=",$name";
				$QUAL.='!'.$name.'_YEAR!|!'.$name.'_MONTH!|!'.$name.'_DAY!|!'.$name.'_HOUR!|!'.$name.'_MINUTE!|';
				$COL_CR_DATE = $name;
				$SWITCH_SAVE_CR_DATE = 'on';
				push(@T_LOOP_COLS,$name);
				push(@T_LOOP_INSERT_COLS,"$name".'|$this->{col}->{'.$name.'}|'."$quote".'|now()');
				push(@T_LOOP_UPDATE_COLS,"$name|$quote");
				push(@T_LOOP_DESCR_METHODS,$name);
			}
			elsif ($function eq 'DATE')
			{
				$SQL_QUERY_COLS.=",year($name),month($name),dayofmonth($name)";
				$SQL_COLS.=",$name";
				$QUAL.='!'.$name.'_YEAR!|!'.$name.'_MONTH!|!'.$name.'_DAY!|';
				push(@T_LOOP_COLS,$name);
				push(@T_LOOP_INSERT_COLS,"$name".'|$this->{col}->{'.$name.'}|'."$quote".'|now()');
				push(@T_LOOP_UPDATE_COLS,"$name|$quote");
				push(@T_LOOP_DESCR_METHODS,$name);
			}
			elsif ($function eq 'DATETIME')
			{
				$SQL_QUERY_COLS.=",year($name),month($name),dayofmonth($name),hour($name),minute($name)";
				$SQL_COLS.=",$name";
				$QUAL.='!'.$name.'_YEAR!|!'.$name.'_MONTH!|!'.$name.'_DAY!|!'.$name.'_HOUR!|!'.$name.'_MINUTE!|';
				push(@T_LOOP_COLS,$name);
				push(@T_LOOP_INSERT_COLS,"$name".'|$this->{col}->{'.$name.'}|'."$quote".'|now()');
				push(@T_LOOP_UPDATE_COLS,"$name|$quote");
				push(@T_LOOP_DESCR_METHODS,$name);
			}			
			else
			{
				$SQL_QUERY_COLS.=",$name";
				$SQL_COLS.=",$name";
				$QUAL.='!'.$name.'!|';
				push(@T_LOOP_COLS,$name);
				push(@T_LOOP_INSERT_COLS,"$name".'|$this->{col}->{'.$name.'}|'."$quote".'|NULL');
				push(@T_LOOP_UPDATE_COLS,"$name|$quote");
				push(@T_LOOP_DESCR_METHODS,$name);
			}
			
		}
		$SQL_QUERY_COLS =~ s/^\,//;
		$SQL_COLS =~ s/^\,//;
		chop($QUAL);
		
		$this->{classtemplate}->setToDict('TableName','selfdefined',$this->{tablename});
		$this->{classtemplate}->setToDict('SQL_QUERY_COLS','selfdefined',$SQL_QUERY_COLS);
		$this->{classtemplate}->setToDict('SQL_COLS','selfdefined',$SQL_COLS);
		$this->{classtemplate}->setToDict('COL_CR_DATE','selfdefined',$COL_CR_DATE);
		$this->{classtemplate}->setSwitch('SWITCH_SAVE_CR_DATE',$SWITCH_SAVE_CR_DATE);
		$this->{classtemplate}->makeRepetition('LOOP_COLS','!ColName!',@T_LOOP_COLS);
		$this->{classtemplate}->makeRepetition('LOOP_INSERT_COLS','!ColName!|!ColValue!|!ColQuote!|!ColDefault!',@T_LOOP_INSERT_COLS);
		$this->{classtemplate}->makeRepetition('LOOP_UPDATE_COLS','!ColName!|!ColQuote!',@T_LOOP_UPDATE_COLS);
		$this->{classtemplate}->makeRepetition('LOOP_DESCR_METHODS','!ColName!',@T_LOOP_DESCR_METHODS);
		$this->{classtemplate}->setSwitch('SWITCH_PK',$SWITCH_PK);

		$this->{classcachetemplate}->setToDict('TableName','selfdefined',$this->{tablename});
		$this->{classcachetemplate}->setToDict('SQL_QUERY_COLS','selfdefined',$SQL_QUERY_COLS);
		$this->{classcachetemplate}->setToDict('SQL_COLS','selfdefined',$SQL_COLS);
		$this->{classcachetemplate}->setToDict('COL_CR_DATE','selfdefined',$COL_CR_DATE);
		$this->{classcachetemplate}->setSwitch('SWITCH_SAVE_CR_DATE',$SWITCH_SAVE_CR_DATE);
		$this->{classcachetemplate}->makeRepetition('LOOP_COLS','!ColName!',@T_LOOP_COLS);
		$this->{classcachetemplate}->makeRepetition('LOOP_DESCR_METHODS','!ColName!',@T_LOOP_DESCR_METHODS);
		$this->{classcachetemplate}->setSwitch('SWITCH_PK',$SWITCH_PK);
		
		$this->{classlisttemplate}->setToDict('TableName','selfdefined',$this->{tablename});
		$this->{classlisttemplate}->setToDict('SQL_QUERY_COLS','selfdefined',$SQL_QUERY_COLS);
		$this->{classlisttemplate}->setToDict('SQL_COLS','selfdefined',$SQL_COLS);
		$this->{classlisttemplate}->setToDict('QUAL','selfdefined',$QUAL);
		
		$this->{listtemplate}->setToDict('TableName','selfdefined',$this->{tablename});
		$this->{listtemplate}->setToDict('SQL_QUERY_COLS','selfdefined',$SQL_QUERY_COLS);
		$this->{listtemplate}->setToDict('SQL_COLS','selfdefined',$SQL_COLS);
		$this->{listtemplate}->setToDict('QUAL','selfdefined',$QUAL);
		$this->{listtemplate}->setSwitch('SWITCH_PK',$SWITCH_PK);
		
		$this->{cachelisttemplate}->setToDict('TableName','selfdefined',$this->{tablename});
		$this->{cachelisttemplate}->setToDict('SQL_QUERY_COLS','selfdefined',$SQL_QUERY_COLS);
		$this->{cachelisttemplate}->setToDict('SQL_COLS','selfdefined',$SQL_COLS);
		$this->{cachelisttemplate}->setToDict('QUAL','selfdefined',$QUAL);
		$this->{cachelisttemplate}->setSwitch('SWITCH_PK',$SWITCH_PK);
		
		my $PACKAGE_GEN_PATH = $this->{genpath};
		my $pwd = 'pwd';
		$pwd=~ s/\//\\\//g;
		$pwd =~ s/\s//g;
		$PACKAGE_GEN_PATH =~ s/$pwd//;
		$PACKAGE_GEN_PATH =~ s/^\///;
		$PACKAGE_GEN_PATH =~ s/\/$//;
		$PACKAGE_GEN_PATH =~ s/\//::/g;
		$this->{classlisttemplate}->setToDict('PACKAGE_GEN_PATH','selfdefined',$PACKAGE_GEN_PATH);
		$this->{classcachetemplate}->setToDict('PACKAGE_GEN_PATH','selfdefined',$PACKAGE_GEN_PATH);
		$this->{cachelisttemplate}->setToDict('PACKAGE_GEN_PATH','selfdefined',$PACKAGE_GEN_PATH);

		return 1;
	}
	else
	{
		return 0;
	}
}

sub getGeneratedClass
{
	my $this		= shift;
	$this->{classtemplate}->modify();
	return $this->{classtemplate}->getDoc();
}
sub getGeneratedCacheClass
{
	my $this		= shift;
	$this->{classcachetemplate}->modify();
	return $this->{classcachetemplate}->getDoc();
}
sub getGeneratedClassList
{
	my $this		= shift;
	$this->{classlisttemplate}->modify();
	return $this->{classlisttemplate}->getDoc();
}
sub getGeneratedList
{
	my $this		= shift;
	$this->{listtemplate}->modify();
	return $this->{listtemplate}->getDoc();
}
sub getGeneratedCacheList
{
	my $this		= shift;
	$this->{cachelisttemplate}->modify();
	return $this->{cachelisttemplate}->getDoc();
}

sub addErrorMessage
{
	my $this		= shift;
	my $mess		= shift;
	$this->{errormessage}.="SqlClassGenerator: $mess\n";
}
sub getErrorMessage
{
	my $this		= shift;
	return $this->{errormessage};
}