package Session;
use CGI qw(-utf8);
use URI::Escape;
use Encode;
use utf8;
1;
sub init
{
	my $type 	= shift;
	my $path		= shift;
	my $id 		= shift;
	my $this 		= {};
	bless $this, $type;
	$this->{path}	= $path;
	
	if ($ENV{ADFRAME_USE_COOKIE_SESSIONS}) {
		my $cookies = CGI->new;
	
		$id = $cookies->cookie('id');
		if ($id) {
			#$cookies{id} =~ s/id=(.*?);.*?$/$1/;
			#$id = $cookies->cookie('id');
			my $content = $cookies->cookie('content');
		 	
			main::logger("#### COOKIE getting id = ".$id."\n");
		
			main::logger("#### COOKIE getting ".$content."\n");	
			
			#foreach $K (keys %cookies) {
			#	if($K ne 'id') {
			#		$this->{session_content}->{"$K"} = $cookies{$K};
			#		main::logger("#### COOKIE getting KEY $K = ".$cookies{$K}."\n");
			#	}
			#}
		#	$cookies{content} =~ s/%2C/,/g;
		#main::debug($content);
			my @vals = split(/\|/,$content);
			#main::debug(@vals);	
			foreach (@vals) {
				my ($ck,$cv) = split(/\^/,$_);
				$cv = uri_unescape($cv);
				#$cv = decode("UTF-8",$cv);
				#main::debug($ck,$cv);
				$this->{session_content}->{"$ck"} = $cv if ($ck ne 'id');
				
			}
		}
		else {
			$id = $this->generateSessId();
			my $c = $cookies->cookie(-name =>'id',-value =>$id,-path=>'/',-expires =>'+24h');
			print "Set-Cookie: $c\n";
			main::logger("#### COOKIE Set-Cookie: $c\n");
		}
	}
	else {
		
		if ((-e "$this->{path}/$id") && ($id ne '')) {
			if (open(HA, "$this->{path}/$id")) {
				my @lin = <HA>;
				close(HA);
				my @tmp;
				foreach my $K (@lin) {
					$K =~ s/\n//g;
					@tmp = split(/\^/, $K);
					$this->{session_content}->{$tmp[0]} = $tmp[1];
					$this->{session_content}->{$tmp[0]} =~ s/<br>/\n/g;
				}
				
    			}
			else {
				$this->{error} = "Cannot read Session $id";
			}
		}
		if (!(-e "$this->{path}/$id") || ($id eq '') || ($this->{session_content}->{'REMOTE_ADDR'} ne $ENV{REMOTE_ADDR})) {
			$id = $this->generateSessId();
			
			$this->{session_content}        = undef;
			if (open(HA,">$this->{path}/$id")) {
				print HA "";
				close(HA);
				chmod(0777,"$this->{path}/$id");
				$this->{session_content}->{'REMOTE_ADDR'} = $ENV{REMOTE_ADDR};
			}
			else {
				$this->{error} = "Cannot write Session $id";
			}
		}
	}
	$this->{session_dirty_flag} = 0;
	$this->{session_id}     	= $id;
	return $this;
}

sub generateSessId {
	my $this = shift;
	my $time = time;
	my $remoteAddr = $ENV{REMOTE_ADDR};
	   $remoteAddr =~ s/\.//g;
	   $id = $time.$remoteAddr.$$;
	return $id;
}


sub sessionId {
	my $this = shift;
	return $this->{session_id};
}

sub set {
	my $this                = shift;
	for($i=0;$i<=$#_;$i+=2)
	{
	    my $key                 = $_[$i];
        my $value               = $_[$i+1];
           $key =~ s/\s//g;
       	if ($key ne '')
       	{
       		$this->{session_content}->{$key} = $value;
        }
        main::logger("$key -> $value");
    }
    $this->{session_dirty_flag} = 1;
}
sub get
{
	my $this        = shift;
	my $key         = shift;
	if ($key ne '')
	{
        return $this->{session_content}->{$key};
    }
    else
    {
		return %{ $this->{session_content} };
    }
}
sub delete
{
	my $this	= shift;
	foreach (@_)
	{
		delete $this->{session_content}->{$_} if (($_ ne 'id') && ($_ ne 'doc'));
	}
	 $this->{session_dirty_flag} = 1;
}
sub store
{
	my $this        = shift;
	my $id          = $this->{session_id};
	my $value       = '';
	my $cookies		= new CGI;
	#main::debug(%{ $this->{session_content} });
	if ($this->{session_dirty_flag} > 0 )
	{
		if ($ENV{ADFRAME_USE_COOKIE_SESSIONS})
		{
			my @cookie;
			my $allvals = ();
			foreach $K (keys %{ $this->{session_content} }) {
				if (($K ne '') && ($K ne 'id') && ($K ne 'DBCONNECTION')) {
					$value = $this->{session_content}->{$K};
				#	$cookie = $cgi->cookie(-name => $K,-value=>$value,-path=>'/',-expires=>'+24h');
				
				#	main::logger("#### COOKIE Set-Cookie:".$cookie);
				#	print "Set-Cookie: $cookie\n";
				#}
				#
				#{
					$value =~ s/\n/<br>/g;
					#$value = encode("UTF-8",$value);
					$value = uri_escape($value);
					$allvals .= $K.'^'.$value.'|';
				}
			}
			
			my $cContent = $cookies->cookie(-name =>'content',-value =>$allvals,-path=>'/',-expires =>'+24h');
			print "Set-Cookie: $cContent\n";
			main::logger("#### Set-Cookie: $cContent ####");
			
			main::logger(@cookie);

		}
		elsif (open(HA, ">$this->{path}/$id"))
		{
			foreach $K (keys %{ $this->{session_content} })
			{
				$value = $this->{session_content}->{$K};
				$value =~ s/\n/<br>/g;
				print HA $K.'^';
				print HA $value;
				print HA "\n";
			}
			close(HA);
			chmod(0777,"$this->{path}/$id");
		}
		else
		{
			$this->{error} = "Cannot write Session $id";
		}
	}
	$this->{session_dirty_flag} = 0;
}
sub allKeys
{
	return keys %{ $this->{session_content} };
}
sub defined
{
	my $this	= shift;
	my $key		= shift;
	if (defined $this->{session_content}->{$key})
	{
		return 1;
	}
	return 0;
}
sub errorMessage
{
	my $this	= shift;
	return $this->{error};
}