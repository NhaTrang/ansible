Gem::Specification.new do |s|
  s.name        = 'ansible'
  s.version     = '0.0.1'
  s.date        = '2012-10-22'
  s.summary     = "Ruby-based home automation scripting framework for KNX and ZWave devices."
  s.description = "A simple hello world gem"
  s.authors     = ["Elias Karakoulakis (ekarak)", "Justin Grevich (jgrevich)"]
  s.email       = ['elias.karakoulakis@gmail.com', 'justin@grevi.ch']
  s.files       = Dir["lib/**/*.rb"]
  s.homepage    = 'https://github.com/jgrevich/ansible'
  s.requirements << "KNX or ZWave controller + Devices"
  s.requirements << "stompserver_ng"
  s.requirements << "Thrift4OZW"
end