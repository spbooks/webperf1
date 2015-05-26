select req_referer
from requests where ( url like "%/jquery.js%" or url like "%/jquery.min.js%" 
or url like "%/jquery-1._._.js%" or url like "%/jquery-1._._.min.js%" 
or url like "%/jquery-1._.js%" or url like "%/jquery-1._.min.js%" 
or url like "%/jquery-latest.js%" or url like "%/jquery-latest.min.js%" ) 
and mimeType like "%script%" group by req_referer
