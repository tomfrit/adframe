package Resizer;
use GD;
1;

sub new {
	my $type	= shift;
	my $self	= {};
	bless $self,$type;
	return $self;
}


sub setSourceDirectory {
	my $self	= shift;
	$self->{sourceDirectory}	= shift;
	$self->{sourceDirectory}	=~ s/^\.\.//;
	$self->{sourceDirectory}	= $ENV{ADFRAME_DOC_PATH}.$self->{sourceDirectory};
	$self->{destDirectory}		= $self->{sourceDirectory} if(!$self->{destDirectory});
}

sub setSourceImage {
	my $self 				= shift;
	$self->{sourceImage}	= shift;
}

sub setDestDirectory {
	my $self				= shift;
	$self->{destDirectory}	=~ s/^\.\.//;
	$self->{destDirectory}	= $ENV{ADFRAME_DOC_PATH}.shift;
}

sub setDestImage {
	my $self			= shift;
	$self->{destImage}	= shift;
	$self->{destImage}	=~ s/(\.jpe?g)|(\.png)|(\.gif)//i;
}

sub setSize {
	my $self 	= shift;
	($self->{nWidth},$self->{nHeight})	= split(/x/,shift);
	$self->{nFactor} = $self->{nHeight} / $self->{nWidth} if($self->{nHeight}>0 && $self->{nWidth}>0);
}

sub deleteOriginal {
	my $self = shift;
	unlink("$self->{sourceDirectory}/$self->{sourceImage}") or logger($!);
}

sub setMode {
	my $self		= shift;
	$self->{mode}	= shift;
}

sub resize {
	my $self			= shift;
	$self->_openImage();
	if (!$self->{nHeight} || !$self->{nWidth} || $self->{mode} ne 'crop') {

 		if (!$self->{nHeight} && !$self->{nWidth}) {
 			return $self->_renameOriginal();
 		}

  		if (!$self->{nWidth}) {
  			if ($self->{nWidth} < $self->{oHeight}) {
  				$self->{nWidth} = int($self->{nHeight} / $self->{oFactor});
  			}
  			else {
  				return $self->_renameOriginal();
  			}
  		}
  		elsif (!$self->{nHeight}) {
  			if ($self->{nWidth} < $self->{oWidth}) {
  				$self->{nHeight} = int($self->{nWidth} * $self->{oFactor});
  			}
  			else {
  				return $self->_renameOriginal();
  			}
  		}
  		else {
  			if(($self->{nHeight}<$self->{oHeight}) || ($self->{nWidth}<$self->{oWidth})) {
  				if ($self->{oFactor} > 1) {
  					$self->{nWidth} = int($self->{nHeight} / $self->{oFactor});
  				}
  				else
  				{
  					$self->{nHeight} = int($self->{nWidth} * $self->{oFactor});
  				}
  			}
  			else {
  				return $self->_renameOriginal();
  			}
  		}
  		$self->{nImage} = newTrueColor GD::Image($self->{nWidth},$self->{nHeight});
  		$self->{nImage}->copyResampled($self->{oImage},0,0,0,0,$self->{nWidth},$self->{nHeight},$self->{oWidth},$self->{oHeight});

  	}
  	else {
  		if ($self->{nWidth} < $self->{oWidth} || $self->{nHeight} < $self->{oHeight}) {

  			$self->{nImage} = newTrueColor GD::Image($self->{nWidth},$self->{nHeight});

  			if ($self->{oFactor} >= $self->{nFactor}) {

  				$temp_height = int($self->{oWidth}*$self->{nFactor});
				$offset = ($self->{oHeight}-$temp_height)/2;
				$self->{nImage}->copyResampled($self->{oImage},0,0,0,$offset,$self->{nWidth},$self->{nHeight},$self->{oWidth},$temp_height);

  			}
  			else {

  				$temp_width = int($self->{oHeight}/$self->{nFactor});
  				$offset = ($self->{oWidth} - $temp_width)/2;
			 	$self->{nImage}->copyResampled($self->{oImage},0,0,$offset,0,$self->{nWidth},$self->{nHeight},$temp_width,$self->{oHeight});
  			}
  		}
  		else {
  			return $self->_renameOriginal();
  		}

  	}
  	$self->_saveImage();


	return "$self->{destImage}.jpg";

}

sub _saveImage {
	my $self	= shift;
  	$output		= $self->{nImage}->jpeg(60);
	open(file,">$self->{destDirectory}/$self->{destImage}.jpg");
	binmode file;
	print file $output;
	close(file);
	chmod 0777,"$self->{destDirectory}/$self->{destImage}.jpg";
}

sub _renameOriginal {
	my $self			= shift;
	$self->{nImage} 	= newTrueColor GD::Image($self->{oWidth},$self->{oHeight});
	$self->{nImage}->copy($self->{oImage},0,0,0,0,$self->{oWidth},$self->{oHeight});
	$self->_saveImage();
	return "$self->{destImage}.jpg";
}

sub _getName {
	my $self	= shift;
	$file		= shift;
	$file 		=~ /^(.*?)\.?([^\.]*)$/;
	return ($1,$2);
}

sub _openImage {
	my $self	= shift;
	open($OLD_IMG,"$self->{sourceDirectory}/$self->{sourceImage}");
	GD::Image->trueColor(1);
	$self->{oImage} = new GD::Image($OLD_IMG);
	close($OLD_IMG);
	($self->{oWidth},$self->{oHeight}) = $self->{oImage}->getBounds();
  	$self->{oFactor} = $self->{oHeight} / $self->{oWidth};
}