require 'rubygems'
spac = Gem::Specification.new do |s|
  s.name = 'string_extend'
  s.version = '0.0.1'
  s.summary = 'Useful extension for classes'
  s.files = Dir.glob("**/**/**")
  s.test_files = Dir.glob("test/*_test.rb")
  s.author = "Draco Li"
  s.email = "draco@dracoli.com"
  s.has_rdoc = false
  s.required_ruby_version = '>= 1.8.2'
end