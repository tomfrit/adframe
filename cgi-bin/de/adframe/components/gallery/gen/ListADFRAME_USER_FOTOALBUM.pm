package ListADFRAME_USER_FOTOALBUM;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USER_FOTOALBUM_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,TITLE,TEXT,COUNT,VIEWCOUNT,TITLE_IMG,RANK,UP_DATE,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_USER_FOTOALBUM_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,TITLE,TEXT,COUNT,VIEWCOUNT,TITLE_IMG,RANK,UP_DATE,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_USER_FOTOALBUM_ID!|!ADFRAME_CHANNEL!|!ADFRAME_USER_ID!|!TITLE!|!TEXT!|!COUNT!|!VIEWCOUNT!|!TITLE_IMG!|!RANK!|!UP_DATE!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_USER_FOTOALBUM
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USER_FOTOALBUM_ID>0";
	
	if ($condition ne '') 
	{
		$sqlcondition = ' '.$condition;
	}
	if ($orderBy ne '')
	{
		$sqlcondition.= " order by $orderBy";
	}
	if ($start>=0 && $limit>0)
	{
		$sqlcondition.=" limit $start,$limit"; 
	}
	my @data 	= $this->get('ADFRAME_USER_FOTOALBUM',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_USER_FOTOALBUM
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USER_FOTOALBUM_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_USER_FOTOALBUM','count(*)',$sqlcondition);
}

sub getErrorMessage
{
	my $this	= shift;
	return $this->{errormessage};
}

# private:
sub addErrorMessage
{
	my $this	= shift;
	my $mess	= shift;
	$this->{errormessage}.='ListADFRAME_USER_FOTOALBUM: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_USER_FOTOALBUM

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_USER_FOTOALBUM(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_USER_FOTOALBUM(String: condition)

getErrorMessage()