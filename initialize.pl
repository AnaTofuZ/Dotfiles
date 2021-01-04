#!/usr/bin/env perl
use strict;
use warnings;

use Cwd;
my $pwd = getcwd;

while (<.*>) {
  next if /^.git$/;
  next if /^\.+$/;
  if (/\.config$/) {
    print "ln -s $pwd/$_/peco/config.json $ENV{HOME}/.config/peco\n";
    next;
  }
  print "ln -s $pwd/$_ $ENV{HOME}\n";
}

