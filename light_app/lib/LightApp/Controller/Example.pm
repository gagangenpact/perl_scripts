package LightApp::Controller::Example;
use Mojo::Base 'Mojolicious::Controller', -signatures;

# This action will render a template
sub welcome ($self) {

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

# This action will render a messge
sub foo ($self) {

  # Render message
  $self->render(text => 'Hello World');
}

sub echo ($self) {
  $self->res->headers->header('X-Bender' => 'Bite my shiny metal ass!');
  $self->render(data => $self->req->body);
};

1;


