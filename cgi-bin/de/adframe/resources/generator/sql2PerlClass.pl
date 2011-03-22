#!C:\Perl\bin\perl.exe

use lib 'C:/www/motox/cgi-bin';
use de::adframe::resources::generator::SqlClassGenerator;

my $sqlfile = $ARGV[0];
my $outdir  = $ARGV[1];


if (($sqlfile !~ /\.sql/) || (! -e $outdir))
{
	die "Usage: ./de/adframe/resources/generator/sql2PerlClass.pl [Sql-File] [outputdir]\n"; 
}

my @tablelist = extractTableList($sqlfile);

my $generator = new SqlClassGenerator();

foreach my $tablename (@tablelist)
{
	my $generator = new SqlClassGenerator();
	
	$generator->setTablename($tablename);
	$generator->setGenPath($outdir);
	if ($generator->loadSqlFile($sqlfile))
	{
		if ($generator->process())
		{
			if (open(HB, ">$outdir/Class$tablename".'.pm'))
			{
				print HB $generator->getGeneratedClass();
				close(HB);
			}
			else
			{
				die "Cannot open $outdir/Class$tablename".'.pm for writing'; 
			}
			if (open(HB, ">$outdir/Cache$tablename".'.pm'))
			{
				print HB $generator->getGeneratedCacheClass();
				close(HB);
			}
			else
			{
				die "Cannot open $outdir/Cache$tablename".'.pm for writing'; 
			}			
			if (open(HBL, ">$outdir/ClassList$tablename".'.pm'))
			{
				print HBL $generator->getGeneratedClassList();
				close(HBL);
			}
			else
			{
				die "Cannot open $outdir/ClassList$tablename".'.pm for writing'; 
			}
			if (open(HBA, ">$outdir/List$tablename".'.pm'))
			{
				print HBA $generator->getGeneratedList();
				close(HBA);
			}
			else
			{
				die "Cannot open $outdir/List$tablename".'.pm for writing'; 
			}
			if (open(HBA, ">$outdir/CacheList$tablename".'.pm'))
			{
				print HBA $generator->getGeneratedCacheList();
				close(HBA);
			}
			else
			{
				die "Cannot open $outdir/CacheList$tablename".'.pm for writing'; 
			}		
		}
		else
		{
			print $generator->getErrorMessage();
		}
	}
	else
	{
		die "Cannot load Sql-File $sqlfile\n";
	}
}

sub extractTableList
{
	my $file = shift;
	my @lines = ();
	my @tables	= ();
	if (open(HA,$file))
	{
		@lines = <HA>;
		close(HA);
		foreach my $k (@lines)
		{
			if ($k =~ /create\s+table\s+(.*?)\s.*?\#\s*generate/i)
			{
				my $tname = $1;
				push(@tables,$tname);
			}
		}
	}

	return @tables;
}
