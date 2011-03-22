package rssWriter;
use de::adframe::components::mcms::gen::ListADFRAME_MCMS;
use de::adframe::lib::db::DbAdapter;
use POSIX qw(strftime);
use open IO => ':utf8';
1;
sub new
{
	my $class			= shift;
	my $this			= {};
	bless $this,$class;
	$this->{errormessage}	= '';
	return $this;
}
sub writeFeed
{

	my $now = time();
	my $rfc822_date = strftime("%a, %d %b %Y %H:%M:%S +0100", localtime($now));

	open (FEED, ">../$ENV{ADFRAME_CHANNEL}.rss");
	print FEED "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
	print FEED "<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n";
	print FEED "<channel>\n";
	print FEED "\t<title>$ENV{ADFRAME_SERVER_NAME}</title>\n";
	print FEED "\t<description>$ENV{RSS_DESCRIPTION}</description>\n";
	print FEED "\t<link>http://$ENV{ADFRAME_SERVER_NAME}/</link>\n";
	print FEED "\t<language>de-de</language>\n";
	print FEED "<atom:link href=\"http://$ENV{ADFRAME_SERVER_NAME}/$ENV{ADFRAME_CHANNEL}.rss\" rel=\"self\" type=\"application/rss+xml\" />\n";


	print FEED "\t<pubDate>$rfc822_date</pubDate>\n";


	my $cond	= "ADFRAME_CHANNEL='$ENV{ADFRAME_CHANNEL}' and (AREA like 'mcms_group%' or AREA like 'blog') AND P_STATUS>0";
	my $db		= new DbAdapter;
	my $list 	= new ListADFRAME_MCMS;
	my $items	= $list->getADFRAME_MCMS($cond,'CR_DATE desc',0,50);
	my @itemArr 	= @{$items};

	my @itemRet	= ();
	for (my $i=0;$i<=$#itemArr;$i++) {
		my @h = split(/\|/,$itemArr[$i]);

		my $rfcdate = $db->get('ADFRAME_MCMS',"DATE_FORMAT(CR_DATE,'%a, %d %b %Y %T')","ADFRAME_MCMS_ID = $h[0]");
		print FEED "\t<item>\n";
		print FEED "\t\t<title><![CDATA[$h[13]\n]]></title>\n";
		print FEED "\t\t<category>$h[3]</category>\n";

		print FEED "\t\t<description><![CDATA[\n";
		print FEED "\t\t<a href=\"http://$ENV{ADFRAME_SERVER_NAME}/$h[3]/$h[0]/$h[86]\" target=\"_blank\"><img src=\"http://$ENV{ADFRAME_SERVER_NAME}/cms/$h[3]/img/$h[29]\"></a><br>\n";
		print FEED "$h[44]\n]]></description>\n";
		print FEED "\t\t<link>http://$ENV{ADFRAME_SERVER_NAME}/$h[3]/$h[0]/$h[86]</link>\n";
		print FEED "\t\t<guid>http://$ENV{ADFRAME_SERVER_NAME}/$h[3]/$h[0]/$h[86]</guid>\n";
		print FEED "\t\t<author>$h[10] ($h[9])</author>\n";
		print FEED "\t\t<pubDate>$rfcdate +0100</pubDate>\n";
		print FEED "\t</item>\n";
	}
	print FEED "</channel>\n";
	print FEED "</rss>";
	close (FEED);
}