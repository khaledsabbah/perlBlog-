package Blog::Controller::Post;
use Moose;
use namespace::autoclean;
use Blog::Schema::perlBlog::Result::Comment;
BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Blog::Controller::Post - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
   my ( $self, $c ) = @_;
    # $c->stash('WRAPPER'=>'home/index.html.tt');
    my $all = $c->model('DB::Post')->all();
    $c->stash->{all} = [$c->model('DB::Post')->all];
    $c->stash(template => "posts/list.html");
    # $c->response->body($all);
    # $c->stash{'template'=>''}
}

sub create :Path('create') :Args(0) {
	my ( $self, $c ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		$c->stash(template => "posts/create.html");
	}
}

sub save :Path('save') :Args(0) {
	my ( $self, $c ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		my $content = $c->request->params->{post};
		my $title = $c->request->params->{title};
		$c->response->body($title);

		if($content && $title && $c->user->id){

			my $post = $c->model('DB::Post')->create({
					u_id=> $c->user->id,
					p_title=> $title,
					p_content=> $content,

				}) ;
			
			$c->flash->{success_msg} ="post published successfully!!";
			$c->response->redirect("/dashboard");
		}else{
			$c->flash->{error_msg}="Please , Fill the form and then submit data";
		}
	}
	# $c->response->redirect($c->uri_for("/post/create"));
}

sub edit :Path('edit') :Args(0) {
	my ( $self, $c ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		my $p_id = $c->request->params->{p_id};
		my $post = $c->model('DB::Post')->find({p_id=>$p_id});
		$c->stash(post => $post);
		# $c->response->body($post->p_content);
		# my $post = $c->model('DB::Post')->find({p_id=>$p_id});
		# $c->stash(posts => $post);	
		$c->stash(template => "posts/create.html");
	}
}

sub view :Path('view') :Args(1) {
	my ( $self, $c , $p_id ) = @_;
	# if(!$c->user_exists){
 #    	$c->response->redirect($c->uri_for("/user/"));
	# }else{
		my $post = $c->model('DB::Post')->find({p_id=>$p_id});
		my $comments = $c->model('DB::Comment')->find({p_id=>$p_id });
		# $c->response->body($comments[0]->users->email);
		$c->stash(post => $post);
		$c->stash(comments => $comments);
		$c->stash(template => "posts/view.html");
	# }
}

sub update :Path('update') :Args(0) {
	my ( $self, $c  ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		my $u_id = $c->user->id ;
		my $content = $c->request->params->{post}||'';
		my $title = $c->request->params->{title}||'';
		my $p_id = $c->request->params->{p_id} || '';
		
		if( $u_id && $title && $p_id && $content ){
			my $post = $c->model('DB::Post')->find({p_id=>$p_id});
			$post->update({
				p_title=> $title,
				p_content=> $content,
				});

			my $comments = $c->model('DB::Comment')->find({p_id=>$p_id , u_id=>$u_id });
			$c->stash(post => $post);
			$c->stash(comments => $comments);
			$c->response->redirect($c->uri_for("/post/view/".$p_id));	
		}else{
			$c->flash->{error_msg}="some thing goes wrong!!.";
			$c->response->redirect($c->uri_for("/post/view/".$p_id));	
		}
	}
}


sub remove :Path('remove') :Args(0) {
	my ( $self, $c ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		my $p_id = $c->request->params->{p_id};
		my $post = $c->model('DB::Post')->find({p_id=>$p_id});
		my $comments = $c->model('DB::Comment')->find({p_id=>$p_id});
		$comments->delete;
		$post->delete;
		# $c->response->body($post->p_content);
		# my $post = $c->model('DB::Post')->find({p_id=>$p_id});
		# $c->stash(posts => $post);	
		$c->flash->{success_msg}="Post deleted successfully!!.";
		$c->response->redirect($c->uri_for("/dashboard/"));	
	}	
}




=encoding utf8

=head1 AUTHOR

KhaledGamal

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
