#!/usr/bin/env perl
use strict;
use warnings;

use Cwd;
my $pwd = getcwd;

while (<.*>) {
  next if /^.git$/;
  next if /^\.+$/;
  print "ln -s $pwd/$_ $ENV{HOME}\n";
}

