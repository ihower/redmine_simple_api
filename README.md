# Redmine Simple API plugin

Provides a simple REST API for [Redmine](http://www.redmine.org/)

## Install

1. Add following code to /config/routes.rb

    map.connect 'simple\_api/:action', :controller => 'redmine\_simple\_api'
    map.connect 'simple\_api/:action.:format', :controller => 'redmine\_simple\_api'
    
2. Setup SIMPLE\_SECRET\_TOKEN in redmine\_simple\_api\_controller.rb

## Wiki API

Get Latest wikipage content

    GET /simple\_api/get\_wiki?token=blah&project\_id=foo&page=bar
    
Update/Create wikipage

    POST /simple\_api/update\_wiki?token=blah&project\_id=foo&page=bar&user=someone&content\_text=something

## Timelog API

Create issue timelog

    POST /simple_api/timelog_issue?token=blah&issue_id=1&activity_id=2&user=someone&hours=3&comments=something  

## Issue API

Get Issue information

    GET /simple\_api/get\_issue.[xml|json]?token=blah&issue\_id=5
  
## Author & License

Author: [Wen-Tien Chang](mailto:ihower@handlino.com)

Copyright (c) 2008 [Handlino Inc.](http://handlino.com)

Licensed under the MIT: http://www.opensource.org/licenses/mit-license.php
