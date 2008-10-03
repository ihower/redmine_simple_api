# RedmineSimpleAPI 

Provides a simple REST API for [Redmine](http://www.redmine.org/)

# Usage

1. Add following code to /config/routes.rb

    map.connect 'simple_api/:action', :controller => 'redmine_simple_api'

2. Setup SIMPLE_SECRET_TOKEN in redmine_simple_api_controller.rb

## Wiki API

Get Lastest wikipage content
    /simple_api/get_wiki?token=blah&project_id=foo&page=bar
    
Update wikipage
    /simple_api/update_wiki?token=blah&project_id=foo&page=bar&user=someone&content_text=something

# Author & License

Author: [Wen-Tien Chang](mailto:ihower@handlino.com)
Copyright (c) 2008 [Handlino Inc.](http://handlino.com)
Licensed under the MIT: http://www.opensource.org/licenses/mit-license.php
