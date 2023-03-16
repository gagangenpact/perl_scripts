#!/usr/bin/perl
use strict;
use warnings;
use v5.10; # for say() function
use DBIx::Connection;
use DBI;
say "Perl MySQL Connect Demo";
# MySQL database configuration
my $dsn = "";
my $username = "";
my $password = '';

# connect to MySQL database
my %attr = ( PrintError=>0,  # turn off error reporting via warn()
             RaiseError=>1);   # turn on error reporting via die()           

my $dbh  = DBI->connect($dsn,$username,$password, \%attr);

say "Connected to the MySQL database.";

my $connection = DBIx::Connection->new(
  name  => 'my_connection_name',
  dbh   => $dbh,
  
);   

my $cursor = $connection->query_cursor(sql => "select * from emp where deptno > ?", name => 'emp_select');
my $dataset = $cursor->execute(['20']);
while ($cursor->fetch) {
    #do some stuff ...
    print $_ . " => " . $dataset->{$_}
      for keys %$dataset;
}
 
 
# returns connection to connection pool
$connection->close();