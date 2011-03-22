package cut;
1;


sub cut {
	my $line 	= shift;
	my $laenge 	= shift;
	my $res;
	my $val		= 0;

$line =~ s/<(?:[^>'"]*|(['"]).*?\1)*>//gs;

	foreach my $string (split / /, $line) {
		my $len = 0;


		$len = length($string);


		$val = $val+$len+1;
		if ($val <= $laenge) {
			$res .= $string." ";

		}
	}
	$res .= " ..." if (length($line) > $laenge);
	#$res .= length($line);
#main::debug(length($line),$line,$res,$laenge);
return $res;
}