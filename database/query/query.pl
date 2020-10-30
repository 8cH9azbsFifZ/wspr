#!/usr/bin/perl
use URI::Escape;
use LWP::Simple;
my $call = "DG6FL";
my $url = "http://wsprnet.org/olddb?mode=html&band=all&limit=50&findcall=".$call."&findreporter=".$call."&sort=date";
#my $content = get $url;
my $content = '<tr id="evenrow"><td align=left>&nbsp;2011-08-11 18:00&nbsp;</td><td align=left>&nbsp;DL2LAH&nbsp;</td><td align=right>&nbsp;7.040092&nbsp;</td><td align=right>&nbsp;-18&nbsp;</td><td align=right>&nbsp;0&nbsp;</td><td align=left>&nbsp;JO44qs&nbsp;</td><td align=
right>&nbsp;+37&nbsp;</td><td align=right>&nbsp;5.012&nbsp;</td><td align=left>&nbsp;DG6FL&n
bsp;</td><td align=left>&nbsp;JO40cb&nbsp;</td><td align=right>&nbsp;529&nbsp;</td><td align
=right>&nbsp;329&nbsp;</td></tr>';
$content =~ /<tr id="evenrow"><td align=left>&nbsp;(.*)&nbsp;<\/td><td align=left>&nbsp;(.*)&nbsp;<\/td><td align=right>&nbsp;(.*)&nbsp;<\/td><td align=right>&nbsp;(.*)&nbsp;<\/td><td align=right>&nbsp;(.*)&nbsp;<\/td><td align=left>&nbsp;(.*)&nbsp;<\/td><td align=right>&nbsp;(.*)&nbsp;<\/td><td align=right>&nbsp;(.*)&nbsp;<\/td><td align=left>&nbsp;(.*)&nbsp;<\/td><td align=left>&nbsp;(.*)&nbsp;<\/td><td align=right>&nbsp;(.*)&nbsp;<\/td><td align=right>&nbsp;(.*)&nbsp;<\/td><\/tr>/;
print $2;
