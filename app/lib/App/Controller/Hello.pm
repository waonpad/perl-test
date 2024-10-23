package App::Controller::Hello;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub hello ($self) {

  $self->render(json => {hello => 'world'});
}

1;
