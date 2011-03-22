package TemplateParser;
use Encode;
1;
sub new
{
	my $type	= shift;
	my $self	= {};
	bless $self,$type;
	$self->{template_line}	= '';
	return $self;
}
sub makeRepetition
{
	my $self	= shift;
   	my $name 	= shift;
	my $qu		= shift;
	my $rep		= shift;
	my @repl	= @{ $rep };
   	my @qual 	= split(/\|/, $qu);
   	my $r_puffer	= '';
   	my $repeat		= 0;
   	my $bu_puffer	= '';
   	my @vals		=();
   	my @out = ();
   	my @template_lines = ();
   	   @template_lines = split(/\n/, $self->{template_line});
   	 main::logger("####",$name);
   	for ($i=0; $i<@template_lines; $i++)
   	{
    	if ($template_lines[$i] =~ /<repetition\s*name\s*=\s*[\"]?$name[\"]?\s*>/)  {
          	$template_lines[$i] = '';                # kill 'BEGIN REP..'
            $repeat = 1;
        }
      	if ($template_lines[$i] =~ /<\/repetition\s*name\s*=\s*[\"]?$name[\"]?\s*>/) {
      	 	$repeat = 0;
           	$template_lines[$i] = '';                   # kill 'END REP..'
           	foreach $x (@repl)	{
           		@vals = split(/\|/, $x);
           		$bu_puffer = $r_puffer;
           		for ($j=0; $j<@qual; $j++) {
          	   		$bu_puffer =~ s/$qual[$j]/$vals[$j]/g;
          		}
          		push(@out, $bu_puffer);
			}
        }
      	if ($repeat) {
       		$r_puffer .= "$template_lines[$i]\n";
      	} else	{
        	push(@out, $template_lines[$i]);
      	}
   	}
   	$self->{template_line} = join("\n",@out);
}
sub setReplacementForKey
{
	my $self	= shift;
	my $key		= '',
	my $value	= '';
	for ($i=0;$i<=$#_;$i+=2)
	{
		$self->{template_line} =~ s/<\!--\s+#$_[$i]#\s+-->/$_[$i+1]/ig;
	}
}
sub setTemplateAsStringRef
{
	my $self	= shift;
	my $lineref	= shift;
	$self->{template_line} = ${ $lineref};
}
sub getTemplateAsStringRef
{
	my $self	= shift;
	return \$self->{template_line};
}
sub getTemplateAsString
{
	my $self	= shift;
	return $self->{template_line};
}
sub loadTemplate
{
	my $self		= shift;
	my $template	= shift;
	my $line		= '';
	$self->{template_line} = '';
	if (open(FILE, $template))
	{
		while (<FILE>)
		{
			$self->{template_line}.= decode('UTF-8',$_);
		}
		close(FILE);
		return 1;

	}
	return 0;
}
sub modifyStandards
{
	my $self	= shift;
	my $idvar	= '';
	my $replace	= '';
	if ($ENV{ADFRAME_USE_SESSIONS})
	{
		$idvar = "?id=<!-- #id# -->";
   	}
	$self->{template_line} =~ s/<(frame\s*name\s*=\s*[\"]?.*?[\"]?\s*)src=\s*\"(.*?)\"(.*?>)/<$1src=\"\/cgi-bin\/adframe\/$2$idvar" $3/ig;
	$self->{template_line} =~ s/<(area.*?name=.*?href=)"(.*?)"(.*?)>/<$1\"\/cgi-bin\/adframe\/$2\?id=$id\"$3>/ig;
	$self->{template_line} =~ s/(\<\s*form.*?\>)/$1<input type=\"hidden\" name=\"id\" value=\"<!-- #id# -->\"\><input type=\"hidden\" name=\"adframe_event\" value=\"submit\"\>/ig;
	$self->{template_line} =~ s/<a\s+href\s*=\s*\"(.*?)"(.*?>.*?)<\/a>/<a href=\"\/cgi-bin\/adframe$1$idvar\"$2<\/a>/ig;
	$self->{template_line} =~ s/(<area[^\/]*?href\s*=\s*\")(.*?)(".*?>.*?)/$1\/cgi-bin\/adframe\/$2$idvar$3/ig;
	$self->{template_line} =~ s/<\s*!--\s*#mod_doc#\s*--\s*>/$1<input type=\"hidden\" name=\"doc\" value=\"<!-- #doc# -->\"\>\n/ig;
	$self->{template_line} =~ s/(<img.*?src\s*=\s*\")([^\/])(.*?)(\".*?>)/$1$self->{filedir}\/$2$3$4/g;
	$self->{template_line} =~ s/(<script.*?src\s*=\s*\")([^\/])(.*?)(\".*?>)/$1$self->{filedir}\/$2$3$4/g;
	$self->{template_line} =~ s/(<a\s+href\s*=\s*\"\/cgi-bin\/adframe)([^\/])(.*?)(\".*?>)/$1\/$self->{filedir}\/$2$3$4/ig;
	$self->{template_line} =~ s/(<a\s+href\s*=\s*\"[^\"]*?\?[^\"]*?)\?(.*?>)/$1\&$2/ig;
	#$self->{docline} =~ s/(<a\s+href\s*=\s*\"\/cgi-bin\/adframe)(.*?)(#)(.*?)(\&)(.*?)(\".*?>)/$1$2$5$6$3$4$7/ig;
}