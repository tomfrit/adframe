package HttpUploader;
1;
$UPLOADHEADER{'mp3'}	= "audio\/mpeg";
$UPLOADHEADER{'wav'}	= "audio\/wav, audio\/x-rmf";
$UPLOADHEADER{'gif'}	= "image\/gif";
$UPLOADHEADER{'jpg'}	= "image\/jpeg, image\/jpg, image\/pjpeg";
$UPLOADHEADER{'png'}	= "image\/png";
$UPLOADHEADER{'mov'}	= "video/quicktime";

sub new
{
	my $type	= shift;
	my $self	= {};
	bless $self,$type;
	return $self;
}
sub storeImage
{
	my $self			= shift;
	my $storePath		= shift;
	my $filename		= shift;
	my $data			= shift;
	my $file_ext		= 'jpg';

	if ($data =~ /GIF/i)
	{
		$file_ext = 'gif';
	}	
	if ($data =~ /PNG/i)
	{
		$file_ext = 'png';
	}
	if ($data =~ /^FLV/)
	{
		$file_ext = 'flv';
	}
	if (($data =~ /moov/) && ($data =~ /lmvhd/))
	{
		$file_ext = 'mov';
	}	
	if ($data ne '')
	{
	
		$filename.='.'.$file_ext;
		if (open (HI, ">$storePath/$filename"))
		{
			binmode HI;
			print HI $data;
			close(HI);
			chmod(0777,"$storePath/$filename");
			
			return $filename;
		}
		else
		{
			return '';
		}
	}
	return '';
}
sub checkFileFormat
{
	my $self		= shift;
	my $key		= shift;
	my $ftype	= shift;
	if (defined $UPLOADHEADER{$ftype})
	{
		if ($UPLOADHEADER{$ftype}  =~ /$main::inct{$key}/i)
		{
			return 1;
		}
	}
	return 0;
}
sub createFileExtension
{
	my $self	= shift;
	my $key		= shift;
	my $ok		= 0;
	foreach $k (keys %UPLOADHEADER)
	{
		if ($self->checkFileFormat($key,$k))
		{
			$self->{$key}->{extension} = $k;
			$ok = 1;
			last;
		}
	}
	return $ok;
}
sub storeFile
{
	my $self	= shift;
	my $key		= shift;
	my $path	= shift;
	my $fname	= shift;
	if ($self->createFileExtension($key))
	{
		if ($main::in{$key} ne '')
		{
		
			if (open(BINFILE,">$path/$fname".".$self->{$key}->{extension}"))
			{
				print BINFILE $main::in{$key};
				close(BINFILE);
				$self->{$key}->{filename} = $fname.'.'.$self->{$key}->{extension};
				return 1;
			}
		}
	}
	return 0;
}
sub getFileExtension
{
	my $self	= shift;
	my $key		= shift;
	return $self->{$key}->{extension};
}
sub getFullFilename
{
	my $self	= shift;
	my $key		= shift;
	return $self->{$key}->{filename};
}

sub resize
{
	my $self				= shift;
	my $storePath			= shift;
	my $dbTempName		= shift;
	my $imgfilename		= shift;
	my $imgSize			= shift;
	my $del				= shift;
	my $crop				= shift;
	use GD;
	
	
	
	my($image, $x, $height, $width, $new_height, $new_width, $temp_height, $fuck_n);
	
	open($OLD_IMG,"$storePath/$dbTempName");
		
		
		
	my @size = split(/x/,$imgSize);
	$new_height = $size[1];
  	$new_width = $size[0];
	
	
	GD::Image->trueColor(1);
	
	$image = new GD::Image($OLD_IMG);
	
	
  	
  	close($OLD_IMG);
  	
  	
  	
  	
  	
  	($width,$height) = $image->getBounds();
  	my $fuck_o = $height / $width;
  	
  	
	if (!$new_height || !$new_width || $crop eq 'no') { 
 	
 		if (!$new_height && !$new_width) { 
 			$this->file_rename($storePath,$dbTempName,$imgfilename);
 			return $imgfilename; 
 			
 		}
 		
  		if (!$new_width) { 
  			if ($new_height < $height) { $new_width = int($new_height / $fuck_o); }
  			else { $self->file_rename($storePath,$dbTempName,$imgfilename);return $imgfilename; }
  		}
  		elsif (!$new_height) { 
  			if ($new_width < $width) { $new_height = int($new_width * $fuck_o); }
  			else { $self->file_rename($storePath,$dbTempName,$imgfilename);return $imgfilename; }
  		}
  		else {
  			if(($new_height<$height) || ($new_width<$width)) 
  			{
  				#$fuck_n = $new_height / $new_width;
  				if ($fuck_o > 1)
  				{
  					$new_width = int($new_height / $fuck_o);
  				}
  				else
  				{
  					$new_height = int($new_width * $fuck_o);
  				}
  			}
  			else { $self->file_rename($storePath,$dbTempName,$imgfilename);return $imgfilename; }
  		}
  		#main::debug($new_width,$new_height,$fuck_o,$
  		$bild = newTrueColor GD::Image($new_width,$new_height);
  		$bild->copyResampled($image,0,0,0,0,$new_width,$new_height,$width,$height);
  		
  		

  	}
  	else {
  		if ($new_width < $width || $new_height < $height) {
  			
  			$fuck_n = $new_height / $new_width;
  			$bild = newTrueColor GD::Image($new_width,$new_height);
  		
  			if ($fuck_o >= $fuck_n) {
  		
  				$temp_height = int($width*$fuck_n);
				$offset = ($height-$temp_height)/2;

  				$bild->copyResampled($image,0,0,0,$offset,$new_width,$new_height,$width,$temp_height);
  			
  			}
  			else {
  			
  				$temp_width = int($height/$fuck_n);
  				$offset = ($width - $temp_width)/2;
			 
			
  				$bild->copyResampled($image,0,0,$offset,0,$new_width,$new_height,$temp_width,$height);
  				
  			
  			}
  		}
  		else { $self->file_rename($storePath,$dbTempName,$imgfilename);return $imgfilename; }
  	
  	}

        
  	#$new_name = $name[0]."_".$new_width."x".$new_height.".".$name[1];
  	
  	$output=$bild->jpeg(60);
	open(file,">$storePath/$imgfilename");
	binmode file;
	print file $output;
	close(file);
	chmod 0777,"$storePath/$imgfilename";
	unlink("$storePath/$dbTempName") if ($del eq 'yes');
	
	return $imgfilename;

}

sub file_rename
{
	use File::Copy;
	my $self	= shift;
	my $storePath	= shift;
	my $oldName	= shift;
	my $newName	= shift;
	
	copy("$storePath/$oldName","$storePath/$newName");
	return $newName;
	
	
}