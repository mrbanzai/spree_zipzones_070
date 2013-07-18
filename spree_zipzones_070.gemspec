# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_zipzones_070'
  s.version     = '0.2.0'
  s.summary     = 'Enables zipcode zones.'
  s.description = 'Adds zipcode functionality equivalent to that of states. Used for the Spree eCommerce framework.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Cameron Carroll'
  s.email             = 'ckcarroll4@gmail.com'

  #s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.3.2'
  #s.add_development_dependency 'rspec-rails'
end

