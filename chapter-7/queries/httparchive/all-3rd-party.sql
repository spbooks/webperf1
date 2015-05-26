#select count(distinct(pageid)) as count,(100*count(distinct(pageid))/964) as percent from requests where 
#(url like "%://connect.facebook.net%" or url like "%://static.ak.fbcdn.net%") and mimeType like "%script"

select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://connect.facebook.net%" or url like "%://static.ak.fbcdn.net%" or url like "%://b.scorecardresearch.com%" or url like "%://apis.google.com%"
or url like "%://ads.doubleclick.net%" or url like "%://platform.twitter.com" or url like "%://cdn.clicktale.net" or url like "%://cdn.gigya.com%") 

select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url not like "%://connect.facebook.net%" and url not like "%://static.ak.fbcdn.net%" and url not like "%://b.scorecardresearch.com%" and url not like "%://apis.google.com%"
and url not like "%://ads.doubleclick.net%" and url not like "%://platform.twitter.com" and url not like "%://cdn.clicktale.net" and url not like "%://cdn.gigya.com%") 


#select count(distinct(pageid)) as count,(100*count(distinct(pageid))/964) as percent from requests where 
#(url like "%://connect.facebook.net%" or url like "%://static.ak.fbcdn.net%") and mimeType like "%script"

select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://connect.facebook.net%" or url like "%://static.ak.fbcdn.net%");

select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://b.scorecardresearch.com%");


select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://apis.google.com%") and mimeType like "%scripts%"


select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://ads.doubleclick.net%") and mimeType like "%scripts%"


select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://platform.twitter.com%") and mimeType like "%scripts%"


select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://cdn.clicktale.net%") and mimeType like "%scripts%"


select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url like "%://cdn.gigya.com%") and mimeType like "%scripts%"


select count(distinct(pageid)) as count,(100*count(distinct(pageid))/1744) as percent from requests where 
(url not like "%://_cbc.ca%") and mimeType like "%scripts%"


