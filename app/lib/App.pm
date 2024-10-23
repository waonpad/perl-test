package App;
use Mojo::Base 'Mojolicious', -signatures;
# JSON.stringifyみたいなやつ
# use Data::Dumper;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  $r = $r->under(sub ($c) {
    # ここで共通処理を実行できる
    # $self->log->info(Dumper($c->req->...));
    1;
  });

  # ルート一覧を確認するコマンド
  # perl app/script/app routes

  # Normal route to controller
  $r->get('/')->to('Example#welcome');

  $r->get('/hello')->to('Hello#hello');

  $r->get('/posts')->to('Post#index');
  $r->get('/posts/:id')->to('Post#show');
  $r->post('/posts')->to('Post#create');
  $r->put('/posts/:id')->to('Post#update');
  $r->delete('/posts/:id')->to('Post#delete');
}

1;
