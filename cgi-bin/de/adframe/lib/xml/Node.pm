package Node;
use Exporter;
1;
$VERSION = "0.10";
@ISA = ('Exporter');
@EXPORT = qw (&register &parse &parsefile);

use XML::Parser;
use Carp;

my $instance = 0;
my @selves = ();
my $myinstance;

sub new
{
    my $class 	= shift;
    my $caller	= shift;
    my $self = { INSTANCE => $instance,	START_HANDLERS => {},END_HANDLERS => {}, CHAR_HANDLERS  => {}, ATTR_HANDLERS  => {}, CURRENT_TAG => "", CURRENT_PATH   => "", };
    bless $self, $class;
    $self->{caller}	= $caller;
    $selves[$instance++] = $self;
  
    return $self;
}

sub register
{
    $self = shift or croak "XML::Node --self is expected as THE first parameter \&register.\n";
    my $node = shift or croak "XML::Node --a node path is expected as arg1 in \&register.\n";
    my $type = shift or croak "XML::Node --node type is expected as arg2 in \&register.\n";
    my $handler = shift or croak "XML::Node --a handler is expected as arg3 in \&register.\n";
    if ($type eq "start") 
    {
		$self->{START_HANDLERS}->{$node} = $handler;
    } 
    elsif ($type eq "end") 
    {
		$self->{END_HANDLERS}->{$node} = $handler;
    } 
    elsif ($type eq "char") 
    { 
		$self->{CHAR_HANDLERS}->{$node} = $handler;
    } 
    elsif ($type eq "attr") 
    { 
		$self->{ATTR_HANDLERS}->{$node} = $handler;
    } 
    else 
    {
		croak "XML::Node --unknown handler type $type for node $node\n";
    }
}


sub parsefile
{
    $self 		= shift;
    my $xml_file 	= shift;

    $myinstance = $self->{INSTANCE};

	my $my_handlers = qq {
		sub handle_start_$myinstance
		{
		    &handle_start($myinstance, \@_);
		}
		sub handle_end_$myinstance
		{
		    &handle_end($myinstance, \@_);
		}
		sub handle_char_$myinstance
		{
		    &handle_char($myinstance, \@_);
		}
		\$parser = new XML::Parser(Handlers => { Start => \\& handle_start_$myinstance,
					End =>   \\& handle_end_$myinstance,
					Char =>  \\& handle_char_$myinstance } );

	};
    eval ($my_handlers);
    $parser->parsefile("$xml_file");
}

sub parse
{
    $self = shift or croak "XML::Node --self is expected as THE first parameter \&register.\n";

    $myinstance = $self->{INSTANCE};

	my $my_handlers = qq {
		sub handle_start_$myinstance
		{
		    &handle_start($myinstance, \@_);
		}
		sub handle_end_$myinstance
		{
		    &handle_end($myinstance, \@_);
		}
		sub handle_char_$myinstance
		{
		    &handle_char($myinstance, \@_);
		}
		\$parser = new XML::Parser(Handlers => { Start => \\& handle_start_$myinstance,
					End =>   \\& handle_end_$myinstance,
					Char =>  \\& handle_char_$myinstance } );
	};
 
    eval ($my_handlers);
    $parser->parse(shift);
}

sub handle_start
{
    my $myinstance 	= shift;
    my $p 			= shift;
    my $element 	= shift;
    
    my $current_path = $selves[$myinstance]->{CURRENT_PATH} = $selves[$myinstance]->{CURRENT_PATH} . ">" .  $element;
    my $current_tag = $selves[$myinstance]->{CURRENT_TAG} = $element;

    my $attr;
    my $value;

    while (defined ($attr = shift ) ) 
    {
		if (! defined ($value = shift)) 
		{
		    croak ("value for attribute [$attr] of element [$element] is not returned by XML::Parser\n");
		}
	
		my $attr_path = "$current_path:$attr";
	
		if ($selves[$myinstance]->{ATTR_HANDLERS}->{$attr_path}) 
		{
		    handle($p, $value, $selves[$myinstance]->{ATTR_HANDLERS}->{$attr_path});
		}
    }

    if ($selves[$myinstance]->{START_HANDLERS}->{$current_tag}) 
    {
		handle($p, $element, $selves[$myinstance]->{START_HANDLERS}->{$current_tag});
    }
    if ($selves[$myinstance]->{START_HANDLERS}->{$current_path}) 
    {
		handle($p, $element, $selves[$myinstance]->{START_HANDLERS}->{$current_path});
    }
}

sub handle_end
{
    my $myinstance = shift;
    my $p = shift;
    my $element = shift;
    
    $selves[$myinstance]->{CURRENT_TAG} = $element;

    if ($selves[$myinstance]->{END_HANDLERS}->{$selves[$myinstance]->{CURRENT_TAG}}) 
    {
		handle($p, $element, $selves[$myinstance]->{END_HANDLERS}->{$selves[$myinstance]->{CURRENT_TAG}});
    }
    if ($selves[$myinstance]->{END_HANDLERS}->{$selves[$myinstance]->{CURRENT_PATH}}) 
    {
		handle($p, $element, $selves[$myinstance]->{END_HANDLERS}->{$selves[$myinstance]->{CURRENT_PATH}});
    } 
    
    $selves[$myinstance]->{CURRENT_PATH} =~ /(.*)>/;
    $selves[$myinstance]->{CURRENT_PATH} = $1;
    $selves[$myinstance]->{CURRENT_TAG}  = $';
    
    if ($element ne $selves[$myinstance]->{CURRENT_TAG}) 
    {
		carp "start-tag <$selves[$myinstance]->{CURRENT_TAG}> doesn't match end-tag <$element>. Is this XML file well-formed?\n";
    }
    $selves[$myinstance]->{CURRENT_PATH} =~ /(.*)>/;
    $selves[$myinstance]->{CURRENT_TAG}  = $';
}

sub handle_char
{
    my $myinstance = shift;
    my $p = shift;
    my $element = shift;

    if ($selves[$myinstance]->{CHAR_HANDLERS}->{$selves[$myinstance]->{CURRENT_TAG}}) 
    {
		handle($p, $element, $selves[$myinstance]->{CHAR_HANDLERS}->{$selves[$myinstance]->{CURRENT_TAG}});
    }
    if ($selves[$myinstance]->{CHAR_HANDLERS}->{$selves[$myinstance]->{CURRENT_PATH}}) 
    {
		handle($p, $element, $selves[$myinstance]->{CHAR_HANDLERS}->{$selves[$myinstance]->{CURRENT_PATH}});
    }
}

sub handle
{
    my $p = shift;
    my $element = shift;
    my $handler = shift;

    my $handler_type = ref($handler);
    if ($handler_type eq "CODE") 
    {
		&$handler($p,$element);
    } 
    elsif ($handler_type eq "SCALAR")  
    {

		if (! defined $$handler) 
		{
	    	$$handler = "";
		}
		
		$$handler = $$handler . $element;
    } 
    else 
    {
		carp "XML::Node -unknown handler type [$handler_type]\n";
		exit;
    }
}
1;
