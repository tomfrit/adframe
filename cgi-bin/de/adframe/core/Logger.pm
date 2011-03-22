package Logger;
use de::adframe::core::Hash;
1;
# static
sub logger
{
	if ($ENV{ADFRAME_ENABLE_SYSLOG})
	{
		my $time = localtime(time);
		for ($i=0;$i<=$#_;$i++)
		{
			print STDERR "ADFRAME MESSAGE - $time: $_[$i]\n\r";
		}
	}
}
sub debug
{
	my $adframe	= shift;
	my $doc		= shift;

	$adframe->sendHeader();

	require de::adframe::core::TemplateParser;
	my $parser	= new TemplateParser();
	   $parser->loadTemplate('de/adframe/core/debug_template.html');
	my $message		= '';
	my @allin		= ();
	my @mess 		= ();
	foreach $k (@_)
	{
		$message = '';
		if (ref($k) eq 'HASH')
		{
			$message.= Hash::hash2String($k,'',"<br>",'->');
		}
		else
		{
			$message.= "$k";
		}
		$message=~ s/\|/\&#124;/g;
		push(@mess,$message);
	}

	foreach (keys(%main::in))
	{
		push (@allin,$_."|$main::in{$_}");
	}
	$parser->makeRepetition('rep_debug','!debug!',\@mess);
	$parser->makeRepetition('rep_request','!requestkey!|!requestvalue!',\@allin);
	$parser->setReplacementForKey('doc',$doc);
	$parser->setReplacementForKey('zone',$adframe->getZone());
	return $parser->getTemplateAsString();
}
sub errorpage
{
	my $adframe	= shift;
	   $adframe->sendHeader();
	   logger(@_);
	require de::adframe::core::TemplateParser;
	my $parser	= new TemplateParser();
	$parser->loadTemplate('de/adframe/core/error_template.html');
	$parser->makeRepetition('rep_message','!message!',\@_);
	$parser->setReplacementForKey('server_admin',$ENV{ADFRAME_SERVER_ADMIN});
	return $parser->getTemplateAsString();
}
