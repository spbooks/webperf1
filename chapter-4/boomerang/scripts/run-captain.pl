#!/usr/bin/perl

#SAMPLE LOG ENTRY
#ip www.domain.ca (4154) - [23/Feb/2013:17:23:21 -0500] 
#"GET /path-to-beacon/beacon.gif?rt.start=navigation&rt.tstart=1361658610609&rt.bstart=1361658611516&rt.end=1361658612181&
#t_resp=36&t_page=1536&t_done=1572&r=http%3A%2F%2Fwww.url.ca&r2=&
#t_other=boomerang%7C5%2Cboomr_fb%7C907%2Ct_domloaded%7C940&bw=717739&bw_err=199058.44&lat=204&
#lat_err=25.46&bw_time=1361658625&v=0.9&u=www.url.ca HTTP/1.1" 200 13643 "http://pathtotestedurl" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.99 Safari/537.22" 1

$logFile = $ARGV[0];
open (LOGFILE,"$logFile") || die "  Error opening log file $logFile.\n";
print "date,rt.start,rt.tstart,rt.bstart,rt.end,t_resp,t_page,t_done,r,r2,t_other,bw,bw_err,lat,lat_err,bw_time,v,u\n";
while ( $line = <LOGFILE>) {
    chomp($line);
    if ($line =~ m/([^ ]+) ([^ ]+) ([^ ]+) \[([^\]]+)\] "(\S+) (.+?) (\S+)" ([^ ]+) ([^ ]+) "([^"]+)" "([^"]+)"/) {
        $date = $4;
        $request = $6;

		if ($request =~ m/beacon.gif\?(.*)$/) {
		  $request = "$1\n";
			print $date. ",";
			@fields = split(/&/, $request);
		 	foreach my $field (@fields) {
				if ($field =~ m/=(.*)/) {
					print "$1,";
				}	
			}
			print "\n";
		}
		
    }
}

close (LOGFILE);