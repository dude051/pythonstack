# Encoding: utf-8
#
# Cookbook Name:: pythonstack
# Recipe:: default
#
# Copyright 2014, Rackspace UK, Ltd.
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

stackname = 'pythonstack'

default[stackname]['newrelic']['application_monitoring'] = ''
default[stackname]['webserver'] = 'apache'
default[stackname]['ini']['cookbook'] = stackname

default[stackname]['mysql']['databases'] = {}
default[stackname]['apache']['sites'] = {}
default[stackname]['nginx']['sites'] = {}

default[stackname]['webserver_deployment']['enabled'] = true
default[stackname]['code-deployment']['enabled'] = true
default[stackname]['db-autocreate']['enabled'] = true
