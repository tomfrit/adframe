package RequestFunctions;
use utf8;
1;
$WRONG_CHARS = 'Bitte für #descr# folgende Zeichen nicht verwenden: #wrg#\n';
$NO_INPUT    = '#descr# fehlt noch\n';
$NO_EMAIL    = 'Bitte #descr# in der Form: [user@host.domain] angeben.\n';
$WRONG_EXACT_LENGTH = '#descr# muss genau #num# Zeichen lang sein.\n';
$WRONG_MAX_LENGTH 	= '#descr# darf höchstens #num# Zeichen lang sein.\n';
$WRONG_MIN_LENGTH 	= '#descr# muß mindestens #num# Zeichen lang sein.\n';
$WRONG_MIN_ALTER 	= 'Sie müssen mindestens 18 Jahre alt sein.\n';
$WRONG_MAX_VALUE_WITHOUT_ZERO = 'Sie haben bei #descr# einen ungültigen Wert eingegeben.\n';
$ESC_CHAR_MESSAGE 	= '..bitte auf Sonderzeichen durchsehen!';
# static
sub checkInputs
{
	if (($ENV{ADFRAME_LANGUAGE} ne '') && ($ENV{ADFRAME_LANGUAGE} ne 'de') && (-e 'de/adframe/core/RequestFunctionsConst_'.$ENV{ADFRAME_LANGUAGE}.'.pl'))
	{
		require 'de/adframe/core/RequestFunctionsConst_'.$ENV{ADFRAME_LANGUAGE}.'.pl';
	}
	my $c	= '';
	my $t	= '';
	my $r	= '';
	my $n	= '';
   	foreach $k (@_) {
		$main::in{$k} =~ s/^\s*// if (defined $main::in{$k});
		$main::in{$k} =~ s/\s*$// if (defined $main::in{$k});
      		($t, $r, $n) = split(/,/, $main::adframe->{dict}->{$k}->{type});

      		$t =~ s/\s//g; $r =~ s/\s//g; $n =~ s/\s//g;
      		if ($wc = RequestFunctions::_wrong_inputs($t, $main::in{$k})) {

         		$wc =~ s/ /\(SPACE\)/g;
   		      	$wc =~ s/\x0a//g;
         		$wc = $ESC_CHAR_MESSAGE if ($main::adframe->{dict}->{$_}->{htmltype} eq 'textarea');
         		$c .= $WRONG_CHARS;
         		$c =~ s/#descr#/$main::adframe->{dict}->{$k}->{descr}/g;
         		$c =~ s/#wrg#/$wc/g;
      		} elsif (($r eq 'required') && ($main::in{$k} eq '')) {
         		$c .= $NO_INPUT;
         		$c =~ s/#descr#/$main::adframe->{dict}->{$k}->{descr}/g;
      		} elsif (($n) && ($main::in{$k} ne '')) {
         		($spec, $num) = split(/:/, $n);
         		if (($spec eq 'exact') && ($num != length($main::in{$k}))) {
            		$c .= $WRONG_EXACT_LENGTH;
            		$c =~ s/#descr#/$main::adframe->{dict}->{$k}->{descr}/g;
            		$c =~ s/#num#/$num/g;
         		} elsif (($spec eq 'max') && ($num < length($main::in{$k}))) {
            		$c .= $WRONG_MAX_LENGTH;
            		$c =~ s/#descr#/$main::adframe->{dict}->{$k}->{descr}/g;
            		$c =~ s/#num#/$num/g;
         		} elsif (($spec eq 'min') && ($num > length($main::in{$k}))) {
            		$c .= $WRONG_MIN_LENGTH;
            		$c =~ s/#descr#/$main::adframe->{dict}->{$k}->{descr}/g;
            		$c =~ s/#num#/$num/g;
         		}
      		}
      		if (($main::in{$k} ne '') && ($t eq 'email'))
      		{
         		if (! ($main::in{$k} =~ /\S+\@\S+\.\S+/)) {
            		$c .= $NO_EMAIL;
            		$c =~ s/#descr#/$main::adframe->{dict}->{$k}->{descr}/g;
         		}
      		}
   	}
   	return $c;
}
sub _wrong_inputs {
	my $type = shift;
   	my $test = shift;
   	$test =~ s/\x0d//g;
   	$test =~ s/\n//g;
   	my ($collect, $x, $match, $chars) = '';
   	if ($type eq 'alphanum') {
      		$chars = " abcdefghijklmnopqrstuvwxyzäöüßABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ0123456789-_/.+=&(),!:*?\@'é`ú´";
   	} elsif ($type eq 'num') {
      		$chars = '0123456789.';
   	} elsif ($type eq 'ext_num') {
      		$chars = '0123456789-+/_*.,';
   	} elsif ($type eq 'email') {
      		$chars = '0123456789._-@abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
   	} elsif ($type eq 'unixchar') {
      		$chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-/.';
   	} else {
		return 0;
   	}
   	while ($x = chop($test)) {
      		$match = 0;
      		for ($i=0; $i<length($chars); $i++) {
         		$match = 1 if ($x eq substr($chars, $i, 1));
      		}
   		$collect .= $x if (! $match);
   	}
   	$collect =~ s/"/\\"/g;
   	return $collect;
}
sub alertRequestErrors
{
	@key = @_;
	if (@key ==())
	{
		@key = keys %{ $main::adframe->{dict} };
	}
	my $error = RequestFunctions::checkInputs(@key);
	if ($error ne '')
	{
		$main::adframe->showAlert($error);
		$main::adframe->setReplaceFromIn(@key);
		return 1;
	}
	return 0;
}
sub hasRequestContent
{
	my @hascontent 	= ();
	foreach (@_)
	{
		push(@hascontent,$_) if ($main::in{$_} ne '');
	}
	return @hascontent;
}