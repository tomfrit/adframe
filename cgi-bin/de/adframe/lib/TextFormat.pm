package TextFormat;
use de::adframe::lib::StringFunctions;
1;
sub new
{
	my $class			= shift;
	my $this			= {};
	bless $this,$class;
	$this->{errormessage}	= '';
	return $this;
}

sub setText
{
	my $this			= shift;
	$this->{text}		= shift;
}
sub getText
{
	my $this			= shift;
	return $this->{text};
}

sub getConvertedText
{
	my $this			= shift;
	return $this->{convtext};
}

sub convertToHtml
{
	my $this			= shift;
	$this->{convtext}	= StringFunctions::ascii2Html($this->{text});
}

sub convertToAscii
{
	my $this			= shift;
	$this->{convtext}	= StringFunctions::html2Ascii($this->{text});
}

sub convertFromCustomTags
{
	my $this			= shift;
	$this->{convtext}	=~ s/<externlink>(.*?)<\/externlink>/<a noadd href=\"http:\/\/$1\" target=\"\_blank\" class=\"$this->{hrefstyle}\" extern>$1<\/a>/ig;
	$this->{convtext}	=~ s/(<a noadd href=\")(http:\/\/)http:\/\//$1$2/ig;
	
	$this->{convtext}	=~ s/<mailto>(.*?)<\/mailto>/<a noadd href=\"mailto:$1\" target=\"\_blank\" class=\"$this->{hrefstyle}\" mailto>$1<\/a>/ig;
	$this->{convtext}	=~ s/(<a noadd href=\")(mailto:)mailto:/$1$2/ig;	
}

sub convertToCustomTags
{
	my $this			= shift;
	$this->{convtext}	=~ s/<a noadd href=\"(.*?)\" target=\"\_blank\".*?extern>(.*?)<\/a>/<externlink>$2<\/externlink>/ig;

	$this->{convtext}	=~ s/<a noadd href=\"(.*?)\" target=\"\_blank\".*?mailto>(.*?)<\/a>/<mailto>$2<\/mailto>/ig;

}

sub setHrefStyle
{
	my $this			= shift;
	$this->{hrefstyle}	= shift;
}
sub getHrefStyle
{
	my $this			= shift;
	return $this->{hrefstyle};
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
	$this->{errormessage}.='TextFormat: '.$mess.'\n';   
}