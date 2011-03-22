sub parseMultiPart
{
	use CGI;
	use IO::Handle;
	use Encode;
	
	$CGITempFile::TMPDIRECTORY = $ENV{ADFRAME_TMP_FILES};
	$CGI::POST_MAX=1024 * 1024 * 5;
	$CGI::PARAM_UTF8=1;
	my $cgi = new CGI;
	foreach $key ($cgi ->param) {
  		
  		$upload = $cgi->upload($key);
  		if(defined $upload) {
  			my $file=$cgi->param($key);
			binmode $upload;
			while ( <$upload> )
			{
				$main::in{$key} .= $_;
			}
			$main::inct{$key} = $cgi->uploadInfo($file)->{'Content-Type'};
  		}
  		else {
  			@val = $cgi->param($key);
			foreach (@val) {
				#$_ = decode("UTF-8",$_);
			}
			#$key = decode("UTF-8",$key);
			if (scalar @val == 1) {   
				$main::in{$key} = $val[0];
 			} 
 			else {                      
   		 		$main::in{$key} = \@val;  # save value as an array ref
  			}
		}	
		

	}
}
1;