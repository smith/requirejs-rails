$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "requirejs/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "requirejs-rails"
  s.version     = Requirejs::Rails::Version
  s.authors     = ["John Whitley"]
  s.email       = ["whitley@bangpath.org"]
  s.homepage    = "http://github.com/jwhitley/requirejs-rails"
  s.summary     = "Use RequireJS with the Rails 3 Asset Pipeline"
  s.description = "This gem provides RequireJS support for your Rails 3 application."

  ignores = open('.gitignore').read.split("\n")
  files = Dir['{**/*,**/.*,.*}'].reject do |f|
    File.directory?(f) || ignores.any? { |i| File.fnmatch(i, f) }
  end.uniq.sort
  test_files, files = files.partition { |f| f =~ /^test/ }

  s.test_files = test_files
  s.files = files
  s.require_path = 'lib'  

  s.add_dependency "railties", ">= 3.1.1", "< 4.1"
  s.add_development_dependency "rails", ">= 3.1.1", "< 4.1"
  s.add_development_dependency "sqlite3"

  s.requirements << "node.js is required for 'rake assets:precompile', used to run the r.js build"
  s.requirements << "If needed, jQuery should be v1.7 or greater (jquery-rails >= 1.0.17)."
end
