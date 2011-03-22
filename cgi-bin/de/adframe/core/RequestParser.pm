# RequestParser Version 20101104 UTF-8, CGI

package RequestParser;
use Encode;
use CGI;
1;
sub new
{
	my $type		= shift;
	my $self		= {};
	my $key;
	my $val;
	*in				= {};
	bless $self, $type;
	$len = $ENV{'CONTENT_LENGTH'};
	$self->{error}	= '';
	$perlwarn = $^W;
	$^W = 0;
	binmode(STDIN);   # we need these for DOS-based systems
	binmode(STDOUT);  # and they shouldn't hurt anything else
  	binmode(STDERR);

  	if($ENV{'CONTENT_TYPE'} !~ m#^multipart/form-data#) {
  		my $cgi = new CGI;
		$CGI::PARAM_UTF8=1;
		foreach my $key ($cgi ->param) {
  			my @val = $cgi->param($key);
			foreach (@val) {
				$_ = decode("UTF-8",$_);
			}
			$key = decode("UTF-8",$key);
			if (scalar @val == 1) {
				$main::in{$key} = $val[0];
 			}
 			else {
   		 		$main::in{$key} = \@val;  # save value as an array ref
  			}
		}
	}
	else {
		require 'de/adframe/core/MultipartParser.pm';
		parseMultiPart();
  	}
  	return $self;
}
sub getRequestParam
{
	my $self	= shift;
	return $self->{in};
}
1;