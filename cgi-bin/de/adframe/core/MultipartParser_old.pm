sub parseMultiPart
{
	my $FILEDIR		= $ENV{ADFRAME_TMP_FILES} || '/tmp';

  	($len, $type, $meth, $errflag, $cmdflag, $perlwarn, $got);
	$MAXDATA   	= 131072;	# maximum bytes to accept via POST - 2^17
	$BUFSIZE  	=  8192;    # default buffer size when reading multipart
	$MAXBOUND 	=   100;    # maximum boundary length to be encounterd
	$HEADEROUT 	=    0;     # indicates whether the header has been printed
	$FILEPRE	= $ENV{ADFRAME_TMP_FILEPREF} || '__adframe_uploaded';
	  $perlwarn = $^W;
	  $^W = 0;
	  binmode(STDIN);   # we need these for DOS-based systems
	  binmode(STDOUT);  # and they shouldn't hurt anything else
	  binmode(STDERR);

	# Get several useful env variables
	$type = $ENV{'CONTENT_TYPE'};
	$len  = $ENV{'CONTENT_LENGTH'};
  	$meth = $ENV{'REQUEST_METHOD'};
	$errflag = !(eval <<'END_MULTIPART');

   	local ($buf, $boundary, $head, @heads, $cd, $ct, $fname, $ctype, $blen);
   	local ($bpos, $lpos, $left, $amt, $fn, $ser);
   	local ($bufsize, $maxbound, $writefiles) = ($BUFSIZE, $MAXBOUND, $WRITEFILES);

   	# The following lines exist solely to eliminate spurious warning messages
   	$buf = '';
   	($boundary) = $type =~ /boundary="([^"]+)"/; #";   # find boundary
    ($boundary) = $type =~ /boundary=(\S+)/ unless $boundary;

   	$error = "Boundary not provided: probably a bug in your server" unless $boundary;
   	$boundary =  "--" . $boundary;
   	$blen = length ($boundary);
   	if ($ENV{'REQUEST_METHOD'} ne 'POST')
   	{
   		die "Invalid request method for  multipart/form-data: $meth";
   	}
    $left = $len;
PART: # find each part of the multi-part while reading data
    while (1)
    {
    	die $@ if $errflag;
    	$amt = ($left > $bufsize+$maxbound-length($buf) ?  $bufsize+$maxbound-length($buf): $left);
    	$errflag = (($got = read(STDIN, $buf, $amt, length($buf))) != $amt);
    	die "Short Read: wanted $amt, got $got\n" if $errflag;
    	$left -= $amt;
    	$main::in{$name} .= "\0" if defined $main::in{$name};
    	$name=~/([-\w]+)/;  # This allows $insfn{$name} to be untainted

    	if (defined $1)
    	{
     		$main::insfn{$1} .= "\0" if defined $main::insfn{$1};
    	}
BODY:
    	while (($bpos = index($buf, $boundary)) == -1)
    	{
		         die $@ if $errflag;
		         if ($name)
		         {  # if no $name, then it's the prologue -- discard
					$main::in{$name} .= substr($buf, 0, $bufsize);
		         }
		         $buf = substr($buf, $bufsize);
		         $amt = ($left > $bufsize ? $bufsize : $left); #$maxbound==length($buf);
		         $errflag = (($got = read(STDIN, $buf, $amt, $maxbound)) != $amt);
		 		die "Short Read: wanted $amt, got $got\n" if $errflag;
		         $left -= $amt;
    	}
    	if (defined $name)
    	{
			$main::in{$name} .= substr($buf, 0, $bpos-2);# kill last \r\n
    	}
    	last PART if substr($buf, $bpos + $blen, 4) eq "--\r\n";
    	substr($buf, 0, $bpos+$blen+2) = '';
    	$amt = ($left > $BUFSIZE+$MAXBOUND-length($buf) ? $bufsize+$maxbound-length($buf) : $left);
    	$errflag = (($got = read(STDIN, $buf, $amt, length($buf))) != $amt);
    	die "Short Read: wanted $amt, got $got\n" if $errflag;
    	$left -= $amt;
    	undef $head;  undef $fn;
HEAD:
    	while (($lpos = index($buf, "\r\n\r\n")) == -1)
    	{
    		die $@ if $errflag;
    		$head .= substr($buf, 0, $bufsize);
    		$buf = substr($buf, $bufsize);
    		$amt = ($left > $bufsize ? $bufsize : $left); #$maxbound==length($buf);
    		$errflag = (($got = read(STDIN, $buf, $amt, $maxbound)) != $amt);
    		die "Short Read: wanted $amt, got $got\n" if $errflag;
    		$left -= $amt;
   		}
    	$head  .= substr($buf, 0, $lpos+2);
    	push (@in, $head);
    	@heads 	= split("\r\n", $head);
    	($cd) 	= grep (/^\s*Content-Disposition:/i, @heads);
    	($ct) 	= grep (/^\s*Content-Type:/i, @heads);
    	($name) 	= $cd =~ /\bname="([^"]+)"/i; #";
    	($name) 	= $cd =~ /\bname=([^\s:;]+)/i unless defined $name;
    	($fname) 	= $cd =~ /\bfilename="([^"]*)"/i; #"; # filename can be null-str
    	($fname) 	= $cd =~ /\bfilename=([^\s:;]+)/i unless defined $fname;
    	$main::incfn{$name} .= (defined $main::in{$name} ? "\0" : "") . $fname;
		($ctype)	= $ct =~ /^\s*Content-type:\s*"([^"]+)"/i;  #";
    	($ctype) = $ct =~ /^\s*Content-Type:\s*([^\s:;]+)/i unless defined $ctype;
    	$main::inct{$name} .= (defined $main::in{$name} ? "\0" : "") . $ctype;
    	substr($buf, 0, $lpos+4) = '';
    	undef $fname;
    	undef $ctype;
    	print STDERR "$head\n";
    }
1;
END_MULTIPART
    if ($errflag)
    {
    	my ($errmsg, $value);
    	$errmsg = $@ || $errflag;
    	foreach $value (values %main::insfn)
    	{
      		unlink(split("\0",$value));
    	}
    	die $errmsg;
    }
}
1;