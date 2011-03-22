package SpamSniffer;
$DEFAULT_SPAMCONF	= 'conf/SPAM_KEYWORDS.txt';
1;

sub new
{
	my $class			= shift;
	my $spamconf		= shift;
	my $this			= {};
	bless $this,$class;
	$this->{spamconf}	= $spamconf;
	return $this;
}

sub isSpamText
{
	my $this			= shift;	
	my $data			= shift;
	my @keywords 		= $this->getSpamKeywords();
	my $found			= 0;
	$data=~ s/\n/ /g;
	$data=~ s/\r/ /g;
	$data=~ s/\x0d/ /g;
	if ($data=~ /<\s*a/i)
	{
		return 1;
	}
	foreach my $k (@keywords)
	{
		$k=~ s/\n//;
		$k=~ s/\r//;
		$k=~ s/\s+$//;
		$k=~ s/^\s+//;
		if (($data =~ /^$k$/i) || ($data =~ /\W$k$/i) || ($data =~ /^$k\W/i) || ($data =~ /\W$k\W/i))
		{
			$found=1;
			last;
		}
	}
	return $found;	
}

sub isSpamUser
{
	my $this			= shift;	
	my $firstname		= shift;
	my $name			= shift;
	if (($firstname eq $name) && ($firstname ne ''))
	{
		return 1;
	}
	return 0;
}


sub loadSpamKeywordsFromFile
{
	my $this			= shift;	
	my $filename		= shift;	
	my @lines			= ();
	if ($filename eq '')
	{
		$filename = $this->{spamconf};
	}
	if ($filename eq '')
	{
		$filename = $DEFAULT_SPAMCONF;
	}	
	if ((-f $filename) && (open(HA,"$filename")))
	{
		@lines = <HA>;
		close(HA);
	}	
	return @lines;
}

sub getSpamKeywords
{
	my $this			= shift;
	my $spamConf		= shift;
	my @spamKeywords	= $this->loadSpamKeywordsFromFile($spamConf);
	if (@spamKeywords ==())
	{
		@spamKeywords = <<_SPAM_WORDS_ =~ m/(\S.*\S)/g;
bisexuals 
black ass
casino
Carbohydrates
cock
dick
Discount
fisting
gay
kasino
Las Vegas 
million
Music Downloads
nude
Poker 
Ring Tone
sex 
teen
_SPAM_WORDS_
	}
	return @spamKeywords;
}