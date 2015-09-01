Smokeping Cookbook
=================
[![Build Status](https://travis-ci.org/tas50/chef-smokeping.svg?branch=master)](https://travis-ci.org/tas50/chef-smokeping)
[![Cookbook Version](https://img.shields.io/cookbook/v/smokeping.svg)](https://supermarket.chef.io/cookbooks/smokeping)

Installs and configures the SmokePing server and fping service

SmokePing:
http://oss.oetiker.ch/smokeping/

fping
http://fping.org/

Requirements
============
### Chef
Chef 11+

### Platform
* Ubuntu 10.04+
* Debian

### Cookbooks:
* Apache cookbook
* Perl cookbook

Attributes
==========
```ruby
default['smokeping']['site_remark_owner'] = 'Some Company'
default['smokeping']['admin_name']  = '<admin name>'
default['smokeping']['admin_email']  = '<admin email>'
default['smokeping']['alert_email']  = '<alert email>'
```


Usage
=====

The right way to use this cookbook is to create a new site-specific cookbook
that look up the needed data and pass them to this cookbook via the Target
provider.

## Using the Target provider

```ruby
  # Expected data structure
   data = {
     "name" => "Production"
      nodes => ["nodea", "nodeb"],
      slaves => ["nodeb"]
   }

   smokeping_target "name" do
   action :create
   variables(
      :data => data
      )
   end
```

Apply the recipe to a the nodes runlist and run Chef

License and Author
==================

Author:: Tim Smith (<tsmith84@gmail.com>)

Copyright:: 2013-2014, Limelight Networks, Inc.

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
