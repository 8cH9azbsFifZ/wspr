#!/usr/bin/perl

print $ARGV[0];

open OTOOL, "otool -L $ARGV[0]|";

while (<OTOOL>) {
  if(/^\s\/usr\/local\/lib\/lib([a-zA-Z32_]*)(-x11)?-?[0-9.]*\.dylib/) {
    my $framework = $1;
    my ( $library ) = $& =~ /^\s(.*)/;
    print "Got Framework $framework\n";
    print "Got library $library\n";
    my $exec_command = "install_name_tool -change $library \@executable_path/../Frameworks/$framework.framework/$framework $ARGV[0]";
    print "$exec_command\n";
    system($exec_command);
  }
}
