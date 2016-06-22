#!/usr/bin/perl -w

use strict;
my $ip = $ENV{'REMOTE_ADDR'};

if ( !defined($ENV{'REMOTE_ADDR'}) ) {
	print STDERR 'Environment variable $ENV{\'REMOTE_ADDR\'} is not set.'."\n";
	exit 1;
}

my $color = '#000000';
my $ipString = 'IPv4';

# Check if address is IPv6
if ( $ip =~ m/:/ ) {
	$color = '#000000';
	$ipString = 'IPv6';
}

print "Content-type: text/html\n\n";

# Output
if ( $ENV{'SCRIPT_NAME'} =~ m/api/i 
  || $ENV{'HTTP_USER_AGENT'} =~ m/curl/i 
  || $ENV{'HTTP_USER_AGENT'} =~ m/wget/i 
  || $ENV{'HTTP_USER_AGENT'} =~ m/lynx/i 
  || $ENV{'HTTP_USER_AGENT'} =~ m/emacs/i 
  || $ENV{'HTTP_USER_AGENT'} =~ m/links/i 
  ) {

	print $ip . "\n";

} else {

print <<"END";
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Also available as API version at /api. The API version will also be displayed if the UserAgent contains:
	- m/curl/i
	- m/wget/i
	- m/lynx/i
	- m/emacs/i
	- m/links/i
-->
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IP address</title>
  <style type="text/css">
   body {
    font-family: monospace;
    color: ${color};
   }
  </style>
 </head>
<body>
<p>
Your $ipString address is <a href="https://stat.ripe.net/${ip}">${ip}</a>
</p>
<p>
<a href="about.html" alt="About">About</a>
</p>
</body>
</html>
END

}


