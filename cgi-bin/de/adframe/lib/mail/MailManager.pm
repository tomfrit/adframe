package MailManager;
1;
$MAILER	= '/usr/lib/sendmail -t -oi';

sub new
{
	my $type				= shift;
	my $this				= {};
	bless $this,$type;
	$this->{emailaddress}	= '';
	$this->{emailbcc}		= '';
	$this->{emailsender}	= '';
	$this->{emailsubject}	= '';
	$this->{emailtemplate}	= '';
	return $this;
}
sub setEmailAddress
{
	my $this				= shift;
	my $emailaddress		= shift;
	$this->{emailaddress}	= $emailaddress;
}
sub setEmailBcc
{
	my $this				= shift;
	my $emailbcc			= shift;
	$this->{emailbcc}		= $emailbcc;
}
sub setEmailSender
{
	my $this				= shift;
	my $emailsender			= shift;
	$this->{emailsender}	= $emailsender;
}
sub setEmailSubject
{
	my $this				= shift;
	my $emailsubject		= shift;
	$this->{emailsubject}	= $emailsubject;
}
sub setEmailTemplate
{
	my $this				= shift;
	my $emailtemplate		= shift;
	$this->{emailtemplate}	= $emailtemplate;
}

sub mail 
{
	my $this				= shift;
	if (($this->{emailaddress} =~ /\@/) && ($this->{emailsender} =~ /\@/))
	{
  		if (open(MAIL, "| $MAILER -F $this->{emailsender}"))
  		{
   			print MAIL 'From: '.$this->{emailsender}."\n";
   			print MAIL 'To: '.$this->{emailaddress}."\n";
   			print MAIL 'Bcc: '.$this->{emailbcc}."\n" if ($this->{emailbcc} ne '');
   			print MAIL 'Subject: '.$this->{emailsubject}."\n";
   			print MAIL "\n";
   			foreach (@_) 
   			{
   			   	print MAIL "$_";
   			}
   			close(MAIL);
   			return 1;
   		}
   	}
   	return 0;
}

sub mailTemplate
{
	my $this				= shift;
	my %data				= @_;
	
	if (-f $this->{emailtemplate})
	{
		
		my @maillines = $this->replaceTextFromFileByHash($this->{emailtemplate},%data);
		if (@maillines != ())
		{
			
			if ($this->mail(@maillines))
			{
				return 1;
			}
		}
	}
	return 0;
}

sub appendToFile
{
	my $this			= shift;
	my $filename		= shift;
	my $ntime = localtime(time);
	if (open(MH, ">>$filename") )
	{
		print MH "<message date=\"$ntime\">\n";
		print MH "From: $this->{emailsender}\n";
		print MH "To: $this->{emailaddress}\n";
		print MH "Subject: $this->{emailsubject}\n";
		print MH "\n";
		foreach (@_) 
		{
	   	   	print MH "$_";
   		}
   		print MH "</message>\n\n";
   		close (MH);
   		chmod (0777, $filename);
	}
}
sub mailWithAttachements 
{
	my $this			= shift;
	my $EMAIL_ADDRESS	= shift;
	my $EMAIL_BCC		= shift;
	my $EMAIL_SENDER	= shift;
	my $EMAIL_SUBJECT	= shift;
	my $ATTACH_PATH		= shift;
	my $ATTACHFILES		= shift; # format: "file1,file2,..."
	my $BOUNDARY_1		= "----=_NextPart_000_00F1_01BFC7F9.44FEDA00";
	my $BOUNDARY_2		= "----=_NextPart_001_00F2_01BFC7F9.44FEDA00";
	my @ATTACH_ME		= $this->makeAttachmentsFromFiles($BOUNDARY_1,$ATTACH_PATH,$ATTACHFILES);
   	if (open(MAIL, "| $MAILER -F$EMAIL_SENDER"))
   	{
   		print MAIL 'From: '.$EMAIL_SENDER."\n";
   		print MAIL 'To: '.$EMAIL_ADDRESS."\n";
   		print MAIL 'Bcc: '.$EMAIL_BCC."\n" if ($EMAIL_BCC);
   		print MAIL 'Subject: '.$EMAIL_SUBJECT."\n";
   		print MAIL "MIME-Version: 1.0\n";
   		print MAIL "Content-Type: multipart/mixed; boundary=$BOUNDARY_1\n\n";
   		print MAIL "This is a multi-part message in MIME format.\n\n";
   		print MAIL "--$BOUNDARY_1\n";
   		print MAIL "Content-Type: multipart/alternative; boundary=$BOUNDARY_2\n\n";
   		print MAIL "--$BOUNDARY_2\n";
		print MAIL "Content-Type: text/plain;\n\n";
		#print MAIL "Content-Transfer-Encoding: 7bit\n\n";
   		print MAIL "\n";
   		foreach $t (@_) {
   			$t = convertToAscii MailManager($t);
   		   	print MAIL "$t\n";
   		}
   		print MAIL "\n\n";
   		print MAIL "--$BOUNDARY_2--\n\n";
		print MAIL @ATTACH_ME if (@ATTACH_ME != ());
		print MAIL "--$BOUNDARY_1--\n";
   		close(MAIL);
   		return 1;
   	}
   	else
   	{
   		return 0;
   	}

}

sub makeAttachmentsFromFiles
{
	my $this			= shift;
	my $BOUNDARY_1		= shift;;
	my $ATTACH_PATH		= shift;
	my $files			= shift;
	my @att_files 		= split(/,/,$files);
	my $K				= '';

	my $HEADER_HTML	= "Content-Type: text/html; charset=us-ascii\nContent-Transfer-Encoding: 8bit\n\n";
	my $HEADER_TEXT	= "Content-Type: text/plain; charset=us-ascii\nContent-Transfer-Encoding: 8bit\n\n";
	my @file_lines;
	my @attlines 	= ();

	foreach $K(@att_files)
	{
		my $HEADER_GIF	= "Content-Type: image/gif; name=\"$K\"\nContent-Transfer-Encoding: base64\nContent-Disposition: inline; filename=\"$K\"\n\n";
		my $HEADER_JPG	= "Content-Type: image/jpeg; name=\"$K\"\nContent-Transfer-Encoding: base64\nContent-Disposition: inline; filename=\"$K\"\n\n";
		my $HEADER_PDF	= "Content-Type: image/pdf; name=\"$K\"\nContent-Transfer-Encoding: base64\nContent-Disposition: inline; filename=\"$K\"\n\n";
		my $HEADER_ZIP	= "Content-Type: application/zip; name=\"$K\"\nContent-Transfer-Encoding: base64\nContent-Disposition: inline; filename=\"$K\"\n\n";
		my $HEADER_SIT	= "Content-Type: application/sit; name=\"$K\"\nContent-Transfer-Encoding: base64\nContent-Disposition: inline; filename=\"$K\"\n\n";
		if ($K =~ /\.htm/)
		{
			if (open (ATTHA, "$ATTACH_PATH/$K"))
			{
				@file_lines = <ATTHA>;
				close (ATTHA);
				push(@attlines, "--$BOUNDARY_1\n");
				push(@attlines, $HEADER_HTML);
				@attlines = (@attlines,@file_lines);
			}
		}
		elsif ($K =~ /\.jpg/)
		{
			@file_lines = $this->convertToB64("$ATTACH_PATH/$K");
			push(@attlines, "\n--$BOUNDARY_1\n");
			push(@attlines, $HEADER_JPG);
			@attlines = (@attlines,@file_lines);
		}
		elsif ($K =~ /\.gif/)
		{
			@file_lines = ($this->convertToB64("$ATTACH_PATH/$K"));
			push(@attlines, "\n--$BOUNDARY_1\n");
			push(@attlines, $HEADER_GIF);
			@attlines = (@attlines,@file_lines);
		}
		elsif ($K =~ /\.pdf/)
		{
			@file_lines = ($this->convertToB64("$ATTACH_PATH/$K"));
			push(@attlines, "\n--$BOUNDARY_1\n");
			push(@attlines, $HEADER_PDF);
			@attlines = (@attlines,@file_lines);
		}
		elsif ($K =~ /\.zip/)
		{
			@file_lines = ($this->convertToB64("$ATTACH_PATH/$K"));
			push(@attlines, "\n--$BOUNDARY_1\n");
			push(@attlines, $HEADER_ZIP);
			@attlines = (@attlines,@file_lines);
		}
		elsif ($K =~ /\.sit/)
		{
			@file_lines = ($this->convertToB64("$ATTACH_PATH/$K"));
			push(@attlines, "\n--$BOUNDARY_1\n");
			push(@attlines, $HEADER_SIT);
			@attlines = (@attlines,@file_lines);
		}
		else
		{
			if (open (ATTHA, "$ATTACH_PATH/$K"))
			{
				@file_lines = <ATTHA>;
				close (ATTHA);
				push(@attlines, "\n--$BOUNDARY_1\n");
				push(@attlines, $HEADER_TEXT);
				@attlines = (@attlines,@file_lines);
			}
		}
	}
	return (@attlines);
}

sub convertToB64
{
	my $this			= shift;
	my $binfile 		= shift;
	my @bin				= ();;
	my $b64_encoder 	= '/usr/bin/mmencode';
   	if (open(MBF, "$b64_encoder $binfile |"))
   	{
       	@bin = <MBF>;
      	close(MBF);
   	}
   	return @bin;
}

sub convertToAscii
{
	my $this			= shift;
	my $text			= shift;
	$text =~ s/ä/ae/g;
	$text =~ s/Ä/Ae/g;
	$text =~ s/ü/ue/g;
	$text =~ s/Ü/Ue/g;
	$text =~ s/ö/oe/g;
	$text =~ s/Ö/Oe/g;
	$text =~ s/ß/ss/g;
	return $text;
}
sub replaceTextFromFileByHash
{
	my $this			= shift;
	my $file			= shift;
	my %kHash			= @_;
	my @text			= ();
	if (open(F,$file))
	{
		@text	= <F>;
		close (F);
		for ($i=0;$i<=$#text;$i++)
		{
			foreach my $k (keys %kHash)
			{
				$text[$i] =~ s/#$k#/$kHash{$k}/g;
				$text[$i] =~ s/\x0d//g;
			}
		}
	}
	return @text;
}
sub replaceTextFromFileByIn
{
	my $this			= shift;
	my $file			= shift;
	my @repl			= @_;
	my @text			= ();
	if (open(F,$file))
	{
		@text	= <F>;
		close (F);
		for ($i=0;$i<=$#text;$i++)
		{
			foreach $k (@repl)
			{
				$text[$i] =~ s/#$k#/$main::in{$k}/g;
			}
		}
	}
	return @text;
}