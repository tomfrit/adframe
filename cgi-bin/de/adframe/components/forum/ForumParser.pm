package ForumParser;
use Text::Wrap;
	

1;
sub new
{
	my $class			= shift;
	my $this			= {};
	bless $this,$class;
	$this->{errormessage}	= '';
	return $this;
}

sub setWidth
{
	my $this	= shift;
	$this->{width}	= shift;
}


sub parseText
{
	my $this	= shift;
	my $text	= shift;
	$this->{width}	= 520 if(!$this->{width});
	$imageWidth	= $this->{width}.'px';
	
	$Text::Wrap::columns = int($this->{width}/5);
	
	$text		=~ s/^www\.([^\s^<]+)/ http:\/\/www\.$1\ /gis;
	$text		=~ s/\swww\.([^\s^<]+)/ http:\/\/www\.$1\ /gis;
	$text		=~ s/[^\]]http:\/\/([^\s^<]+)/ <a href=\"http:\/\/$1\" target=\"_blank\">$1<\/a> /gis;
		
	$text		=~ s/\[IMG\](http:\/\/)?([^\s^<]+)\[\/?IMG\]/<div style=\"width:$imageWidth;overflow:hidden;\"><img src=\"http:\/\/$2\" border=\"0\"><\/div>/gis;
		
	$text		=~ s/\[URL\](http:\/\/)?([^\s^<]+)\[\/?URL\]/<a href=\"http:\/\/$2\" target=\"_blank\">http:\/\/$2<\/a>/gis;	
				
	$text		=~ s/\[\/quote\]/<\/div>/isg;
	
	$text		=~ s/\[quote=([^\]]+)?\]/<div class=\"quote\"><b>Zitat $1:<\/b><br> /isg;
	
	$text		= wrap("","",$text);
	
	#main::debug($text);
	
	return $text;
	
}