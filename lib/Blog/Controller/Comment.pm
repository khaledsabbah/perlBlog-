package Blog::Controller::Comment;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Blog::Controller::Comment - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    	$c->response->redirect($c->uri_for("/post/"));
}

sub save :Path('save') :Args(0) {
    my ( $self, $c ) = @_;
    my $p_id =$c->request->params->{p_id}||"";
    if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
	    if($c->user->id){
	    	
		    my $u_id =$c->request->params->{u_id}||"";
		    my $c_content =$c->request->params->{c_content}||"";
		    if($p_id && $u_id && $c_content){
		    	my $comment = $c->model('DB::Comment')->create({
		    	u_id => $u_id,
		    	p_id=> $p_id,
		    	c_content=>$c_content
		    	});
		    	$c->response->redirect($c->uri_for("/post/view/".$p_id));	
		    }else{
		    	$c->flash->{error_msg}="Wrong data submitted.";
				$c->response->redirect($c->uri_for("/post/view/".$p_id));
		    }
		    

		}else{
			$c->flash->{error_msg}="Wrong data submitted.";
			$c->response->redirect($c->uri_for("/post/view/".$p_id));
		}
	}
    
}


sub edit :Path('edit') :Args(0) {
	my ( $self, $c  ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		my $p_id= $c->request->params->{p_id}||"";
		my $c_id= $c->request->params->{c_id}||"";
		my $u_id = $c->user->id ;
		if($p_id && $p_id){
			my $post = $c->model('DB::Post')->find({p_id=>$p_id});
			my $comment = $c->model('DB::Comment')->find({c_id=>$c_id});
			$c->stash(comment => $comment);
			$c->stash(post => $post);
			$c->stash(template => "posts/view.html");	
		}else{
			$c->flash->{error_msg}="Wrong data submitted.";
			$c->response->redirect($c->uri_for("/post/view/".$p_id));
		}
	}	
}

sub update :Path('update') :Args(0) {
	my ( $self, $c  ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		my $p_id= $c->request->params->{p_id}||"";
		my $c_id= $c->request->params->{c_id}||"";
		my $content= $c->request->params->{c_content}||"";
		my $u_id = $c->user->id ;

		if($p_id && $c_id && $u_id ){
			my $post = $c->model('DB::Post')->find({p_id=>$p_id});
			my $comments = $c->model('DB::Comment')->find({c_id=>$c_id , p_id=>$p_id});
			$comments->update({ c_content => $content });
			# $c->stash(comment => $comment);
			$c->response->body($comments->c_content);
			# $c->stash(post => $post);
			# $c->response->redirect($c->uri_for("/post/view/".$p_id));
		}else{
			$c->flash->{error_msg}="Wrong data submitted.";
			$c->response->body('error');
			# $c->response->redirect($c->uri_for("/post/view/".$p_id));
		}
	}
}

sub remove :Path('remove') :Args(0) {
	my ( $self, $c  ) = @_;
	if(!$c->user_exists){
    	$c->response->redirect($c->uri_for("/user/"));
	}else{
		my $c_id= $c->request->params->{c_id}||"";
		my $p_id= $c->request->params->{p_id}||"";
		my $u_id = $c->user->id ;
		if($c_id && $p_id){
			my $comment = $c->model('DB::Comment')->find({c_id=>$c_id});
			$comment->delete ;
			$c->flash->{success_msg}="comment deleted successfully!!!";
			$c->response->redirect($c->uri_for("/post/view/".$p_id));
		}else{
			$c->flash->{error_msg}="Wrong data submitted.";
			$c->response->redirect($c->uri_for("/post/view/".$p_id));
		}
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
