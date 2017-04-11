# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "itiel/version"

Gem::Specification.new do |s|
  s.name        = "itiel"
  s.version     = Itiel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Padilla"]
  s.email       = ["david@padilla.cc"]
  s.homepage    = "http://github.com/dabit/itiel"
  s.summary     = %q{DSL for ETL in Ruby}
  s.description = %q{DSL for ETL in Ruby}

  s.rubyforge_project = "itiel"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activesupport', '~> 4.0'
  s.add_dependency 'activerecord' , '~> 4.0'
  s.add_dependency 'sequel'

  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.5.0'
  s.add_development_dependency 'rr'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'turn'
end
