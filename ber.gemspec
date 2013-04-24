# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ber/version'

Gem::Specification.new do |gem|
  gem.name          = "ber"
  gem.version       = Ber::VERSION
  gem.authors       = ["Arcath"]
  gem.email         = ["adam@arcath.net"]
  gem.description   = %q{An implementation of BER (Basic Encoding Rules) in Ruby}
  gem.summary       = %q{An implementation of BER (Basic Encoding Rules) in Ruby}
  gem.homepage      = "https://github.com/Arcath/BER"
  
  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
