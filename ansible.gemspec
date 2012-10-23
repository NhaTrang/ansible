# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ansible/version"

Gem::Specification.new do |s|

  s.name        = 'ansible4ozw'
  s.version     = Ansible::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Ruby-based home automation scripting framework for KNX and ZWave devices."
  s.description = "Ruby-based home automation scripting framework for KNX and ZWave devices."
  s.authors     = ["Elias Karakoulakis (ekarak)", "Justin Grevich (jgrevich)"]
  s.email       = ['elias.karakoulakis@gmail.com', 'justin@grevi.ch']
  s.homepage    = 'https://github.com/jgrevich/ansible'
  s.requirements << "KNX or ZWave controller + Devices"
  s.requirements << "stompserver_ng"
  s.requirements << "Thrift4OZW"
  
  s.require_paths = ['lib']
  s.files       = Dir.glob("lib/**/*") + Dir.glob("lib/**/**/*") + Dir.glob("lib/**/**/**/*")
  
  s.add_dependency("bindata", "~> 1.4.5")
  s.add_dependency("onstomp", '~> 1.0.7')
  s.add_dependency("thrift", "~> 0.9.0")
  
end