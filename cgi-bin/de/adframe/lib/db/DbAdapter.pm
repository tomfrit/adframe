# DbAdapter DBI Version 20100721

package DbAdapter;
use DBI;
1;
sub new
{
	my $type		= shift;
	my $dbHost		= shift;
	my $dbName		= shift;
	my $dbUser		= shift;
	my $dbPass		= shift;
	my $self		= {};
	bless $self, $type;
	$self->{dbh}	= $main::adframe->getFromSession('DBCONNECTION') if (ref $main::adframe);
	if (! ref $self->{dbh})
	{
		$dbHost			= $ENV{ADFRAME_MYSQL_HOST} if ($dbHost eq '');
		$dbName			= $ENV{ADFRAME_MYSQL_NAME} if ($dbName eq '');
		$dbUser			= $ENV{ADFRAME_MYSQL_USER} if ($dbUser eq '');
		$dbPass			= $ENV{ADFRAME_MYSQL_PASS} if ($dbPass eq '');
		$self->{dbh}	= DBI->connect('DBI:mysql:'.$dbName.':'.$dbHost,$dbUser,$dbPass);
		$self->{dbh}->{mysql_enable_utf8} = 1;$self->{dbh}->do("set names 'utf8';");
		$main::adframe->setToSession('DBCONNECTION',$self->{dbh}) if (ref $main::adframe);

	}
	return $self;
}
sub query
{
	my $self		= shift;
   	my $sqlquery	= shift;
	my $sth			= 0;
	my @row			= ();
	my @ret			= ();
   	if ($sth = $self->{dbh}->prepare($sqlquery))	{
		$sth->execute();
		$" = '|';
		while (@row = $sth->fetchrow_array) {
			push(@ret, "@row");
		}
		$sth->finish();
		return (wantarray ? @ret : $ret[0]);
   	}
   	else
   	{
    	return 0;
   	}
}
sub get
{
	my $self		= shift;
	my $table		= shift;
	my $col			= shift;
   	my $condition 	= shift;
   	my $query		= '';
	my @row			= '';
	my @ret			= ();
	my $sth			= 0;
   	if ($condition ne '')
   	{
    	$query = "select $col from $table where $condition";
   	}
   	else
   	{
      	$query = "select $col from $table";
   	}
  	main::logger($query);


   	if ($sth = $self->{dbh}->prepare($query)) {
		$sth->execute();
		$" = '|';
		while (@row = $sth->fetchrow_array) {
			push(@ret, "@row");
		}
		$sth->finish();
		return (wantarray ? @ret : $ret[0]);
	}
	else	{
		main::logger($query);
		return 0;
	}
}

sub insert
{
	my $self	= shift;
   	my $table 	= shift;
   	my $col 	= shift;
   	my $query	= undef;
	my $sth		= 0;
   	$" = ',';
   	if ($col ne '')
   	{
    	$query = "insert into $table ($col) values (@_)";
   	}
   	else
   	{
    	$query = "insert into $table values (@_)";
   	}
	main::logger($query);
   	if ($sth = $self->{dbh}->prepare($query)) {
		$sth->execute();
   		my $sth = $self->{dbh}->prepare("select last_insert_id() from $table");
		$sth->execute();
		return $sth->fetchrow();
   	}
   	else {
   		main::logger($query);
		return 0;
   	}
}
sub replace
{
	my $self	= shift;
   	my $table 	= shift;
   	my $col 	= shift;
   	my $query	= undef;
	my $sth		= 0;
   	$" = ',';
   	if ($col ne '')
   	{
    	$query = "replace into $table ($col) values (@_)";



 	 }
   	else
   	{
    	$query = "replace into $table values (@_)";

   	}
   	main::logger($query);
   	if ($sth = $self->{dbh}->query($query))
   	{
    	return 1;
   	}
   	else
   	{
    	return 0;
   	}
}
sub update
{
	my $self	= shift;
   	my $table 	= shift;
   	my $col		= shift;
   	my $condition 	= shift;
   	my $query	= undef;
	my $sth		= 0;
   	$" = ',';

   	if ($condition)
   	{
    	$query = "update $table set $col where $condition";
    	#main::debug($query);
   	}
   	else
   	{
    	$query = "update $table set $col";
   	}
   	main::logger($query);
   	if ($sth = $self->{dbh}->prepare($query)) {
		$sth->execute();
		$sth->finish();
		return 1;
   	}
   	else {
   		main::logger($query);
    	return 0;
   	}
}
sub delete
{
	my $self		= shift;
	my $table      	= shift;
	my $condition  	= shift;
   	my $query		= '';
	my $sth			= 0;
	if ($condition)
	{
		$query = "delete from $table where $condition";
	}
	else
	{
		$query = "delete from $table";
	}
   	if ($sth = $self->{dbh}->prepare($query)) {
		$sth->execute();
		$sth->finish();
		return 1;
   	}
   	else {
   		main::logger($query);
		return 0;
   	}
}
sub setBigSqlTables
{
	my $self = shift;
	$self->{dbh}->query("set SQL_BIG_TABLES=1");
}
sub getErrorMessage
{
	my $self	= shift;
	my $error_message 	= $self->{dbh}->errmsg;
	my $error_number 	= $self->{dbh}->errno;
	return "$error_message: $error_number";
}