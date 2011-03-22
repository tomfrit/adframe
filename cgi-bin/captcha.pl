#!/usr/bin/perl -w
use GD;

my $code = $ENV{'QUERY_STRING'};

print "Content-type: image/gif\n\n";

my $image = new GD::Image(55,20);
my $white = $image->colorAllocate(255,254,237);

my $black = $image->colorAllocate(0,0,0);

$image->string(gdGiantFont,6,2,$code,$black);

#$image->line(1,1,30,30,$black);
#$image->line(30,1,1,50,$black);
print $image->gif;

exit(0);