#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'Catalyst-Default';
all_from 'lib/Catalyst/Default.pm';

requires 'Catalyst::Runtime' => '5.80033';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
requires 'Catalyst::Engine::PSGI';
requires 'Catalyst::Plugin::StackTrace';
requires 'DBIx::Class';
requires 'Catalyst::Model::DBIC::Schema';
requires 'JSON';
requires 'Data::Dumper';
requires 'MooseX::NonMoose';
requires 'DBD::Pg';
requires 'IO::All';

test_requires 'Test::More' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
