package HttpTemplateGenerator;
use LWP::UserAgent;
1;

sub new
{
	my $type      		= shift;
	my $this        	= {};
	bless $this, $type;
	return $this;
}

sub generate
{
	my $this			= shift;
	my $url				= shift;
	my $storefile		= shift;	
	my $ok				= 0;
	if (($url ne '') && ($storefile ne ''))
	{
		my $ua             = new LWP::UserAgent;
    	$ua->agent("ADFRAME_INTERN".$ua->agent);
    	$ua->timeout(10);
    	my $response = $ua->get($url);
    	if ($response->is_success)
    	{
    	    $data = $response->content();
    	    if (($data ne '') && (open(HA,">$storefile")))
    	    {
    	    	$data = $this->deleteAdframeEncoding($data);
    	    	print HA $data;
    	    	$ok = 1;
    	    	chmod(0777, $storefile);
    	    	close(HA);
    		}
    	}
    	else
    	{
    		main::logger($response->status_line);
    	}
    }
    return $ok
}

sub deleteAdframeEncoding
{
	my $this			= shift;
	my $data			= shift;
	# HREF: /cgi-bin/adframe raus:
	$data =~ s/(<a\s+href\s*=\s*\")(\/cgi-bin\/adframe)(.*?>)/$1$3/ig;
	
	$data =~ s/\&?id=\d+//g;
	return $data;
}


