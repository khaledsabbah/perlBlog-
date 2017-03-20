use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Blog';
use Blog::Controller::Dashboard;

ok( request('/dashboard')->is_success, 'Request should succeed' );
done_testing();
