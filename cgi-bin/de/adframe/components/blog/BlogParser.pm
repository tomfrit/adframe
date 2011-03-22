package BlogParser;
$MAX_IMAGE_WIDTH = 480;
$FLOAT_IMAGE_WIDTH = 210;
1;
sub new
{
	my $class			= shift;
	my $this			= {};
	bless $this,$class;
	$this->{errormessage}	= '';
	return $this;
}

sub parseText
{
	my $this	= shift;
	my $text	= shift;
	
	my @code;
	@urls = $text =~ /\[\[(([^\[\]])*)$\]\]/gis;
	
	
	for (my $count=0;$count<=$#urls;$count++) {
		
		$code[$count] = $this->getLink($urls[$count]);
		$urls[$count] =~ s/([?])/\\$1/g;
		$text =~ s/\[\[$urls[$count]\]\]/$code[$count]/gis;
	}
	return $text;	
}


sub getLink
{
	my $this	= shift;
	my $url		= shift;
	
	$url 	=~ s/&#x7c;/\|/g;
	($link,$bu,$width,$float) = split(/\|/,$url);
	
	#main::debug($url,$width);
	if ($link =~ /.jpg|.png|.gif/) {
		my $imagepath = '/cms/blog/img';
		$UPLOADPATH	= "$ENV{ADFRAME_DOC_PATH}".$imagepath;
		my ($pre,$suf) = split(/\./,$link);
		my $image_name	= $pre.'_'.$width.'.'.$suf;
		
		$width = $MAX_IMAGE_WIDTH if ($width > $MAX_IMAGE_WIDTH);
		
		if (-e $UPLOADPATH.'/'.$link) {
		
			if (!-e $UPLOADPATH.'/'.$image_name) {
				use de::adframe::lib::io::HttpUploader;
				my $uploader 		= new HttpUploader();
				my $image_generated	= $uploader->resize($UPLOADPATH,$link,$image_name,$width);
			}
		}
		else { $image_name = 'DEFIMG_0.gif'; }
		$float = $float || 'left';
		
		if($width <= $FLOAT_IMAGE_WIDTH && $float =~ /left|right/) {
			my $margin = ($float eq 'left') ? '3px 10px 3px 0px' : '10px 0 10px 10px'; 
			$linker_start 	= '<div style="width:'.$width.';float:'.$float.';margin:'.$margin.';">';
			$linker_end	= '</div>';
		}
		elsif ($float =~ /middle|center|centre/) {
			$linker_start 	= '<p><div style="text-align:center;">';
			$linker_end	= '</div></p>';
		
		}
		else {
			$linker_start 	= '<div style="margin:10px 0">';
			$linker_end	= '</div>';
		}
		return $linker_start.'<img src="'.$imagepath.'/'.$image_name.'" alt="fbmximg" /><br><span class="contentmini" style="font-weight:normal">'.$bu.'</span>'.$linker_end;
	}
	elsif ($link =~ /http:\/\//) { return "<a href=\"".$link."\" target=\"_blank\">".$bu."</a>"; }
	else { return '<a href="/cgi-bin/adframe/'.$link.'">'.$bu.'</a>'; }


}