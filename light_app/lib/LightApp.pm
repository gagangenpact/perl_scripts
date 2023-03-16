package LightApp;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Example#welcome');
  
   # Normal route to controller
  $r->get('/foo')->to('Example#foo');
  
  # Normal route to controller
  $r->post('/echo')->to('Example#echo');
  
}

1;
