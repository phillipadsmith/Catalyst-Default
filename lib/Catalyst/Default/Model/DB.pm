package Catalyst::Default::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';
use JSON;
use Data::Dumper;
use IO::All;

# Local development defaults

my $db_user  = 'catalyst';
my $db_pass  = 'catalyst';
my $db_host  = 'localhost';
my $db_port  = '5432';

my $local_dev = 'environment.json';
my $remote_dev = '/home/dotcloud/environment.json';

my $environment = do { -e $remote_dev ? $remote_dev : $local_dev };
# Override with the environment.json if it exists
# (This is not the best way to do this, but it works for the tutorial)
my $json < io "$environment";
my $env = decode_json( $json );
$db_user  = $env->{'DOTCLOUD_DATA_SQL_LOGIN'};
$db_pass  = $env->{'DOTCLOUD_DATA_SQL_PASSWORD'};
$db_host  = $env->{'DOTCLOUD_DATA_SQL_HOST'};
$db_port  = $env->{'DOTCLOUD_DATA_SQL_PORT'};

__PACKAGE__->config(
    schema_class => 'Catalyst::Default::Schema',
    connect_info => {
        dsn => "dbi:Pg:dbname=default-catalyst;host=$db_host;port=$db_port",
        user => $db_user,
        password => $db_pass,
        AutoCommit => q{1},
    }
);

=head1 NAME

Catalyst::Default::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<Catalyst::Default>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Catalyst::Default::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.54

=head1 AUTHOR

Phillip Smith

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
