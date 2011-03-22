package McmsConfiguration;
# extends:
use de::adframe::lib::xml::XMLConfiguration; @ISA=qw(XMLConfiguration);

# imports:
use de::adframe::components::mcms::McmsXmlField;

# const:
$FIELD_ARRAY_QUAL	= '!FIELD_NAME!|!FIELD_TYPE!|!FIELD_TITLE!|!FIELD_CHARTEST!|!FIELD_ATTRIBUTES!|!FIELD_VALUES!|!FIELD_PAGE!|!FIELD_VALUE!|!PAGE_STATUS!|!PAGE_TITLE!|!FIELD_CLASS!';

1;

sub new
{
	my $class				= shift;
	my $this				= $class->SUPER::new(@_);
	if (ref $this)
	{
		@{ $this->{items} } = ();
		$this->{extensionactive}	= 0;
		$this->parse();
	}
	return $this;
}

sub parse
{
	my $this		= shift;

	my @pages 		= $this->getAllTagsWith('page','configuration:mcms','','');
	$this->{pages} 	= \@pages;
	
	my @fields		= ();
	my @extfields	= ();
	my @new			= ();
	my @newitems	= $this->getAllTagsWith('field','configuration:mcms:new','','');

	for (my $it=0; $it<=$#newitems; $it++)
	{
		my $field = new McmsXmlField($newitems[$it]->getAttribute('name'));
		my $name  = $field->getName();

		$field->setTitle($newitems[$it]->getAttribute('title'));
		$field->setChartest($newitems[$it]->getAttribute('chartest'));
		$field->setClass($newitems[$it]->getAttribute('class'));
		$field->setAttributes($newitems[$it]->getAttribute('attributes'));
		$field->setValues($newitems[$it]->getAttribute('values'));
		$field->setPage($pageId);
		$field->setDefault($newitems[$it]->getAttribute('default'));
		$field->setDisplay($newitems[$it]->getAttribute('display'));
		if ($name =~ /ITEM_/)
		{
			$field->setType('text');
		}
		elsif ($name =~ /IMG_/)
		{
			$field->setType('image');
		}
		elsif ($name =~ /TEXT_/)
		{
			$field->setType('textarea');
		}		
		elsif (($name =~ /SEL/) || ($name eq 'ETIKETT'))
		{
			$field->setType('selector');
		}	
		elsif ($name =~ /^VIDEO_/)
		{
			$field->setType('video');
		}		
		
		push (@new,$field);
	}
	$this->{new} 	= \@new;

	for (my $i=0;$i<=$#pages;$i++)
	{
		my $pageId = $pages[$i]->getAttribute('id');
		
		my @inneritems	= $this->getAllTagsWith('field','configuration:mcms:page','id',$pageId);
	
		for (my $it=0; $it<=$#inneritems; $it++)
		{
			my $field = new McmsXmlField($inneritems[$it]->getAttribute('name'));
			my $name  = $field->getName();
			
			$field->setTitle($inneritems[$it]->getAttribute('title'));
			$field->setChartest($inneritems[$it]->getAttribute('chartest'));
			$field->setClass($inneritems[$it]->getAttribute('class'));
			$field->setAttributes($inneritems[$it]->getAttribute('attributes'));
			$field->setValues($inneritems[$it]->getAttribute('values'));
			$field->setPage($pageId);
			$field->setDefault($inneritems[$it]->getAttribute('default'));
			$field->setDisplay($inneritems[$it]->getAttribute('display'));
			if ($name =~ /ITEM_/)
			{
				$field->setType('text');
			}
			elsif ($name =~ /IMG_/)
			{
				$field->setType('image');
			}
			elsif ($name =~ /TEXT_/)
			{
				$field->setType('textarea');
			}
			elsif ($name =~ /^VIDEO_/)
			{
				$field->setType('video');
			}			
			elsif (($name =~ /SEL/) || ($name eq 'ETIKETT'))
			{
				$field->setType('selector');
			}			
			if ($it == 0)
			{
				$field->setPageStatus('first');
				$field->setPageTitle($pages[$i]->getAttribute('title'));
			}
			elsif ($it == $#inneritems)
			{
				$field->setPageStatus('last');
			}			
			else
			{
				$field->setPageStatus('');
			}
			push (@fields,$field);
		}
	}
	
	$this->{fields} 	= \@fields;
	
	my @extensionitems	= $this->getAllTagsWith('field','configuration:mcms:extension','','');
	for (my $it=0; $it<=$#extensionitems; $it++)
	{
		my $field = new McmsXmlField($extensionitems[$it]->getAttribute('name'));
		my $name  = $field->getName();
		$field->setTitle($extensionitems[$it]->getAttribute('title'));
		$field->setChartest($extensionitems[$it]->getAttribute('chartest'));
		$field->setAttributes($extensionitems[$it]->getAttribute('attributes'));
		$field->setValues($extensionitems[$it]->getAttribute('values'));
		$field->setDefault($extensionitems[$it]->getAttribute('default'));
		if ($name =~ /ITEM_/)
		{
			$field->setType('text');
		}
		elsif ($name =~ /IMG_/)
		{
			$field->setType('image');
		}
		elsif ($name =~ /TEXT_/)
		{
			$field->setType('textarea');
		}					
		push (@extfields,$field);
		$this->{extensionactive} = 1;
		
	}	
	$this->{extfields} 	= \@extfields;
}

sub toString
{
	my $this			= shift;
	my $feed			= shift;
	my $separator		= shift;
	$separator 			= "\n" if ($separator eq '');
	my $string			= '';
	
	my @fields		= (@{ $this->{fields} } , @{ $this->{extfields} });

	$string.= $feed.'============'.$separator;
	for (my $i=0;$i<=$#fields;$i++)
	{
		$string.= $fields[$i]->toString($feed,$separator);
	}
	$string.= $separator;
	
	$string.= $separator;
	
	return $string;
}


sub getPages
{
	my $this	= shift;
	return @{ $this->{pages} };
}

sub getPageById
{
	my $this		= shift;
	my $pId			= shift;
	my $found		= undef;
	foreach my $b (@{ $this->{pages} })
	{
		if ($pId eq $b->getAttribute('id'))
		{
			$found = $b;
			last;
		}
	}
	return $found;
}

sub getFields
{
	my $this	= shift;
	return @{ $this->{fields} };
}
sub getFieldNames
{
	my $this	= shift;
	my @fields	= @{ $this->{fields} };
	my @names	= ();
	for (my $i=0;$i<=$#fields;$i++)
	{
		push(@names,$fields[$i]->getName());
	}
	return @names;
}
sub getFieldByName
{
	my $this		= shift;
	my $fieldName	= shift;
	my $found		= undef;
	foreach my $b (@{ $this->{fields} })
	{
		if ($fieldName eq $b->getName())
		{
			$found = $b;
			last;
		}
	}
	return $found;
}
sub getFieldsByNames
{
	my $this		= shift;
	my @keys		= @_;
	my $tmp			= undef;
	my @ret			= ();
	foreach my $k (@keys)
	{	
		$tmp = $this->getFieldByName($k);	
		if (ref $tmp)
		{
			push(@ret,$tmp);
		}

	}
	return @ret;
}
sub getActiveTextfields
{
	my $this		= shift;
	my @fields		= @{ $this->{fields} };
	my @ret			= ();
	for (my $i=0; $i<=$#fields; $i++)
	{
		if (($fields[$i]->getType() eq 'text') || ($fields[$i]->getType() eq 'textarea') || ($fields[$i]->getType() eq 'selector'))
		{
			push(@ret,$fields[$i])
		}
	}
	return @ret;
}

sub getFieldsSerialized
{
	my $this				= shift;
	my $dataRef			= shift;
	my @ret				= ();
	my @fields			= @{ $this->{fields} };
	my $fieldName		= '';
	my $fieldType			= '';
	my $fieldTitle			= '';
	my $fieldChartest		= '';
	my $fieldClass			= '';
	my $fieldAttributes		= '';
	my $fieldValues		= '';
	my $fieldPage			= '';
	my $fieldData			= '';
	my $pageStatus		= '';
	my $pageTitle			= '';
	my $display			= '';
	my %dbDataHash		= %{ $dataRef };

	for(my $i=0;$i<=$#fields;$i++)
	{
		$fieldName			= $fields[$i]->getName();
		$fieldType			= $fields[$i]->getType();
		$fieldTitle			= $fields[$i]->getTitle();
		$fieldChartest		= $fields[$i]->getChartest();
		$fieldClass		= $fields[$i]->getClass();
		$fieldAttributes	= $fields[$i]->getAttributes();
		$fieldValues		= $fields[$i]->getValues();
		$fieldPage		= $fields[$i]->getPage();
		$fieldData 		= $fields[$i]->getDefault();
		$pageStatus		= $fields[$i]->getPageStatus();
		$pageTitle		= $fields[$i]->getPageTitle();
		$display			= $fields[$i]->getDisplay();
		if (defined $dbDataHash{$fieldName})
		{
			$fieldData = $dbDataHash{$fieldName};
		}
		if ($display eq 'hidden')
		{
			$fieldType = 'hidden';
		}
		elsif ($display eq 'display')
		{
			$fieldType = 'display';
		}	
		push(@ret,"$fieldName|$fieldType|$fieldTitle|$fieldChartest|$fieldAttributes|$fieldValues|$fieldPage|$fieldData|$pageStatus|$pageTitle|$fieldClass");
	}

	return \@ret;
}

sub getNew
{
	my $this	= shift;
	return @{ $this->{new} };
}
sub getNewSerialized
{
	my $this				= shift;
	my $dataRef				= shift;
	my @ret					= ();
	my @fields				= @{ $this->{new} };
	my $fieldName			= '';
	my $fieldType			= '';
	my $fieldTitle			= '';
	my $fieldChartest		= '';
	my $fieldClass			= '';
	my $fieldAttributes		= '';
	my $fieldValues		= '';
	my $fieldPage			= '';
	my $fieldData			= '';
	my $pageStatus		= '';
	my $pageTitle			= '';
	my $display			= '';
	my %dbDataHash		= %{ $dataRef };

	for(my $i=0;$i<=$#fields;$i++)
	{
		$fieldName			= $fields[$i]->getName();
		$fieldType			= $fields[$i]->getType();
		$fieldTitle			= $fields[$i]->getTitle();
		$fieldChartest		= $fields[$i]->getChartest();
		$fieldAttributes	= $fields[$i]->getAttributes();
		$fieldValues		= $fields[$i]->getValues();
		$fieldClass		= $fields[$i]->getClass();
		$fieldPage			= $fields[$i]->getPage();
		$fieldData 			= $fields[$i]->getDefault();
		$pageStatus			= $fields[$i]->getPageStatus();
		$pageTitle			= $fields[$i]->getPageTitle();
		$display			= $fields[$i]->getDisplay();
		if (defined $dbDataHash{$fieldName})
		{
			$fieldData = $dbDataHash{$fieldName};
		}
		if ($display eq 'hidden')
		{
			$fieldType = 'hidden';
		}
		elsif ($display eq 'display')
		{
			$fieldType = 'display';
		}		
		push(@ret,"$fieldName|$fieldType|$fieldTitle|$fieldChartest|$fieldAttributes|$fieldValues|$fieldPage|$fieldData|$pageStatus|$pageTitle|$fieldClass");
	}

	return \@ret;
}

# extension:
sub extensionActive
{
	my $this	= shift;
	return $this->{extensionactive};
}
sub getExtensionfields
{
	my $this	= shift;
	return @{ $this->{extfields} };
}
sub getExtensionfieldNames
{
	my $this	= shift;
	my @fields	= @{ $this->{extfields} };
	my @names	= ();
	for (my $i=0;$i<=$#fields;$i++)
	{
		push(@names,$fields[$i]->getName());
	}
	return @names;
}
sub getExtensionfieldByName
{
	my $this		= shift;
	my $fieldName	= shift;
	my $found		= undef;
	foreach my $b (@{ $this->{extfields} })
	{
		if ($fieldName eq $b->getName())
		{
			$found = $b;
			last;
		}
	}
	return $found;
}
sub getExtensionfieldsByNames
{
	my $this		= shift;
	my @keys		= @_;
	my $tmp			= undef;
	my @ret			= ();
	foreach my $k (@keys)
	{	
		$tmp = $this->getExtensionfieldByName($k);	
		if (ref $tmp)
		{
			push(@ret,$tmp);
		}

	}
	return @ret;
}
sub getActiveTextExtensionfields
{
	my $this		= shift;
	my @fields		= @{ $this->{extfields} };
	my @ret			= ();
	for (my $i=0; $i<=$#fields; $i++)
	{
		if (($fields[$i]->getType() eq 'text') || ($fields[$i]->getType() eq 'textarea'))
		{
			push(@ret,$fields[$i])
		}
	}
	return @ret;
}