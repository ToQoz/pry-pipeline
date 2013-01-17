# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pry-pipeline/version'

Gem::Specification.new do |gem|
  gem.name          = "pry-pipeline"
  gem.version       = PryPipeline::VERSION
  gem.authors       = ["Takatoshi Matsumoto"]
  gem.email         = ["toqoz403@gmail.com"]
  gem.description   = %q{Pipeline for pry}
  gem.summary       = %q{Pipeline for pry. This adds `_pipe_` and `|` methods to String and Symbol}
  gem.homepage      = "https://github.com/ToQoz/pry-pipeline"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'pry'
end
