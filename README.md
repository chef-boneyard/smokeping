Smokeping Cookbook
=================
[![Build Status](https://travis-ci.org/tas50/smokeping-chef.svg?branch=master)](https://travis-ci.org/tas50/smokeping-chef)

Installs and configures the SmokePing server and fping service

SmokePing:
http://oss.oetiker.ch/smokeping/	

fping
http://fping.sourceforge.net/

Requirements
============

### Platform
* Ubuntu 10.04 / Ubuntu 12.04
* Debian

### Chef Cookbooks
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
Apply the recipe to a the nodes runlist and run Chef

## Hardcoding Targets

If you would like to add a couple machines, open up [templates/default/Targets.erb](templates/default/Targets.erb) and add something like the following before the `datacenter` parsing.
```
+ Public                                                                                           
menu = Public                                                           
title = Public

++ somehost
host = somehost.mydomain.net  
```

