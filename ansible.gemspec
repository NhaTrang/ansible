Gem::Specification.new do |s|
  s.name        = 'ansible4ozw'
  s.version     = '0.0.2'
  s.date        = '2012-10-22'
  s.summary     = "Ruby-based home automation scripting framework for KNX and ZWave devices."
  s.description = "A simple hello world gem"
  s.authors     = ["Elias Karakoulakis (ekarak)", "Justin Grevich (jgrevich)"]
  s.email       = ['elias.karakoulakis@gmail.com', 'justin@grevi.ch']
  s.platform    = Gem::Platform::RUBY
  s.require_paths = ['lib', 'lib/ansible']
  s.files       = Dir["lib/**/*.rb"]
  s.add_dependency("bindata", "~> 1.4.5")
  s.add_dependency("onstomp", '~> 1.0.7')
  s.add_dependency("thrift", "~> 0.9.0")
  s.homepage    = 'https://github.com/jgrevich/ansible'
  s.requirements << "KNX or ZWave controller + Devices"
  s.requirements << "stompserver_ng"
  s.requirements << "Thrift4OZW"
end