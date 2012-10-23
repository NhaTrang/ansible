=begin
Project Ansible  - An extensible home automation scripting framework
----------------------------------------------------
Copyright (c) 2011 Elias Karakoulakis <elias.karakoulakis@gmail.com>

SOFTWARE NOTICE AND LICENSE

Project Ansible is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation, either version 3 of the License,
or (at your option) any later version.

Project Ansible is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with Project Ansible.  If not, see <http://www.gnu.org/licenses/>.

for more information on the LGPL, see:
http://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License
=end

# ruby core
require "rubygems"
require "bundler/setup"
require 'onstomp'
require 'thrift'

# ansible core
require 'ansible/config'
# note: I would like to convert this to ansible/device
require 'ansible/ansible_device'
require 'ansible/transceiver'
require 'ansible/ansible_value'

# ansible extensions
require 'ansible/knx'
require 'ansible/zwave'

# include all
include Ansible
include Ansible::ZWave
include Ansible::KNX