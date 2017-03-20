package Blog::Controller::User;
use Moose;
use namespace::autoclean;
use Digest::MD5 qw(md5_hex);
use Catalyst::Plugin::Session;
use Catalyst::Plugin::StatusMessage;
use Catalyst::Plugin::Authentication;
BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Blog::Controller::User - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    	$c->stash(template => "user/signIn.html");		
		return;    
}
sub logOut :Path("logOut") :Args(0) {
    my ( $self, $c ) = @_;
    $c->logout();
    $c->response->redirect("/");
}

sub logIn :Path('logIn') :Args(0) {
	my ( $self, $c ) = @_;

	my $email = $c->request->params->{email};
    my $password = $c->request->params->{password};

    if ($email && $password) {
    	# my $user = $c->model('DB::User')->get({email=>$email});
        if ( $c->authenticate({ email => $email,password => md5_hex($password)  } )) {
        	my $user = $c->model('DB::User')->search({ email => $email});
        	# $c->stash->('user'=>$user);
            $c->response->redirect($c->uri_for("/dashboard"));
            return;
        } else {
            $c->flash->{error_msg}="Wrong email or password.";
        }
    } else {
        $c->flash->{error_msg} ="Empty email or password. please Enter them all right";
    }
    # $c->response->redirect($c->uri_for($c->controller('User')->action_for("")));
    $c->response->redirect($c->uri_for("/user/"));
}

sub signUp :Path('signUp') :Args(0) {
	my ( $self, $c ) = @_;
	$c->stash(template => "user/signUp.html");	
}

sub register :Path('register') :Args(0) {
	my ( $self, $c ) = @_;
	my $pass=md5_hex($c->request->params->{password});
	# my $pass=$c->request->params->{password}||"";
	my $firstname=$c->request->params->{firstname};
	my $lastname=$c->request->params->{lastname};
	my $email=$c->request->params->{email}||"";
	# my $password=$pass||"";
	my $gender=$c->request->params->{gender};
	# my $gender=$c->request->params->{gender}-eq"female"?"female":"male";
	#$mailExpr = '/[A-z]{3,}[1-9]*@[A-z]+\.[a-z]{3,4}/';	
	my $match = $email =~ /[A-z]{3,}[1-9]*@[A-z]+\.[a-z]{3,4}/;	
	if($email && $pass && $firstname && $lastname){
		if($match){
			my $search_user = $c->model('DB::User')->search({email => $email});
			if($search_user==1){
                $c->flash->{error_msg} = "Sorry !! .This Email already exists ... Please signIn";
			}else{
				my $user = $c->model('DB::User')->create({
						firstname=>$firstname,
						lastname=>$lastname,
						email=>$email,
						password=>$pass,
						gender=>$gender
					});
				# $c->session->{user}=$user;
				if ( $c->authenticate({ email => $email,password => $pass  } )) {
					$c->response->redirect($c->uri_for("/dashboard"));
					return ;	
				}
				
			}
		}else{
			$c->flash->{error_msg} = "Sorry !! Please Enter valid Email .";	
		}
	}else{
		$c->flash->{error_msg} = "Sorry !! some fields are empty , please full them all .";	
	}
	$c->response->redirect($c->uri_for("/user/register"));
	
}


sub update :Path('update') :Args(0) {
    my ( $self, $c ) = @_;
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
		    $c->response->redirect("/dashboard/");
		    return ;
    	}else{
    		$c->flash->{error_msg}="this is awrong place to go !!!";
    		$c->response->redirect("/dashboard/");	
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
