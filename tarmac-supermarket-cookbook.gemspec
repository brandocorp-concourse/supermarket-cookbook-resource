# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "tarmac-supermarket-cookbook"
  spec.version       = File.read('VERSION').strip
  spec.authors       = ["Brandon Raabe"]
  spec.email         = ["brandon.raabe@ge.com"]

  spec.summary       = %q{Concourse Supermarket Cookbook Resource}
  spec.description   = %q{A Concourse CI Resource which represents a Supermarket Cookbook}
  spec.homepage      = "https://github.com/tarmac/tarmac-supermarket-cookbook"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
