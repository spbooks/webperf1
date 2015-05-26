#!/usr/bin/perl

#SAMPLE LOG ENTRY
#ip www.domain.ca (4154) - [23/Feb/2013:17:23:21 -0500] 
#"GET /path-to-beacon/beacon.gif?rt.start=navigation&rt.tstart=1361658610609&rt.bstart=1361658611516&rt.end=1361658612181&
#t_resp=36&t_page=1536&t_done=1572&r=http%3A%2F%2Fwww.url.ca&r2=&
#t_other=boomerang%7C5%2Cboomr_fb%7C907%2Ct_domloaded%7C940&bw=717739&bw_err=199058.44&lat=204&
#lat_err=25.46&bw_time=1361658625&v=0.9&u=www.url.ca HTTP/1.1" 200 13643 "http://pathtotestedurl" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.99 Safari/537.22" 1


#!/usr/bin/perl


#zgrep beacon.gif *-sb10-*-access_log.gz
#login to dev71
# /mnt/logs/apache/prod/2013/01/25
#::1 - - [25/Jan/2013:12:35:52 -0500] "GET /m/hybrid/spa/0.4/img/beacon.gif?nt_red_cnt=0&nt_nav_type=1&nt_nav_st=1359135349618&nt_red_st=0&nt_red_end=0&nt_fet_st=1359135349618&nt_dns_st=1359135349619&nt_dns_end=1359135349620&nt_con_st=1359135349620&nt_con_end=1359135349620&nt_req_st=1359135349620&nt_res_st=1359135349621&nt_res_end=1359135349622&nt_domloading=1359135349627&nt_domint=1359135352108&nt_domcontloaded_st=1359135352108&nt_domcontloaded_end=1359135352118&nt_domcomp=1359135352159&nt_load_st=1359135352159&nt_load_end=1359135352159&nt_unload_st=1359135349624&nt_unload_end=1359135349624&nt_spdy=0&nt_first_paint=1359135349.848953&rt.start=navigation&rt.tstart=1359135349618&rt.bstart=1359135352098&rt.end=1359135352164&t_resp=3&t_page=2543&t_done=2546&r=&t_other=boomerang%7C7%2Cboomr_fb%7C2480%2Ct_domloaded%7C2500&bw=259770886&bw_err=17625645.58&lat=3&lat_err=0.26&bw_time=1359135353&v=0.9&u=http%3A%2F%2Flocalhost%2Fm%2Fhybrid%2Fspa%2F0.4%2F HTTP/1.1" 200 13643
#63.233.92.55 www.cbc.ca (5768) - [25/Jan/2013:16:46:40 -0500] "GET /m/0/spa/boomerang/img/beacon.gif04:46:28%20PM?bw=1332894&bw_err=269744.68&lat=121&lat_err=4.45&bw_time=1359150403&v=0.9&u=http%3A%2F%2Fwww.cbc.ca%2Fm%2F0%2Fspa%2Fboomerang%2F HTTP/1.1" 404 4898 "http://www.cbc.ca/m/0/spa/boomerang/" "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.45 Safari/537.22" 1
#bw=1484891&bw_err=96190.56&lat=108&lat_err=0.37&bw_time=1359152379&v=0.9&u=http%3A%2F%2Fwww.cbc.ca%2Fm%2F0%2Fspa%2Frum%2F


#web23-sb10-20130223-2200-access_log.gz:69.31.75.167 www.cbc.ca (4154) - [23/Feb/2013:17:23:21 -0500] 
#"GET /m/0/spa/rum/img/beacon.gif?rt.start=navigation&rt.tstart=1361658610609&rt.bstart=1361658611516&rt.end=1361658612181&
#t_resp=36&t_page=1536&t_done=1572&r=http%3A%2F%2Fwww.cbc.ca%2Fm%2F0%2Fspa%2Frum%2F%3Flll&r2=&
#t_other=boomerang%7C5%2Cboomr_fb%7C907%2Ct_domloaded%7C940&bw=717739&bw_err=199058.44&lat=204&
#lat_err=25.46&bw_time=1361658625&v=0.9&u=http%3A%2F%2Fwww.cbc.ca%2Fm%2F0%2Fspa%2Frum%2F%3Flll HTTP/1.1" 200 13643 "http://www.cbc.ca/m/0/spa/rum/?lll" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.99 Safari/537.22" 1

#date,rt.start,rt.tstart,rt.bstart,rt.end,t_resp,t_page,t_done,r,r2,t_other,bw,bw_err,lat,lat_err,bw_time,v,u
#23/Feb/2013:17:37:16 -0500,none,,1361659025619,1361659026803,,boomerang%7C6,73385,29273.04,369,146.64,1361659038,0.9,http%3A%2F%2Fwww.cbc.ca%2Fm%2F0%2Fspa%2Frum%2F,

$logFile = $ARGV[0];
open (LOGFILE,"$logFile") || die "  Error opening log file $logFile.\n";

#print "1. date,2. rt.start,3. rt.tstart,4. rt.bstart,5. rt.end,6. t_resp,7. t_page,8. t_done,9. r,10. r2,11. t_other,12. bw,13. bw_err,14. lat,15. lat_err,16. bw_time,17. v,18. u\n";
#print "date,bw,bw_err,lat,lat_err,bw_time,t_resp\n";

my $t_resp;
my $bw;
my $bw_err;
my $lat;
my $lat_err;
my $bw_time;
my $t_resp;
my $t_done;
my $_page;

while ( $line = <LOGFILE>) {
    chomp($line);
    if ($line =~ m/([^ ]+) ([^ ]+) ([^ ]+) \[([^\]]+)\] "(\S+) (.+?) (\S+)" ([^ ]+) ([^ ]+) "([^"]+)" "([^"]+)"/) {
        $ip = $1;
        $date = $4;
        $request = $6;
        $response_code = $8;
        $size = $9;
        $referrer = $10;
        $agent = $11;

		if ($request =~ m/beacon.gif\?(.*)$/) {
		  $request = "$1\n";
		  #print $request;
			#print $date. ",";
			@fields = split(/&/, $request);
		 	foreach my $field (@fields) {
			    my ($name, $value) = split(/=/, $field);
			    $value =~ tr/+/ /;
			    $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
			   # if ($name ne '')
			   # {
			   # 	if ($value eq '') { 
			   # 		print ",";
			   # 	} 
			   # 	else {
			   # 		print $value . ",";
			   # 	}
			   # }

			   #if ($name eq 'bw'){if ($value eq '') { print ",";} else {print $value . ",";}}
			   #if ($name eq 'bw_err'){if ($value eq '') { print ",";} else {print $value . ",";}}
			   #if ($name eq 'lat'){if ($value eq '') { print ",";} else {print $value . ",";}}
			   #if ($name eq 'lat_err'){if ($value eq '') { print ",";} else {print $value . ",";}}
			   #if ($name eq 'bw_time'){if ($value eq '') { print ",";} else {print $value . ",";}}
			   #if ($name eq 't_resp'){if ($value eq '') { print ",";} else {print $value . ",";}}


			   if ($name eq 'bw'){$bw = $value;}
			   if ($name eq 'bw_err'){$bw_err = $value;}
			   if ($name eq 'lat'){$lat = $value;}
			   if ($name eq 'lat_err'){$lat_err = $value;}
			   if ($name eq 'bw_time'){$bw_time = $value;}
			   if ($name eq 't_resp'){$t_resp = $value;}
			   if ($name eq 't_done'){

			   		#print $value . ", ";
			   		$t_done = $value;
			   }
                if ($name eq 't_page'){
                    
			   		#print $value . ", ";
			   		$t_page = $value;
                }		   

			  # print $agent;





			}
			  # print "insert into runs (rundate, bw, bw_err, lat, lat_err, bw_time, t_resp, t_done) values ('".$date."','".$bw."', '".$bw_err."', '".$lat."', '".$lat_err."', '".$bw_time."', '".$t_resp."', '".$t_done."');";
			   #print $t_done;

            print "insert into runs (rundate, bw, bw_err, lat, lat_err, bw_time, t_resp, t_done, t_page, agent) values ('".$date."','".$bw."', '".$bw_err."', '".$lat."', '".$lat_err."', '".$bw_time."', '".$t_resp."', '".$t_done."', '".$t_page."', '".$agent."');";
			   
			   
			   print "\n";

				$t_resp='';
				$bw='';
				$bw_err='';
				$lat='';
				$lat_err='';
				$bw_time='';
				$t_resp='';
				$t_done='';
                $t_page = '';
				$value='';
		}





		
    }
}


# Explanation
#bw User's measured bandwidth in bytes per second
#bw_err 95% confidence interval margin of error in measuring user's bandwidth
#lat User's measured HTTP latency in milliseconds
#lat_err 95% confidence interval margin of error in measuring user's latency
#bw_time Timestamp (seconds since the epoch) on the user's browser when the bandwidth and latency was measured

close (LOGFILE);

