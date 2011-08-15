use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Catalyst::Default';
use Catalyst::Default::Controller::Books;

ok( request('/books')->is_success, 'Request should succeed' );
done_testing();
