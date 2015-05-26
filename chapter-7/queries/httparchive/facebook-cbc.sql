select count(distinct(pageid)) as count,(100*count(distinct(pageid))/964) as percent from requests where 
(url like "%://connect.facebook.net%" or url like "%://static.ak.fbcdn.net%") and mimeType like "%script"
