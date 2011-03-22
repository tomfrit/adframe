package ListADFRAME_USER_FOTOS;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_USER_FOTO_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,ADFRAME_USER_FOTOALBUM_ID,TITLE,TEXT,CREDIT,RIDER,SPOT,CITY,COUNTRY,ITEM_0,ITEM_1,ITEM_2,ITEM_3,URL,VIEWCOUNT,RANK,ALLOW_RATE,ALLOW_COMMENTS,CR_DATE,IS_ACTIVE';
$SQL_QUERY_COLS = 'ADFRAME_USER_FOTO_ID,ADFRAME_CHANNEL,ADFRAME_USER_ID,ADFRAME_USER_FOTOALBUM_ID,TITLE,TEXT,CREDIT,RIDER,SPOT,CITY,COUNTRY,ITEM_0,ITEM_1,ITEM_2,ITEM_3,URL,VIEWCOUNT,RANK,ALLOW_RATE,ALLOW_COMMENTS,year(CR_DATE),month(CR_DATE),dayofmonth(CR_DATE),hour(CR_DATE),minute(CR_DATE),IS_ACTIVE';
$QUAL = '!ADFRAME_USER_FOTO_ID!|!ADFRAME_CHANNEL!|!ADFRAME_USER_ID!|!ADFRAME_USER_FOTOALBUM_ID!|!TITLE!|!TEXT!|!CREDIT!|!RIDER!|!SPOT!|!CITY!|!COUNTRY!|!ITEM_0!|!ITEM_1!|!ITEM_2!|!ITEM_3!|!URL!|!VIEWCOUNT!|!RANK!|!ALLOW_RATE!|!ALLOW_COMMENTS!|!CR_DATE_YEAR!|!CR_DATE_MONTH!|!CR_DATE_DAY!|!CR_DATE_HOUR!|!CR_DATE_MINUTE!|!IS_ACTIVE!';

sub getADFRAME_USER_FOTOS
{
	my $this			= shift;
	my $condition		= shift;
	my $orderBy			= shift;
	my $start			= shift;
	my $limit			= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USER_FOTO_ID>0";
	
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
	my @data 	= $this->get('ADFRAME_USER_FOTOS',$SQL_QUERY_COLS,$sqlcondition); 
	return \@data;
}

sub getCountADFRAME_USER_FOTOS
{
	my $this			= shift;
	my $condition		= shift;
	my $sqlcondition	= '';
	
	$sqlcondition = "ADFRAME_USER_FOTO_ID>0";
	
	if ($condition ne '')
	{
		$sqlcondition = $condition;
	}
	return $this->get('ADFRAME_USER_FOTOS','count(*)',$sqlcondition);
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
	$this->{errormessage}.='ListADFRAME_USER_FOTOS: '.$mess.'\n';   
}

1;
__END__

=head1 NAME ListADFRAME_USER_FOTOS

=head2 extends DbAdapter

=head1 METHODS

getADFRAME_USER_FOTOS(String: condition, String: orderBy, Int: start, Int: limit)

getCountADFRAME_USER_FOTOS(String: condition)

getErrorMessage()