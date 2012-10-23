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

$:.push(File.join(Dir.getwd, 'lib/ansible'))
$:.push(File.join(Dir.getwd, 'lib/ansible/devices'))
$:.push(File.join(Dir.getwd, 'lib/ansible/knx'))
$:.push(File.join(Dir.getwd, 'lib/ansible/openzwave'))
$:.push(File.join(Dir.getwd, 'lib/ansible/zwave'))

require "rubygems"
require "bundler/setup"
require 'config'

require 'transceiver'
require 'zwave_transceiver'
require 'zwave_command_classes'

require 'knx_transceiver'
require 'knx_tools'
require 'knx_value'

require 'ansible_device'

include Ansible
include Ansible::ZWave
include Ansible::KNX