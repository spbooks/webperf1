select count(distinct(pageid)) as count,(100*count(distinct(pageid))/964) as percent from requests where 
(url like "%://b.scorecardresearch.com%") and mimeType like "%script"
