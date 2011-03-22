package DocumentGenerator;
$VERSION=20101021;
#use open IO => ":encoding(utf8)",":std";
use Encode;
# NEEDS .HTACCESS
1;
sub new
{
	my $type	= shift;
	my $self	= {};
	bless $self,$type;
	$self->{dict}	= undef;
	return $self;
}

sub generate
{
	my $self			= shift;
	$self->{doc}		= shift;
	$self->{doctype}	= shift;
	my @directory		= split(/\//, $self->{doc}.'.'.$self->{doctype});
	pop(@directory);
	$self->{filedir}	= join('/',@directory);
	$self->{docline}	= '';
	$self->{moduleline}	= '';

	if ($self->_createGenDoc())	{
		$self->{docline} = '';
		return $self->_createGenModule();
	}

	return 0;
}

sub generateDynamic
{
	my $self				= shift;
	my $doc					= shift;

	$self->{dynSnpName}		= shift;

	if ($doc =~ /(^.*?)\.([^\/]*?$)/)
	{
		$self->{doc}		= $1;
		$self->{doctype}	= $2;

		$self->{doctype} = '.snp' if ($self->{doctype} eq '');
		my @directory		= split(/\//, $self->{doc}.'.'.$self->{doctype});
		pop(@directory);
		$self->{filedir}	= join('/',@directory);
		$self->{docline}	= '';
		if ($self->_loadDoc())
		{
			# 1. Stufe Snippets:
			$self->_parseSnippets();
			$self->_extractDictData();
			$self->_modifyDoc();
			$self->{doctype} = $self->{doctype}.'d';
			if ($self->_saveGenDoc())
			{
				return $self->_createGenDynamicModule();
			}
		}
	}
	return 0;
}

sub _parseSnippets
{
	my $self                = shift;
	my $dummy_line          = $self->{docline};



	my $go                  = 1;
	my $thisname            = '';
	my $snippetParameter 	= '';
	my %snippets			= ();
	while ($go)
	{
		if ($dummy_line =~ /<snippet\s*.*?src=\s*\"\/?(.*?)\.snp(.*?)\"\.*?>/i)
		{
			$thisname       = $1;
			$snippetParameter = $2;
			$self->_getSnippet("$thisname",$snippetParameter);
			$dummy_line=~s/<snippet\s*.*?src=\s*\"\/?$thisname\.snp.*?\"\.*?>//ig;
		}
		else
		{
			$go = 0;
		}
	}
	$self->{docline} =~ s/<snippet\s*.*?src\s*=\s*\"\/?(.*?)\.snp.*?\"\.*?>/$self->{snippet}->{$1}/ig;
}
sub _parseDynamicSnippets
{
	my $self                = shift;
	my $dummy_line          = $self->{docline};
	my $go                  = 1;
	my $thisname            = '';
	my $snippetSrcDir 		= '';



	# dynamicsnippet registrieren
	my $lala = 0;
	while ($go)
	{

		if ($dummy_line =~ /<dynamicsnippet\s+name=\s*\"(.*?)\".*?>/i)
		{

			$thisname       = $1;
			$snippetSrcDir 	= '';

			if ($dummy_line =~ /<dynamicsnippet\s+name=\s*\"$thisname\".*?src=\"(.*?)\".*?>/)
			{
				$snippetSrcDir = $1;
				$snippetSrcDir=~s/<\!--\s+#(.*?)#\s+-->/\$main\:\:in\{$1\}/g;
			}
			if ($snippetSrcDir	!~ /^\//)
			{
				$snippetSrcDir = '/'.$snippetSrcDir;
			};
			$self->{dict}->{$thisname}->{htmltype} = 'dynamicsnippet';
			$self->{dict}->{$thisname}->{replace} = $snippetSrcDir;
			$self->{dynamicsnippet}->{"$thisname"}= $self->{dict}->{$thisname}->{replace};
			$dummy_line=~s/<dynamicsnippet\s+name=\s*\"$thisname\".*?>//ig;
			$lala++;
		}
		else
		{
			$go = 0;
		}

	}
	#main::debug($self->{dict}->{$thisname}->{replace});
}
sub _getSnippet
{
	my $self        = shift;
	my $filename    = shift;
	my $snippetParm	= shift;
	my %snippParameter	= ();
	if ($snippetParm =~ /^\?/)
	{
		$snippetParm =~ s/\?//;
		my @allparam	= ();
		@allparam = split(/\&/,$snippetParm);
		foreach my $p (@allparam)
		{
			my @help = split(/=/,$p);
			$snippParameter{$help[0]}=$help[1];
		}
	}

	if (-e "$ENV{ADFRAME_DOC_PATH}/$filename\.snp")
	{
		if (open(SNP, "$ENV{ADFRAME_DOC_PATH}/$filename\.snp"))
		{
			while (<SNP>)
			{
				$self->{snippet}->{"$filename"}.= decode('UTF-8',$_);
			}
			close(FILE);
			$self->{snippet}->{"$filename"} =~ s/<html\s*>//ig;
			$self->{snippet}->{"$filename"} =~ s/<\/html\s*>//ig;
			$self->{snippet}->{"$filename"} =~ s/<\s*body\s*.*?>//ig;
			$self->{snippet}->{"$filename"} =~ s/<\s*\/body\s*.*?>//ig;
			$self->{snippet}->{"$filename"} =~ s/<\s*head\s*>[^\/head\s*>]*?//ig;
			$self->{snippet}->{"$filename"} =~ s/<\/head\s*>//ig;
			$self->{snippet}->{"$filename"} =~ s/<\s*title\s*.*?>.*?<\s*\/title\s*.*?>//ig;
			$self->{snippet}->{"$filename"} =~ s/<\s*meta\s*.*?>//ig;
			foreach my $pp (keys %snippParameter)
			{
				my $dictParamName = 'snippet_'.$filename.'_'.$pp;
				$self->{dict}->{"$dictParamName"}->{htmltype} = 'snippetparameter';
				$self->{dict}->{"$dictParamName"}->{replace} = $snippParameter{"$pp"};
			}
			$ok = 1;
		}
	}
	else
	{
		$self->{snippet}->{"$filename"} = '';
	}
	return $ok;
}
sub _getDynamicSnippet
{
	my $self        = shift;
	my $filename    = shift;
	my $src	        = shift;
	if (-e "$ENV{ADFRAME_DOC_PATH}/$src$filename\.snp")
	{
		if (open(DSNP, "$ENV{ADFRAME_DOC_PATH}/$filename\.snp"))
		{
			while (<DSNP>)
			{
				$self->{dynamicsnippet}->{"$filename"}.= decode('UTF-8',$_);
			}
			close(FILE);
			$ok = 1;
		}
	}
	else
	{
		$self->{snippet}->{"$filename"} = '';
	}
	return $ok;
}
sub _modifyDoc
{
   	my $self 	= shift;
   	my $idvar	= '';
   	my $replace	= '';
   	if ($ENV{ADFRAME_USE_SESSIONS} && $ENV{ADFRAME_USE_COOKIE_SESSIONS} < 1) {
			$idvar = "?id=<!-- #id# -->";
   	}
   	foreach $K (keys %{ $self->{dict} })
   	{
        if ($self->{dict}->{$K}->{htmltype} eq 'text')
        {
			$self->{docline} =~ s/(\<\s*input\s*type\s*=\s*[\"]?text.*?name\s*=\s*\"$K\".*?)value\s*=\s*\".*?\"(.*?\>)/$1$2/ig;
			$self->{docline} =~ s/(<\s*input\s*type\s*=\s*[\"]?text.*?name\s*=\s*\"$K\".*?)>/$1 value=\"<\!-- #_$K# --\>\">/ig;
			next;
		}
		elsif ($self->{dict}->{$K}->{htmltype} eq 'textarea') #
		{
			$self->{docline} =~ s/(<\s*textarea\s+name\s*=\s*\"$K\".*?>).*?(<\/textarea>)/$1<\!-- #_$K# --\>$2/ig;
	        next;
	    }
	    elsif ($self->{dict}->{$K}->{htmltype} eq 'checkbox')
	    {
	    	$self->{docline} =~ s/(<\s*input\s*type\s*=\s*[\"]?checkbox.*?name\s*=\s*\"$K\".*?)checked.*?>/$1>/ig;
	    	$self->{docline} =~ s/(<\s*input\s*type\s*=\s*[\"]?checkbox.*?name\s*=\s*\"$K\".*?)>/$1 <\!-- #_$K# --\>\>/ig;
	    	next;
		}

    }

	# neu:
	$self->{docline} =~ s/(\<\s*form.*?[^-]\>)/$1\n<input type=\"hidden\" name=\"id\" id=\"id\" value=\"<!-- #id# -->\"\>/ig;
	$self->{docline} =~ s/(\<\s*form.*?name=\")(.*?)(\".*?[^-]\>)/$1$2$3\n<input type=\"hidden\" name=\"adframe_event\" value=\"$2\"\>/ig;
	$self->{docline} =~ s/<\s*!--\s*#mod_doc#\s*--\s*>/$1<input type=\"hidden\" name=\"doc\" value=\"<!-- #doc# -->\"\>\n/ig;
	#$self->{docline} =~ s/(<img.*?src\s*=\s*\")([^\/])(.*?)(\".*?>)/$1$self->{filedir}\/$2$3$4/g;
	#$self->{docline} =~ s/(<script.*?src\s*=\s*\")([^\/])(.*?)(\".*?>)/$1$self->{filedir}\/$2$3$4/g;

	# HREF: /cgi-bin/adframe raus:
	$self->{docline} =~ s/(<a\s+href\s*=\s*\")(\/cgi-bin\/adframe)(.*?>)/$1$3/ig;


	# HREF: modify:
	if($ENV{ADFRAME_USE_SHORT_URL} ne 1) {
		$self->{docline} =~ s/<a\s+href\s*=\s*\"(.*?)"(.*?>.*?)<\/a>/<a href=\"\/cgi-bin\/adframe$1$idvar\"$2<\/a>/ig;
	}
	else {
		$self->{docline} =~ s/<a\s+href\s*=\s*\"(.*?)"(.*?>.*?)<\/a>/<a href=\"$1$idvar\"$2<\/a>/ig;
	}
	# HREF: correct dir:
	$self->{docline} =~ s/(<a\s+href\s*=\s*\"\/cgi-bin\/adframe)([^\/])(.*?)(\".*?>)/$1\/$self->{filedir}\/$2$3$4/ig;
	$self->{docline} =~ s/(<a\s+href\s*=\s*\"[^\"]*?\?[^\"]*?)\?(.*?>)/$1\&$2/ig;

	# FRAME NOADD sichern:
	$self->{docline} =~ s/<frame\snoadd/<framenoadd/ig;

	# FRAME: modify
	$self->{docline} =~ s/(<frame\s.*?src=\s*)\"(.*?)\"(.*?>)/$1\"\/cgi-bin\/adframe\/$2$idvar" $3/ig;
	# FRAME: correct ?:
	$self->{docline} =~ s/(<frame\s.*?src=\s*\"[^\"]*?\?[^\"]*?)\?(.*?>)/$1\&$2/ig;

	# FRAME NOADD rückgäng:
	$self->{docline} =~ s/<framenoadd/<frame/ig;

	# AREA: modify
	if($ENV{ADFRAME_USE_SHORT_URL} ne 1) {
		$self->{docline} =~ s/(<area\s+href\s*=\s*\")(.*?)(".*?>.*?)/$1\/cgi-bin\/adframe\/$2$idvar$3/ig;
	}
	else {
		$self->{docline} =~ s/(<area\s+href\s*=\s*\")(.*?)(".*?>.*?)/$1$2$idvar$3/ig;
	}
	# AREA: correct ?
	$self->{docline} =~ s/(<area\s+href=\s*\"[^\"]*?\?[^\"]*?)\?(.*?>)/$1\&$2/ig;

	#$self->{docline} =~ s/(<a\s+href\s*=\s*\"\/cgi-bin\/adframe)(.*?)(#)(.*?)(\&)(.*?)(\".*?>)/$1$2$5$6$3$4$7/ig;

	foreach my $dsni (keys %{ $self->{dynamicsnippet} })
	{
		my $repld = $self->{dict}->{$dsni}->{replace};
		$repld=~ s/\//\\\//g;
		$self->{docline} =~ s/(\<\s*form.*?name=\")(.*?)(\".*?[^-]\>)/$1$2$3\n<input type=\"hidden\" name=\"$dsni\" value=\"\<\!-- \#$repld\# --\>\"\>/ig;
	}

#DYNSNIP Wert in forms

	if ($self->{dynSnpName} ne '')
	{
		$self->{docline} =~ s/(\<\s*form.*?name=\")(.*?)(\".*?[^-]\>)/$1$2$3\n<input type=\"hidden\" name=\"$self->{dynSnpName}\" value=\"\<\!-- \#$self->{dynSnpName}\# --\>\"\>/ig;
	}
}

sub _extractDictData
{
	my $self 			= shift;
	my $thisname        = '';
	my %itms			= ();

	# repetition-module
	my $go              = 1;
	my $dummy_line      = $self->{docline};

	while ($go)
	{
		if ($dummy_line =~ /\<\s*repetition\s+name\s*=\s*\"(.*?)\"\s+type\s*=\s*\"(.*?)\"(.*?)>/i)
		{
			$thisname       = $1;
			$thistype       = $2;
			$thisparam		= $3;
			$self->{dict}->{$thisname}->{htmltype} = 'repetitioncomponent' if ($thisname ne '');
			$self->{dict}->{$thisname}->{moduletype} = $thistype if ($thistype ne '');
			$self->{dict}->{$thisname}->{params} = $thisparam if ($thisparam ne '');
			$dummy_line=~ s/\<\s*repetition\s+name\s*=\s*\"(.*?)\"\s+type\s*=\s*\"(.*?)\"(.*?)>//i;
		}
		else
		{
			$go = 0;
		}
	}

	# textfields
	my $go              = 1;
	my $dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /\<\s*input\s*type\s*=\s*[\"]?text.*?name\s*=\s*\"(.*?)\".*?>/i)
		{
			$thisname       = $1;
			$self->{dict}->{$thisname}->{htmltype} = 'text' if ($thisname ne '');
			$dummy_line=~s/\<\s*input\s*type\s*=\s*[\"]?text.*?name\s*=\s*\"(.*?)\".*?>//i;
		}
		else
		{
			$go = 0;
		}
	}
	# textarea
	$go              = 1;
	$dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /<\s*textarea\s+name\s*=\s*[\"]([^\"]*?)\".*?>.*?<\/textarea>/i)
		{
			$thisname       = $1;
			$self->{dict}->{$thisname}->{htmltype} = 'textarea' if ($thisname ne '');
			$dummy_line=~s/<\s*?textarea\s+name\s*=\s*[\"]([^\"]*?)\".*?>.*?<\/textarea>//i;
		}
		else
		{
			$go = 0;
		}
	}
	# selfdefined
	$go              = 1;
	$dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /<\!--\s#([^#]*?)#\s-->/i)
		{
			$thisname       = $1;
			$self->{dict}->{$thisname}->{htmltype} = 'selfdefined' if (($thisname ne 'id') && ($thisname ne 'doc') && ($thisname ne ''));
			$dummy_line=~ s/<\!--\s#[^#]*?#\s-->//i;
		}
		else
		{
			$go = 0;
		}
	}
	# checkbox
	$go              = 1;
	$dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /<\s*input\s*type\s*=\s*[\"]?checkbox.*?name\s*=\s*\"(.*?)\".*?>/i)
		{
			$thisname       = $1;
			$self->{dict}->{$thisname}->{htmltype} = 'checkbox' if (($thisname ne 'id') && ($thisname ne 'doc') && ($thisname ne ''));
			$dummy_line=~ s/<\s*input\s*type\s*=\s*[\"]?checkbox.*?name\s*=\s*\"(.*?)\".*?>//i;
		}
		else
		{
			$go = 0;
		}
	}
	# radio
	$go              = 1;
	$dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /\<\s*input\s*type\s*=\s*[\"]?radio.*?name\s*=\s*\"(.*?)\".*?\>/i)
		{
			$thisname       = $1;
			$self->{dict}->{$thisname}->{htmltype} = 'radio' if (($thisname ne 'id') && ($thisname ne 'doc') && ($thisname ne ''));
			$dummy_line=~ s/\<\s*input\s*type\s*=\s*[\"]?radio.*?name\s*=\s*\".*?\".*?\>//i;
		}
		else
		{
			$go = 0;
		}
	}
	# selectmultiple
	$go              = 1;
	$dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /<select.*?name\s*=\s*\"(.*?)\".*?multible.*?>/i)
		{
			$thisname       = $1;
			$self->{dict}->{$thisname}->{htmltype} = 'selectmultiple' if (($thisname ne 'id') && ($thisname ne 'doc') && ($thisname ne ''));
			$dummy_line=~ s/<select.*?name\s*=\s*\".*?\".*?multible.*?>//i;
		}
		else
		{
			$go = 0;
		}
	}
	# select
	$go              = 1;
	$dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /<select.*?name\s*=\s*\"(.*?)\"(.*?)>/i)
		{
			$thisname       = $1;
			my $helpline 	= $2;
			if ($helpline =~ /multiple/i)
			{
				$self->{dict}->{$thisname}->{htmltype} = 'selectmultiple' if (($thisname ne 'id')&& ($thisname ne 'doc') && ($thisname ne ''));
			}
			else
			{
				$self->{dict}->{$thisname}->{htmltype} = 'select' if (($thisname ne 'id')&& ($thisname ne 'doc') && ($thisname ne ''));
			}

			$dummy_line=~ s/<select.*?name\s*=\s*\".*?\".*?>//i;
		}
		else
		{
			$go = 0;
		}
	}

	# switch
	$go              = 1;
	$dummy_line      = $self->{docline};
	$dummy_line =~ s/<\s*repetition\s+name.*?>.*?(\n.*?)*?<\/repetition.*?>//g;
	while ($go)
	{
		if ($dummy_line =~ /<\s*switch\s*name\s*=\s*\"(.*?)\".*?>/i)
		{
			$thisname       = $1;
			$self->{dict}->{$thisname}->{htmltype} = 'switch' if (($thisname ne 'id') && ($thisname ne 'doc') && ($thisname ne ''));
			$dummy_line=~ s/<\s*switch\s+name=\s*\"(.*?)\".*?>//i;
		}
		else
		{
			$go = 0;
		}
	}
}
sub _createGenDoc
{
	my $self	= shift;
	if ($self->_loadDoc())
	{

		# 1. Stufe Snippets:
		$self->_parseSnippets();
		# 2. Stufe Snippets:
		$self->_parseSnippets();

		$self->_parseDynamicSnippets();

		$self->_extractDictData();
		$self->_modifyDoc();

		return $self->_saveGenDoc();
	}
	else
	{
		return 0;
	}
}
sub _createGenModule
{
	my $self	= shift;
	my $ok		= 1;
	my $package	= $self->{doc};
	   $package =~ s/.*?\/([^\/]*?)$/$1/;
	my $snippets = join("','", keys %{ $self->{snippet} });
	my $dynamicsnippets = join("','", keys %{ $self->{dynamicsnippet} });
	my $dictline	= '';
	my $automoduleline	= '';
	my %automoduleSeen	= ();
	$self->{moduleline} .= "1;\n";
	$self->{moduleline} .= "sub __AgSn\n";
	$self->{moduleline} .= "{\n";
	$self->{moduleline} .= '    return(\''.$snippets."');\n";
	$self->{moduleline} .= "}\n";
	$self->{moduleline} .= "sub __AgDynSn\n";
	$self->{moduleline} .= "{\n";
	$self->{moduleline} .= '    return(\''.$dynamicsnippets."');\n";
	$self->{moduleline} .= "}\n";
	$self->{moduleline} .= "sub __Ac\n";
	$self->{moduleline} .= "{\n";
	for $k (keys %{ $self->{dict} })
	{
		if ($self->{dict}->{$k}->{htmltype} eq 'snippetparameter')
		{
			$dictline.= '\''.$k.'\',\''.$self->{dict}->{$k}->{htmltype}.'\',\'none\',\'\',\''.$self->{dict}->{$k}->{replace}.'\',';
		}
		elsif ($self->{dict}->{$k}->{htmltype} eq 'dynamicsnippet')
		{
			$dictline.= '\''.$k.'\',\''.$self->{dict}->{$k}->{htmltype}.'\',\'none\',\'DynamicSnippet:'.$k.'\',"'.$self->{dict}->{$k}->{replace}.'$main::in{'.$k.'}",';
		}
		else
		{
			$dictline.= '\''.$k.'\',\''.$self->{dict}->{$k}->{htmltype}.'\',\'alphanum\',\''.$k.'\',$main::in{"'.$k.'"},';
		}
	}
	if ($dictline ne '')
	{
		chop $dictline;
		$self->{moduleline} .= '$main::adframe->setToDict('.$dictline.');';
	}
	if ($automoduleline ne '')
	{
		$self->{moduleline} .= $automoduleline;
	}

	$self->{moduleline} .= "\n";
	$self->{moduleline} .= "}\n";
	return $self->_saveGenModule();
}

sub _createGenDynamicModule
{
	my $self	= shift;
	my $ok		= 1;
	my $package	= $self->{doc};
	   $package =~ s/.*?\/([^\/]*?)$/$1/;
	my $snippets = join("','", keys %{ $self->{snippet} });
	my $dynamicsnippets = join("','", keys %{ $self->{dynamicsnippet} });
	my $dictline	= '';
	my $automoduleline	= '';
	my %automoduleSeen	= ();
	$self->{moduleline} .= "1;\n";
	$self->{moduleline} .= "sub __AgSnD\n";
	$self->{moduleline} .= "{\n";
	$self->{moduleline} .= '    return(\''.$snippets."');\n";
	$self->{moduleline} .= "}\n";
	$self->{moduleline} .= "sub __AcD\n";
	$self->{moduleline} .= "{\n";
	for $k (keys %{ $self->{dict} })
	{
		if ($self->{dict}->{$k}->{htmltype} eq 'snippetparameter')
		{
			$dictline.= '\''.$k.'\',\''.$self->{dict}->{$k}->{htmltype}.'\',\'none\',\'\',\''.$self->{dict}->{$k}->{replace}.'\',';
		}
		else
		{
			$dictline.= '\''.$k.'\',\''.$self->{dict}->{$k}->{htmltype}.'\',\'alphanum\',\''.$k.'\',$main::in{"'.$k.'"},';
		}
	}
	if ($dictline ne '')
	{
		chop $dictline;
		$self->{moduleline} .= '$main::adframe->setToDict('.$dictline.');';
	}
	if ($automoduleline ne '')
	{
		$self->{moduleline} .= $automoduleline;
	}

	$self->{moduleline} .= "\n";
	$self->{moduleline} .= "}\n";
	return $self->_saveDynamicGenModule();
}

#
# File operations
#
sub _loadFile
{
	my $self	= shift;
	my $refkey	= shift;
	my $extens	= shift;
	my $ok		= 0;
	if (-e "$ENV{ADFRAME_DOC_PATH}/$self->{doc}".'.'.$extens) {
		if (open(FILE,"$ENV{ADFRAME_DOC_PATH}/$self->{doc}".'.'.$extens)) {
		   	while (<FILE>) {
		       	$self->{"$refkey"}.= decode('UTF-8',$_);
		    }
        close(FILE);
        $ok = 1;
			}
		}
		return $ok;
}
sub _saveFile
{
	my $self	= shift;
	my $refkey	= shift;
	my $extens	= shift;
	my $ok		= 0;
	my @directory	= split(/\//,$self->{filedir});
	my $cumdir	= '';
	for ($i=0;$i<=$#directory;$i++)
	{
		$cumdir.="/$directory[$i]";
		if (! (-e "./ADFRAMEGEN/$cumdir"))
		{
			mkdir("./ADFRAMEGEN/$cumdir",0777);
			chmod(0777,"./ADFRAMEGEN/$cumdir");
		}
	}
	if (($self->{"$refkey"} ne '') && ($extens ne ''))
	{
			if (open(HA,">./ADFRAMEGEN/".$self->{doc}.'.'.$extens))	{
				my $output = encode('UTF-8',$self->{"$refkey"});
				print HA $output;
				close(HA);
				chmod(0777,'./ADFRAMEGEN/'.$self->{doc}.'.'.$extens);
				$ok = 1;
			}
	}
	return $ok;
}
sub _loadDoc
{
	my $self	= shift;
	return $self->_loadFile('docline',$self->{doctype});
}
sub _saveGenDoc
{
	my $self	= shift;
	return $self->_saveFile('docline',$self->{doctype});
}
sub _saveGenModule
{
	my $self	= shift;
	return $self->_saveFile('moduleline','pm');
}
sub _saveDynamicGenModule
{
	my $self	= shift;
	return $self->_saveFile('moduleline','pmd');
}
