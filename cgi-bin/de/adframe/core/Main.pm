package Main;
use de::adframe::core::Session;
#use open IO => ":encoding(utf8)",":std";
use Encode;
use utf8;
$VERSION=20101119;

# 20101022 setContenttype hinzugefügt
# internLocation geändert (cookies)
# setCookie geändert
# utf8

1;
sub new
{
	my $type	= shift;
	my $req		= shift;
	my $self	= {};
	bless $self,$type;
	$self->{in}			 			= $req->getRequestParam();
	$self->{contenttype} 	=  $ENV{ADFRAME_CONTENT_TYPE} || 'text/html';
	return $self;
}

sub setContenttype {
	my $self 				= shift;
	$self->{contenttype} 	= shift;
}

sub initnew {
	my $self			= shift;
	$self->{doc}		= '';
	$self->{doctype}	= '';
	$self->{docline}	= '';
	$self->{dict}		= {};
	$self->{zone}		= '';
}
sub loadDoc
{
	my $self					= shift;
	$self->{doc}			= shift;
	$self->{doctype} 	= shift;

	if (open(FILE,"./ADFRAMEGEN/$self->{doc}".'.'.$self->{doctype})) {
		$self->{docline} = '';
		while (<FILE>) {
			$self->{docline}.= decode('UTF-8',$_);
		}
		close(FILE);
#main::logger($self->{docline});exit(0);
		return 1;
	}
	return 0;
}
sub sendHeader
{
	my $self	= shift;
	print "Content-type: $self->{contenttype}\n\n";
}

sub importDynamicSnippet
{
	my $self	= shift;
	my $key		= shift;
	my $value	= shift;
	$self->{dict}->{$key}->{replace} = $value if ($value ne '');
	if ($self->{dict}->{$key}->{htmltype} eq 'dynamicsnippet')
	{
		require de::adframe::core::TemplateParser;
		my $parser	= TemplateParser::new('TemplateParser');
		$parser->loadTemplate("$ENV{ADFRAME_DOC_PATH}/$self->{dict}->{$key}->{replace}");
		$parser->modifyStandards();
		my $snip = $parser->getTemplateAsString();
		$self->{docline} =~ s/<dynamicsnippet\s+name=\s*\"$key\".*?>/$snip/ig;
	}
}

sub _importDynamicGenSnippet
{
	my $self		= shift;
	my $dynsnpname	= shift;
	my $dline		= '';
	$self->{dict}->{$dynsnpname}->{replace}.='.snp' if ($self->{dict}->{$dynsnpname}->{replace} !~ /\.[^\/]*?$/);

	if ((-f "ADFRAMEGEN$self->{dict}->{$dynsnpname}->{replace}d") && (open(FILE, "ADFRAMEGEN$self->{dict}->{$dynsnpname}->{replace}d")))
	{

		while (<FILE>)
		{
			$dline.=$_;
		}
		close(FILE);

		#$self->{docline} =~ s/<dynamicsnippet\s+name=\s*\"$dynsnpname\".*?[^-]>/$dline/ig;
		$self->{docline} =~ s/<dynamicsnippet\s+name=\s*\"$dynsnpname\".*?>/$dline/ig;

		return 1;
	}
	return 0;
}

sub _modifyDoc
{
	my $self	= shift;

	foreach $key (keys %{ $self->{dict} })
	{
		if (($self->{dict}->{$key}->{htmltype} eq 'select') && ($self->{dict}->{$key}->{replace} ne ''))
		{
			my $replace = $self->{dict}->{$key}->{replace};
			#$replace =~ s/#/\\#/g;
			$replace =~ s/\|/\\\|/g;
			$replace =~ s/\(/\\\(/g;
			$replace =~ s/\)/\\\)/g;

			$self->{docline} =~ s/(<select.*?name\s*=\s*[\"]$key[\"].*?>(.*?\n)*?\s*<option.*?value\s*=\s*\"$replace\".*?)>/$1 selected>/ig;
       		next;
		}
		elsif (($self->{dict}->{$key}->{htmltype} eq 'selectmultiple') && ($self->{dict}->{$key}->{replace} ne ''))
		{
			my @mreplace = split(/\0/,$self->{dict}->{$key}->{replace});
			foreach $MR (@mreplace)
			{
				$self->{docline} =~ s/(<select.*?name\s*=\s*[\"]?$key.*?>(.*?\n)*?\s*<option.*?value\s*=\s*\"$MR\".*?)>/$1 selected>/ig;
			}
       		next;
		}
		elsif ($self->{dict}->{$key}->{htmltype} eq 'switch') {
			if($self->{dict}->{$key}->{replace} eq '0') {
				$self->{docline} =~ s/<switch\s*name\s*=\s*[\"]?$key[\"]?\s*>.*?(\n.*?)*?<\/switch\s*name\s*=\s*[\"]?$key[\"]?\s*>//ig;
			}
			else {
		    $self->{docline} =~ s/<\/?switch\s*name\s*=\s*[\"]?$key[\"]?\s*>//ig;
			}
		}
		elsif (($self->{dict}->{$key}->{htmltype} eq 'radio') && ($self->{dict}->{$key}->{replace} ne ''))
		{
			$self->{docline} =~ s/(\<\s*input\s*type\s*=\s*[\"]?radio.*?name\s*=\s*[\"]?$key\b.*?value\s*=\s*[\"]?$self->{dict}->{$key}->{replace}.*?)\>/$1 checked\>/ig;
       		next;
		}
		elsif ($self->{dict}->{$key}->{htmltype} eq 'alert')
		{
			#$boxcode = "<script type=\"text/javascript\">document.write('<div class=\"adframeAlertBox\">".$self->{dict}->{$key}->{replace}."</div>');</script>";
			$boxcode = "<script type=\"text/javascript\">\nalert(\'".$self->{dict}->{$key}->{replace}."\');\n</script>";
			#main::debug($boxcode);
			if ($self->{docline} =~ /<\/body>/)
			{
					$self->{docline} =~ s/<\/body>/$boxcode\n<\/body>/i;
			}
			else
			{
				$self->{docline} =~ s/<js>/$boxcode\n/i;
				#$self->{docline} .= "\n$boxcode";
			}

			#$self->{docline} =~ s/(<\s*\/head\s*>)/<script language=\"JavaScript\">function _adframeAlertWin_\(\) \{ alert\(\'$self->{dict}->{$key}->{replace}\'\);\}\<\/script\>\n$1/i;
			#if ($self->{docline} =~ /<body.*?onload\s*=\s*\".*?\"/)
			#{
			#	$self->{docline} =~ s/(<body.*?)(onload\s*=\s*\")(.*?)\"/$1$2$3;_adframeAlertWin_\(\)\"/i;
			#}
			#elsif ($self->{docline} =~ /<body.*?/)
			#{
			#	$self->{docline} =~ s/(<body.*?)>/$1 onload=\"_adframeAlertWin_\(\)\">/i;
			#}
			#else
			#{
			#	$self->{docline} =~ s/<js>/<script language=\"javascript\" type=\"text\/javascript\">alert\(\'$self->{dict}->{$key}->{replace}\'\);<\/script>/i;
			#}
			next;
		}
		elsif ($self->{dict}->{$key}->{htmltype} eq 'hidden')
		{
			$self->{docline} =~ s/(\<\s*form.*?\>)/$1<input type=\"hidden\" name=\"$key\" value=\"$self->{dict}->{$key}->{replace}\"\>\n/ig;
			next;
		}
		elsif ($self->{dict}->{$key}->{htmltype} eq 'selfdefined')
		{
			$self->{docline} =~ s/<\!--\s#$key#\s-->/$self->{dict}->{$key}->{replace}/g;
		}
		elsif ($self->{dict}->{$key}->{htmltype} eq 'checkbox')
		{
			$self->{dict}->{$key}->{replace} = 'checked' if ($self->{dict}->{$key}->{replace} ne '');
	    	$self->{docline} =~ s/<\!--\s#_$key#\s-->/$self->{dict}->{$key}->{replace}/g;
	    	$self->{docline} =~ s/(<\s*input\s*type\s*=\s*[\"]?checkbox.*?name\s*=\s*\"$key\".*?)>/$1 $self->{dict}->{$key}->{replace}\>/ig;
		}
		else
		{
			$self->{docline} =~ s/<\!--\s#_$key#\s-->/$self->{dict}->{$key}->{replace}/g;
			$self->{docline} =~ s/<\!--\s#$key#\s-->/$self->{dict}->{$key}->{replace}/g;
		}
	}
	$self->{docline} =~ s/<\!--\s+#id#\s+-->/$self->{session_id}/g;
	$self->{docline} =~ s/<\!--\s+#doc#\s+-->/$self->{doc}\.$self->{doctype}/g;
}

sub parseManual
{
	my $self	= shift;
	my $key		= shift;
	my $replace	= shift;
	if ((length($key)>1) && ($replace ne ''))
	{
		$self->{docline} =~ s/$key/$replace/g;
	}
}

sub importStaticSnippet
{
	my $self	= shift;
	my $key		= shift;
	require de::adframe::core::TemplateParser;
	my $parser	= TemplateParser::new('TemplateParser');
	$parser->loadTemplate("$ENV{ADFRAME_DOC_PATH}/$self->{dict}->{$key}->{replace}");
	$parser->modifyStandards();
	my $snip = $parser->getTemplateAsString();
	$self->{docline} =~ s/<staticsnippet\s+name=\s*\"$key\".*?>/$snip/ig;
}
sub sendRefreshHeader
{
	my $self	= shift;
	my $refresh	= shift;
	print "Refresh: $refresh\n";
}
sub sendDoc
{
	my $self	= shift;
	$| = 1;
	print "Cache-Control: no-cache\n";
	print "Content-type: $self->{contenttype}\n\n";
	print encode('UTF-8',$self->{docline});
	#print $self->{docline};
}
sub initSession
{
	my $self	= shift;
	my $id		= shift;
	if ($ENV{ADFRAME_USE_SESSIONS})
	{
		$self->{session} = init Session($ENV{ADFRAME_SESSION_PATH},$id);
		$self->{session_id}	= $self->{session}->sessionId();
	}
}
sub storeSession
{
	my $self	= shift;
	$self->{session}->store() if ($ENV{ADFRAME_USE_SESSIONS});
}
sub getSessionId
{
	my $self	= shift;
	return $self->{session_id};
}
sub setToSession
{
	my $self	= shift;
	$self->{session}->set(@_) if ($ENV{ADFRAME_USE_SESSIONS});
}
sub getFromSession
{
	my $self	= shift;
	my $key		= shift;
	if (ref $self->{session})
	{
		$val =	$self->{session}->get($key);
		$val =~ s/_/ /g;
		return $val;
	}
	return undef;
}
sub setInToSession
{
	my $self	= shift;
	my @keys	= @_;
	if (@keys == ())
	{
		@keys = keys %main::in;
	}
	foreach $k (@keys)
	{
		if ((defined $main::in{$k}) && ($k ne 'adframe_event'))
		{
			$self->{session}->set($k,$main::in{$k});
		}
	}
	$self->storeSession();
}
sub getInFromSession
{
	my $self        = shift;
	my @keys        = @_;
	if (@keys != ()) {
		foreach (@keys)
		{
			$main::in{$_} = $self->{session}->get($_) if ((! defined $main::in{$_}) && ($k ne 'adframe_event'));
		}
	}
	else
	{
		foreach ($self->{session}->allKeys())
		{
			$main::in{$_} = $self->{session}->get($_) if (! defined $main::in{$_});
		}
	}
}
sub deleteFromSession
{
	my $self	= shift;
	$self->{session}->delete(@_);
}
sub setReplaceFromSession
{
	my $self 	= shift;
	my @keys 	= @_;
	my $value	= '';
	if (@keys == ())
	{
		@keys = $self->{session}->allKeys();
	}
	foreach $K (@keys)
	{
		$value = $self->{session}->get($K);
		$self->{dict}->{$K}->{replace} = $value if (defined $self->{session}->defined($K));
		$self->{dict}->{$K}->{replace} = 'checked' if (($self->{dict}->{$K}->{htmltype} eq 'checkbox') && ($value ne ''));
	}
}
sub getFromDict
{
	my $self = shift;
	my $key	 = shift;
	my $qual = shift;
	if ($qual ne '')
	{
		return $self->{dict}->{$key}->{$qual};
	}
	elsif ($key ne '')
	{
		return %{ $self->{dict}->{$key} };
	}
	else
	{
		return %{ $self->{dict} };
	}
}
sub getAllDictKeys
{
	my $self	= shift;
	return keys %{ $self->{dict} };
}
sub setToDict
{
	my $self		= shift;
	for ($i=0;$i<=$#_;$i+=5)
	{
		my $key			= $_[$i];
		my $htmltype	= $_[$i+1];
		my $valuetype	= $_[$i+2];
		my $descr		= $_[$i+3];
		my $replace		= $_[$i+4];
		$key =~ s/\s//g;
		if ($key ne '')
		{
	   		$self->{dict}->{$key}->{htmltype} 	= $htmltype 	if ($htmltype ne '');
	   		$self->{dict}->{$key}->{type} 		= $valuetype	if ($valuetype ne '');
	   		$self->{dict}->{$key}->{descr} 		= $descr	if ($descr ne '');
		   	if ($replace eq '') {$replace = $self->{session_content}->{$key};}
	   		$self->{dict}->{$key}->{replace} 	= $replace 	if ($replace ne '');
		}
	}
}
sub setValue
{
	my $self	= shift;
	for ($i=0;$i<=$#_;$i+=2)
	{
		if ($_[$i] ne '')
		{
			$self->{dict}->{"$_[$i]"}->{replace} = $_[$i+1];
		}
	}
}
sub getValue
{
	my $self	= shift;
	my $key		= shift;
	return $self->getFromDict($key,'replace');
}
sub setTypeAndDescr
{
	my $self	= shift;
	for ($i=0;$i<=$#_;$i+=3)
	{
		if ($_[$i] ne '')
		{
			$self->{dict}->{"$_[$i]"}->{type} = $_[$i+1];
			$self->{dict}->{"$_[$i]"}->{descr} = $_[$i+2];
		}
	}
}
sub setRequired
{
	my $self	= shift;
	my @keys	= @_;
	foreach my $key (@keys)
	{
		if ($self->{dict}->{"$key"}->{type} !~ /required/)
		{
			$self->{dict}->{"$key"}->{type} .= ',required';
		}
	}
}
sub resetRequired
{
	my $self	= shift;
	my @keys	= @_;
	foreach my $key (@keys)
	{
		if ($self->{dict}->{"$key"}->{type} =~ /required/)
		{
			$self->{dict}->{"$key"}->{type} =~ s/\,required//i;
		}
	}
}
sub setReplaceFromIn
{
	my $self = shift;
	my @keys = @_;
	foreach $K (@keys)
	{
       	$self->{dict}->{$K}->{replace} = $main::in{$K};
		$self->{dict}->{$K}->{replace} = 'checked' if (($self->{dict}->{$K}->{htmltype} eq 'checkbox') && ($main::in{$K} ne ''));
	}
}
sub deleteFromDict
{
	my $self	= shift;
	my @keys	= @_;
	foreach (@keys)
	{
		undef $self->{dict}->{$_} if (($_ ne 'id') && ($_ ne 'doc'));
	}
}
sub setSwitch
{
	my $self	= shift;
	for ($i=0;$i<=$#_;$i+=2)
	{
		my $status	= '0';
		$status = '1' if ($_[$i+1] eq 'on');
		$self->{dict}->{$_[$i]}->{htmltype} = 'switch';
		$self->{dict}->{$_[$i]}->{replace}  = $status;
	}
}
sub showAlert
{
	my $self	= shift;
	my $mess	= shift;
	$self->setToDict('alert','alert','','',$mess);
}
sub passAsHidden
{
	my $self 	= shift;
	my $key	 	= shift;
	my $value	= shift;
       $self->{dict}->{$key}->{htmltype} = 'hidden';
       $self->{dict}->{$key}->{replace} = "$value";
}
sub makeRepetition
{
	my $self	= shift;
	$self->{generated}->{$key} = 1;
	require de::adframe::core::TemplateParser;
	my $parser	= TemplateParser::new('TemplateParser');
	$parser->setTemplateAsStringRef(\$self->{docline});
	$parser->makeRepetition(@_);
	$self->{docline} = $parser->getTemplateAsString();
}
sub checkInputs
{
	my $self	= shift;
	require de::adframe::core::RequestFunctions;
	return RequestFunctions::checkInputs(@_);
}
sub alertRequestErrors
{
	my $self	= shift;
	require de::adframe::core::RequestFunctions;
	return RequestFunctions::alertRequestErrors(@_);
}
sub setZone
{
	my $self	= shift;
	$self->{zone}	= shift;
}
sub getZone
{
	my $self	= shift;
	return $self->{zone};
}
sub debug
{
	my $self	= shift;
	require de::adframe::core::Logger;
	print encode('UTF-8',Logger::debug($self,$self->{doc}.".$self->{doctype}",@_));
	exit 0;
}
sub error
{
	my $self	= shift;
	require de::adframe::core::Logger;
	print Logger::errorpage($self,@_);
	exit 0;
}
sub logger
{
	my $self	= shift;
	require de::adframe::core::Logger;
	Logger::logger(@_);
}
sub internLocation {
	my $self 		= shift;
	my $page	= shift;
	$page =~ s/^\///;
	$page .= '.html' if ($page !~ /(\.html|\.snp)/);
	$self->storeSession();
	my $cgi = new CGI;
	my $id		= $self->getSessionId();
	if ($page=~/\?/)
	{
		$page.='&';
	}
	else
	{
		$page.='?';
	}
	$page .= 'id='.$id;
	print $cgi->redirect('/'.$page);
	exit 0;
}


sub externLocation
{
	my $self		= shift;
	my $page		= shift;



	print "Location: http://$page\n\n";

	exit 0;
}

sub internSslLocation
{
	my $self		= shift;
	my $page		= shift;
	if ($ENV{ADFRAME_SSLSERVER_NAME} eq '')
	{
		$self->internLocation($page);
	}
	else
	{
		$self->storeSession();
		my $id		= $self->getSessionId();
		if ($page=~/\?/)
		{
			$page.='&';
		}
		else
		{
			$page.='?';
		}
		$page .= 'id='.$id;
		if ($ENV{ADFRAME_SSLSERVER_NAME} !~ /http/i)
		{
			$ENV{ADFRAME_SSLSERVER_NAME} = 'https://'.$ENV{ADFRAME_SSLSERVER_NAME};
		}
		print "Location: $ENV{ADFRAME_SSLSERVER_NAME}/cgi-bin/adframe/$page\n\n";
		exit 0;
	}
}
sub setCookie
{
	my $self	= shift;
	my $name	= shift;
	my $value	= shift;
	my $expires	= shift;
	my $path	= shift;
	my $domain	= $ENV{ADFRAME_SERVER_NAME};
	$path 		= '/' if ($path eq '');
	$expires 	= gmtime(time()+10*24*3600)." GMT" if ($expires eq '');
	#main::debug($expires);
	#print "Set-Cookie: $name=$value; domain=$domain; path=$path; expires=$expires;\n";
	print "Set-Cookie: $name=$value; path=/; expires=$expires\n";

}
sub getCookie
{
	my $self	= shift;
	my $name	= shift;
	require CGI;
	$query 		= CGI::new('CGI');
   	my $value 	= $query->cookie($name);
  	return $value;
}