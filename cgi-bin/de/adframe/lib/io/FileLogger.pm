package FileLogger;
use de::adframe::lib::DateTime;
1;
sub new
{
	my $type		= shift;
	my $filename	= shift;
	my $this		= {};
	bless $this,$type;
	$this->{filename} = $filename;
	$this->{separator}	= '|';
	return $this;
}

sub setSeparator
{
	my $this		= shift;
	my $separator	= shift;
	$this->{separator} = $separator;
}

sub log
{
	my $this		= shift;
	my @logdata		= @_;
	if (open HA, ">>$this->{filename}")
	{
		for (my $i=0;$i<=$#logdata;$i++)
		{
			print HA $logdata[$i];
			if ($i<$#logdata)
			{
				print HA $this->{separator};
			}
		}
		print HA "\n";
		close(HA);
		chmod (0777,$this->{filename});
		return 1;
	}
	else
	{
		$self->{error} = "Cannot log: $logstring";
	}
	return 0;
}

sub logTime
{
	my $this		= shift;
	my @logdata		= @_;
	my $time		= new DateTime();
	my $timeString	= $time->getDateInt(':');
	return $this->log($timeString,@logdata);
}

sub logAdframeFormat
{
	my $this		= shift;
	my $adframe		= shift;
	my @logdata		= @_;
	my $doc			= '';
	my $session		= '';
	my $vistor		= '';
	my $referer		= '';
	if (ref $adframe)
	{
		$doc		= $adframe->{doc}.'.'.$adframe->{doctype};
		$session	= $adframe->getSessionId();
		$referer 	= $adframe->getFromSession('TRACK_REFERER');
	}
	return $this->logTime($doc,$session,$referer,@logdata);
}

sub getErrorMessage
{
	my $this		= shift;
	return $self->{error};
}