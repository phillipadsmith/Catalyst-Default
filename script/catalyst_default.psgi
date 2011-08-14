#!/usr/bin/env perl
use strict;
use warnings;
use lib 'lib';
use Catalyst::Default;

Catalyst::Default->setup_engine('PSGI');
my $app = sub { Catalyst::Default->run(@_) };

