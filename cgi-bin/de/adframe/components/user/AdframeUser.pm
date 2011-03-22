package AdframeUser;
# extends:
# version 28012010 / tf / inkl Rollen

use de::adframe::components::user::gen::ClassADFRAME_USER; @ISA=qw(ClassADFRAME_USER);
1;

sub new
{
	my $class				= shift;
	my $ADFRAME_CHANNEL 	= shift;
	my $ROLES				= shift;
	my $this					= $class->SUPER::new(@_);
	if (ref $this)
	{
		$this->{col}->{ADFRAME_CHANNEL} = $ADFRAME_CHANNEL;
		$this->{col}->{ROLES} = $ROLES if $ROLES;
	}
	
	return $this;
}

sub setEMAIL
{
	my $this			= shift;
	$this->SUPER::setEMAIL(@_);
	my $userIdSetCond 	= '';
	if ($this->{col}->{EMAIL} eq '')
	{
		return 1;
	}
	if ($this->{col}->{ADFRAME_USER_ID} > 0)
	{
		$userIdSetCond = " and ADFRAME_USER_ID<>$this->{col}->{ADFRAME_USER_ID}";
	}
	my $otherExists = $this->get('ADFRAME_USER','ADFRAME_USER_ID',"ADFRAME_CHANNEL='$this->{col}->{ADFRAME_CHANNEL}' $userIdSetCond and EMAIL like '$this->{col}->{EMAIL}'");
	if (! $otherExists )
	{
		return 1;
	}
	else
	{
		my $otherId = $this->get('ADFRAME_USER','ADFRAME_USER_ID',"ADFRAME_CHANNEL='$this->{col}->{ADFRAME_CHANNEL}' $userIdSetCond and EMAIL like '$this->{col}->{EMAIL}' AND ROLES not like '%".$this->{col}->{ROLES}."%'");
		if($otherId > 0) {
			$this->{col}->{ADFRAME_USER_ID} = $otherId;
			return 1;
		}
		else {
			$this->{col}->{EMAIL} = '';		
			return 0;
		}
	}
}

sub setLOGIN
{
	my $this			= shift;
	$this->SUPER::setLOGIN(@_);
	my $userIdSetCond 	= '';
	if ($this->{col}->{LOGIN} eq '')
	{
		return 1;
	}
	if ($this->{col}->{ADFRAME_USER_ID} > 0)
	{
		$userIdSetCond = " and ADFRAME_USER_ID<>$this->{col}->{ADFRAME_USER_ID}";
	}
	my $otherExists = $this->get('ADFRAME_USER','ADFRAME_USER_ID',"ADFRAME_CHANNEL='$this->{col}->{ADFRAME_CHANNEL}' $userIdSetCond and LOGIN like '$this->{col}->{LOGIN}'");
	if (! $otherExists )
	{
		return 1;
	}
	else
	{
		$this->{col}->{LOGIN} = '';
		return 0;
	}
}

sub addRole
{
	my $this			= shift;
	my $role			= shift;
	$role =~ s/\,//g;
	if ($role ne '') 
	{
		if (($this->{col}->{ROLES} !~ /^\s*$role\s*,/) && ($this->{col}->{ROLES} !~ /,\s*$role\s*,/) && ($this->{col}->{ROLES} !~ /,\s*$role\s*$/) && ($this->{col}->{ROLES} !~ /^\s*$role\s*$/))
		{
			if ($this->{col}->{ROLES} ne '')
			{
				$this->{col}->{ROLES}.=',';
			}
			$this->{col}->{ROLES}.= $role;
			return 1;
		}
	}
	return 0;
}

sub deleteRole
{
	my $this			= shift;
	my $role			= shift;
	$role =~ s/\,//g;
	if ($role ne '') 
	{
		if (($this->{col}->{ROLES} =~ /^\s*$role\s*,/) || ($this->{col}->{ROLES} =~ /,\s*$role\s*,/) || ($this->{col}->{ROLES} =~ /,\s*$role\s*$/) || ($this->{col}->{ROLES} =~ /^\s*$role\s*$/))
		{
			my @roles = split(/,/,$this->{col}->{ROLES});
			$this->{col}->{ROLES} = '';
			for (my $i=0;$i<=$#roles;$i++)
			{
				if ($roles[$i] ne $role)
				{
					$this->addRole($roles[$i]);
				}
			}
			return 1;
		}
	}
	return 0;
}

sub deleteAllRoles
{
	my $this			= shift;
	$this->{col}->{ROLES}		= '';
}

sub hasRole
{
	my $this			= shift;
	my $role			= shift;
	$role =~ s/\,//g;
	
	if ($role ne '') 
	{
		if (($this->{col}->{ROLES} =~ /^\s*$role\s*,/) || ($this->{col}->{ROLES} =~ /,\s*$role\s*,/) || ($this->{col}->{ROLES} =~ /,\s*$role\s*$/) || ($this->{col}->{ROLES} =~ /^\s*$role\s*$/))
		{
			return 1;
		}
	}
	return 0;
}

sub initByCondition
{
	my $this			= shift;
	my $condition 		= shift;
	$condition = "ADFRAME_CHANNEL='$ENV{ADFRAME_CHANNEL}' and $condition";

	return $this->SUPER::initByCondition($condition);
}

sub initByLogin
{
	my $this			= shift;
	my $login			= shift;
	my $passwd			= shift;
	my @roles			= @_;
	my $testUserId		= 0;
	my $adframeUserId	= 0;
	my $testUserId	= $this->initByCondition("LOGIN='$login' and PASSWD='$passwd'");
		
	if ($testUserId,$testUserId>0)
	{
	
		foreach my $k (@roles)
		{
			if ($this->hasRole($k))
			{
				$adframeUserId = $testUserId;
				last;
			}
		}
	}
	return $adframeUserId;
}

sub initByEmail
{
	my $this				= shift;
	my $email			= shift;
	my $passwd			= shift;
	my @roles			= @_;
	my $testUserId		= 0;
	my $adframeUserId		= 0;
	my $testUserId		= $this->initByCondition("EMAIL='$email' and PASSWD='$passwd' and ADMIT>0");
		
	if ($testUserId,$testUserId>0) {
	
		foreach my $k (@roles) {
			if ($this->hasRole($k)) {
				$adframeUserId = $testUserId;
				last;
			}
		}
	}
	return $adframeUserId;
}

sub sendEmail
{

	my $this		= shift;
	use MIME::Base64;
	
	my $login = $this->{col}->{ADFRAME_USER_ID};
	my $text	= "Hallo $this->{col}->{FIRSTNAME} $this->{col}->{NAME}!\n
			Deine Email Adresse wurde im motoX Forum registriert.\n
			Klicke diesen Link um die Registrierung zu bestaetigen.
			Viel Spass im Forum,\n
			Das motoX Team\n
			<a href=\"http://motoxmag.de/cgi-bin/adframe/forum/confirm.html?code=".encode_base64($login.'|'.$this->{col}->{EMAIL})."\">http://motoxmag.de/cgi-bin/adframe/forum/confirm.html?code=".encode_base64($login.'|'.$this->{col}->{EMAIL})."</a>";
	
	#main::debug($login,$this->{col}->{ADFRAME_USER_ID}, $this->{col}->{EMAIL});
	
	#$SENDMAIL='/usr/sbin/sendmail';
	
	#open (SENDMAIL,"|$SENDMAIL -f -odq ".$this->{col}->{EMAIL}) || &fehler("Kann sendmail nicht öffnen");
	#	print SENDMAIL <<EOF;
	#	To: $this->{col}->{EMAIL}
	#	Subject: motoX Forum Registrierung
	#	From: info\@motoxmag.de
	#	Content-Type: text/plain; charset="iso-8859-1"
	#	Content-Transfer-Encoding: 8bit
	#
	#
	#	$text
	#	EOF
	#
	#close SENDMAIL;
main::debug($text);



}