package App::Controller::Post;
use Mojo::Base 'Mojolicious::Controller', -signatures;

# いったんハードコードでデータを持つ
my $posts = [
  {id => 0, title => 'First post', body => 'This is the first post'},
  {id => 1, title => 'Second post', body => 'This is the second post'},
  {id => 2, title => 'Third post', body => 'This is the third post'},
];

sub index ($self) {
  $self->render(json => $posts);
}

sub show ($self) {
  # /posts/:id で指定されたidを取得
  my $id = $self->param('id');
  my $post = $posts->[$id];
  $self->render(json => $post);
}

sub create ($self) {
  my $post = $self->req->json;
  push @$posts, $post;
  $self->render(json => $post);
}

sub update ($self) {
  my $id = $self->param('id');
  my $post = $posts->[$id];
  # titleがあれば更新
  $post->{title} = $self->req->json->{title} if $self->req->json->{title};
  # bodyがあれば更新
  $post->{body} = $self->req->json->{body} if $self->req->json->{body};
  $self->render(json => $post);
}

sub delete ($self) {
  my $id = $self->param('id');
  my $post = splice @$posts, $id, 1;
  $self->render(json => $post);
}

1;
