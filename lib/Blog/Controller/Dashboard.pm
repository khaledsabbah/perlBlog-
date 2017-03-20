package Blog::Controller::Dashboard;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Blog::Controller::Dashboard - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    # my $id = $c->session->{user}->id;
    if($c->user->id ){
        my $posts = $c->model('DB::Post')->find({u_id=>$c->user->id});
        $c->stash(posts=>$posts);    
    	$c->stash(template=>'dashboard/dashboard.html');	
    }else{
    	$c->response->redirect($c->uri_for("/user/"));
    }

    
    # $c->response->body($c->user->id);
    # my $admins_count = $c->model('DB::User')->search(
    #     {
    #         email => $c->stash{email};
    #     }
    # );
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
