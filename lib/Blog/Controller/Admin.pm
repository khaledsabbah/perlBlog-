package Blog::Controller::Admin;
use Moose;
use namespace::autoclean;
use Data::Dumper ;
BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Blog::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    if(!$c->user_exists){
        $c->response->redirect($c->uri_for("/user/"));
    }else{
        if($c->user->role=='admin'){
        		my $all = $c->model('DB::User')->all();
    		    $c->stash->{all} = [$c->model('DB::User')->all];
    		    $c->stash(template => "admin/userlist.html");
    		    return ;
        	}else{
        		$c->flash->{error_msg}="this is awrong place to go !!!";
        		$c->response->redirect("/user/");	
        	}
    }
}


sub edit :Path('edit') :Args(0) {
    my ( $self, $c ) = @_;
    if(!$c->user_exists){
        $c->response->redirect($c->uri_for("/user/"));
    }else{
        if($c->user->role=='admin'){
        		my $user = $c->model('DB::User')->find({id=>$c->request->params->{id}});
    		    $c->stash(user =>$user) ;
    		    $c->stash(template => "admin/edit.html");
    		    return ;
        	}else{
        		$c->flash->{error_msg}="this is awrong place to go !!!";
        		$c->response->redirect("/user/");	
        	}
    }   
}


sub update :Path('update') :Args(0) {
    my ( $self, $c ) = @_;
    if(!$c->user_exists){
        $c->response->redirect($c->uri_for("/user/"));
    }else{
        if($c->user->role=='admin'){

        		my $firstname = $c->request->params->{firstname};
        		my $lastname = $c->request->params->{lastname};
        		my $email = $c->request->params->{email};
        		my $gender = $c->request->params->{gender};

        		my $user = $c->model('DB::User')->find({id=>$c->request->params->{id}});
        		$user->update({
        			firstname=>$firstname , 
        			lastname=>$lastname , 
        			email=>$email , 
        			gender=>$gender , 
        			});
    		    $c->stash(user =>$user) ;
    		    $c->flash->{success_msg}="user updated successfully!!";
    		    $c->response->redirect("/admin/");
    		    return ;
        	}else{
        		$c->flash->{error_msg}="this is awrong place to go !!!";
        		$c->response->redirect("/user/");	
        	}
    }
    
}


sub remove :Path('remove') :Args(0) {
    my ( $self, $c ) = @_;
    if(!$c->user_exists){
        $c->response->redirect($c->uri_for("/user/"));
    }else{
        if($c->user->role=='admin'){
        	my $user = $c->model('DB::User')->find({id=>$c->request->params->{id}});
        	my $posts = $c->model('DB::Post')->find({u_id=>$c->request->params->{id} });
        	my $comments = $c->model('DB::Comment')->find({u_id=>$c->request->params->{id}});
        	if($posts > 0){
        		$posts->delete;	
        	}
        	$user->delete;
        	$c->flash->{success_msg}="user deleted successfully!!";
        	$c->response->redirect("/admin/");

    	}else{
        		$c->flash->{error_msg}="this is awrong place to go !!!";
        		$c->response->redirect("/user/");	
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
