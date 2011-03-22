package MiniTemplate;
1;
sub new 
{
	my $type 		= shift;
	my $this		= {};
	bless $this,$type;
	$this->{template_original_line}	= '';
	return $this;
}
sub clear
{
	my $this		= shift;
	$this->deleteFromDict();
	$this->{template_line}	= $this->{template_original_line};
}
sub setToDict 
{
	my $this		= shift;
	for ($i=0;$i<=$#_;$i+=3)	
	{
		my $key			= $_[$i];
		my $htmltype		= $_[$i+1];
		my $replace		= $_[$i+2];
		$key =~ s/\s//g;
		if ($key ne '') 
		{
	   		$this->{dict}->{$key}->{htmltype} 	= $htmltype;
	   		$this->{dict}->{$key}->{replace} 	= $replace;
		}
	}
}
sub setValue
{
	my $this		= shift;
	my $key			= shift;
	my $value		= shift;
	if ($key ne '') 
	{
	   	$this->{dict}->{$key}->{htmltype} 	= 'selfdefined';
	   	$this->{dict}->{$key}->{replace} 	= $value;
	}
}
sub getFromDict 
{
	my $this = shift;
	my $key	 = shift;
	my $qual = shift;
	if ($qual ne '') 
	{
		return $this->{dict}->{$key}->{$qual};
	} 
	elsif ($key ne '') 
	{
		return %{ $this->{dict}->{$key} };
	} 
	else 
	{
		return %{ $this->{dict} };
	}
}
sub deleteFromDict 
{
	my $this	= shift;
	my @keys	= @_;
	if (@keys == ())
	{
		@keys = keys %{ $this->{dict} };
	}
	foreach (@keys) 
	{
		undef $this->{dict}->{$_};
	}
	
}
sub setSwitch 
{
	my $this	= shift;
	for ($i=0;$i<=$#_;$i+=2) 
	{
		my $status	= '0';
		$status = '1' if ($_[$i+1] eq 'on');
		$this->{dict}->{$_[$i]}->{htmltype} = 'switch';
		$this->{dict}->{$_[$i]}->{replace}  = $status;
	}
}
sub makeRepetition 
{
	my $this	= shift;
   	my $name 	= shift;
	my $qu		= shift;
   	my @qual 	= split(/\|/, $qu);
   	my ($i, $j, $r_puffer, $repeat, $bu_puffer, $x, @vals, @out);
   	my @template_lines = split(/\n/, $this->{template_line});
   	for ($i=0; $i<@template_lines; $i++) 
   	{
    	if ($template_lines[$i] =~ /<repetition\s*name\s*=\s*[\"]?$name[\"]?\s*>/) 
    	{
          	$template_lines[$i] = '';                # kill 'BEGIN REP..'
            $repeat = 1;
            next;
        }
      	if ($template_lines[$i] =~ /<\/repetition\s*name\s*=\s*[\"]?$name[\"]?\s*>/) 
      	{
      	 	$repeat = 0;
           	$template_lines[$i] = '';                   # kill 'END REP..'
           	foreach $x (@_)	
           	{
           		@vals = split(/\|/, $x);
           		$bu_puffer = $r_puffer;
           		for ($j=0; $j<@qual; $j++) 
           		{
          	   		$bu_puffer =~ s/$qual[$j]/$vals[$j]/g;
          		}
          		push(@out, $bu_puffer);
			}
        }
      	if ($repeat) 
      	{
       		$r_puffer .= "$template_lines[$i]\n";
      	} 
      	else	
      	{
        	push(@out, $template_lines[$i]);
      	}
   	}
   	$this->{template_line} = join("\n",@out);
}
sub modify 
{
   	my $this 	= shift;
   	my @key 		= shift;
   	my @allkeys	= keys %{ $this->{dict} };
      @allkeys	= @keys if (@keys != ());
   	my $id	= $this->{session_id};
   	my $line	= $this->{template_line};
	foreach $K (@allkeys) 
	{
   		$replace = $this->{dict}->{$K}->{replace};
       	if ($this->{dict}->{$K}->{htmltype} eq 'selfdefined') 
       	{
            $line =~ s/<\s*!--\s*#$K#\s*--\s*>/$replace/ig;
			next;
		} 
		elsif ($this->{dict}->{$K}->{htmltype} eq 'switch')  
		{
			if ($replace eq '0')
			{
            	$line =~ s/<switch\s*name\s*=\s*[\"]?$K[\"]?\s*>.*?(\n.*?)*?<\/switch\s*name\s*=\s*[\"]?$K[\"]?\s*>//ig;       	     
       		}
       		else
       		{
       		   	$line =~ s/<switch\s*name\s*=\s*[\"]?$K[\"]?\s*>(.*?(\n.*?)*?)<\/switch\s*name\s*=\s*[\"]?$K[\"]?\s*>/$1/ig;       	     
       		}
       	}
    }
    #$line =~ s/<link>(.*?)<\/link>/<a noadd href="http:\/\/$1" target="blank">$1<\/a>/g;
    #$line =~ s/<mailto>(.*?)<\/mailto>/<a noadd href="mailto:$1">$1<\/a>/g;
    $this->{template_line} = $line;
}
sub eleminateActiveHtmlTags
{
	my $this 	= shift;
	
	$this->{template_line} =~ s/(<a.*?href=\").*?(\".*?>.*?<\/a>)/$1javascript:void\(0\)$2/ig;
}

sub loadSourceFile
{
	my $this				= shift;
	my $filename			= shift;
	$this->{filename}		= $filename;
	$this->{template_line}	= '';
	$this->{template_original_line}	= '';
	my $ok					= 0;
	if (open(FILE, "$filename"))
	{
	
	    while (<FILE>) 
	    {
	       	$this->{template_line}.=$_;
	    }
	    close(FILE);
	    $ok = 1;
	} 
	$this->{template_original_line}	= $this->{template_line};
	
	return $ok;
}
sub getDoc
{
	my $this				= shift;
	return $this->{template_line};
}
sub setDoc
{
	my $this				= shift;
	$this->{template_line}	= shift;	
}
sub saveFile
{
	my $this				= shift;
	my $filename			= shift;
	my $ok					= 0;
	if (open (HO, ">$filename"))
	{
		print HO $this->{template_line};
		close(HO);
		$ok = 1;
		chmod(0777, $filename);
	}	
	return $ok;
}
sub saveImage
{
	my $this			= shift;
	my $filename		= shift;
	my $data			= shift;
	if (open (HI, ">$filename"))
	{
		print HI $data;
		close(HI);
		return 1;
	}
	else
	{
		return 0;
	}
}
sub deleteImage
{
	my $this			= shift;
	my $filename		= shift;
	system "rm $filename";
}