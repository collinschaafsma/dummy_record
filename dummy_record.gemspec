# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dummy_record/version"

Gem::Specification.new do |s|
  s.name        = "dummy_record"
  s.version     = DummyRecord::VERSION
  s.authors     = ["Collin Schaafsma"]
  s.email       = ["collin@quickleft.com"]
  s.homepage    = "https://github.com/collinschaafsma/dummy_record"
  s.summary     = %q{Make objects that act like ActiveRecord::Base objects that don't need a DB. Use it in your tests!}
  s.description = %q{Make objects that act like ActiveRecord::Base objects that don't need a DB. Use it in your tests!}

  s.rubyforge_project = "dummy_record"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.8.0"
  s.add_runtime_dependency "activerecord", "~> 3.2.0"
end
