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

default['smokeping']['site_remark_owner'] = 'Some Company'
default['smokeping']['admin_name']  = nil
default['smokeping']['admin_email']  = nil
default['smokeping']['alert_email']  = nil

default['smokeping']['server_name']  = 'smokeping'
default['smokeping']['server_alias'] = nil
default['smokeping']['port']  = 80
default['smokeping']['targets']  = nil
default['smokeping']['etc_dir']  = '/etc/smokeping'

default['smokeping']['master_mode'] = false
default['smokeping']['slave_mode'] = false
default['smokeping']['slave_secret'] = nil

default['smokeping']['smtp_host']  = nil

default['smokeping']['syslog_facility'] = 'local0'

default['smokeping']['alerts'] = [
  {
    'name' => 'bigloss',
    'type' => 'loss',
    'pattern' => '==0%,==0%,==0%,==0%,>0%,>0%,>0%',
    'comment' => 'suddenly there is packet loss'
  },
  {
    'name' => 'someloss',
    'type' => 'loss',
    'pattern' => '>0%,*12*,>0%,*12*,>0%',
    'comment' => 'loss 3 times  in a row'
  },
  {
    'name' => 'startloss',
    'type' => 'loss',
    'pattern' => '==S,>0%,>0%,>0%',
    'comment' => 'loss at startup'
  },
  {
    'name' => 'rttdetect',
    'type' => 'rtt',
    'pattern' => '<10,<10,<10,<10,<10,<100,>100,>100,>100',
    'comment' => 'routing messed up again ?'
  }
]
