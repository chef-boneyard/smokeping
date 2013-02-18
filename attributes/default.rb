#
# Cookbook Name:: smokeping
# Attributes:: default
#
# Copyright 2013, Limelight Networks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['smokeping']['site_remark_owner'] = "Some Company"
default['smokeping']['admin_name']  = nil
default['smokeping']['admin_email']  = nil
default['smokeping']['alert_email']  = nil

default['smokeping']['server_name']  = "smokeping"
default['smokeping']['server_alias'] = nil
default['smokeping']['port']  = 80

default['smokeping']['smtp_host']  = nil

default['smokeping']['syslog_facility'] = "local0"