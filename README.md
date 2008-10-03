# RedmineSimpleAPI 

Provides a simple REST API for [Redmine](http://www.redmine.org/)

# Usage

1. Add following code to /config/routes.rb

    map.connect 'simple\_api/:action', :controller => 'redmine\_simple\_api'

2. Setup SIMPLE\_SECRET\_TOKEN in redmine\_simple\_api\_controller.rb

## Wiki API

Get Latest wikipage content

    GET /simple\_api/get\_wiki?token=blah&project\_id=foo&page=bar
    
Update wikipage

    POST /simple\_api/update\_wiki?token=blah&project\_id=foo&page=bar&user=someone&content\_text=something

# Author & License

Author: [Wen-Tien Chang](mailto:ihower@handlino.com)
Copyright (c) 2008 [Handlino Inc.](http://handlino.com)
Licensed under the MIT: http://www.opensource.org/licenses/mit-license.php
