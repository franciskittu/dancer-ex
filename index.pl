#!/usr/bin/env perl
use Dancer2;
use Plack::Runner;

## For some reason Apache SetEnv directives dont propagate
## correctly to the dispatchers, so forcing PSGI and env here 
## is safer.
set apphandler => 'PSGI';
set environment => 'production';

my $psgi;
$psgi = path($ENV{'DOCUMENT_ROOT'}, 'bin', 'app.psgi');
die "Unable to read startup scripts: $psgi" unless -r $psgi;

Plack::Runner->run($psgi);
