use Mojolicious::Lite -signatures;

get '/' => sub {
  my $self = shift;

  $self->render(text =>'Hello World');
};

# Route leading to an action that renders some text
get '/foo' => sub ($c) {
  $c->render(text => 'Hello World!!!123');
};

#app->start;

# Start the "daemon" command
app->start('daemon', '-l', 'http://*:8080');