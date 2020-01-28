#!/usr/bin/perl

use CGI qw/:standard/;


print 	header(-cookie=> cookie(-name=>'sessionID', -value=>'976IAQVU', -expires=>'+1y', -path=>'/')),
	start_html(-title=>'Set cookie',
  	           -head=>meta({-http_equiv=>"refresh", -content=>"0; URL=index.pl"})
	);

