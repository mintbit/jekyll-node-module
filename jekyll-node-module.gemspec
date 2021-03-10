lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'jekyll-node-module/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-node-module'
  spec.version       = Jekyll::NodeModule::VERSION
  spec.authors       = ['Mintbit']
  spec.email         = ['team@mintbit.com']
  spec.summary       = 'Node module dependency management for Jekyll'
  spec.description   = 'A simple way to include node module assets in your Jekyll build'
  spec.homepage      = 'https://github.com/mintbit/jekyll-node-module'
  spec.licenses      = ['MIT']

  spec.files         = `git ls-files -z lib/`.split("\u0000")
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'jekyll', ['>= 2.0', "< 5.0"]
end
