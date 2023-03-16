use DBIx::Connection;
my $connection = DBIx::Connection->new(
  name                 => 'my_connection_name',
  dsn                  => '',
  username             => '',
  password             => '',
  
);

#gets connection by name.
my $connection = DBIx::Connection->connection('my_connection_name');
my $cursor = $connection->query_cursor(sql => "select * from emp where deptno > ?", name => 'emp_select');
my $dataset = $cursor->execute(['20']);
while ($cursor->fetch) {
    #do some stuff ...
    print $_ . " => " . $dataset->{$_}
      for keys %$dataset;
	print "\n";  
}

print "-------------------\n";
 
my $sql_handler = $connection->sql_handler(sql => "INSERT INTO emp(empid, deptno, empname) VALUES(?, ?, ?)", name => 'emp_ins');
$sql_handler->execute(5, 10, 'Smith');
$sql_handler->execute(6, 50, 'Witek'); 


my $cursor = $connection->query_cursor(sql => "select * from emp where deptno = ?", name => 'emp_select1');
my $dataset = $cursor->execute(['10']);
while ($cursor->fetch) {
    #do some stuff ...
    print $_ . " => " . $dataset->{$_}
      for keys %$dataset;
	  print "\n";  
}
 
# returns connection to connection pool
$connection->close();

#preserving resource by physical disconnecting all connection that are idle by defined threshold (sec).
$DBIx::Connection::IDLE_THRESHOLD = 300;