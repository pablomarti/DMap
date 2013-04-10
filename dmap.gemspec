$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dmap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dmap"
  s.version     = Dmap::VERSION
  s.authors     = ["Pablo Marti"]
  s.email       = ["pablo.marti89@gmail.com"]
  s.homepage    = "https://github.com/pablomarti/dmap"
  s.summary     = "Manage your blog with cool data-mining features."
  s.description = "Manage your blog with cool data-mining features, a map of your posts, the relationships between the posts, and integration with SN."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "sass-rails", "~> 3.2.3"
  s.add_dependency "simple_user"
  s.add_dependency "ckeditor"
  s.add_dependency "acts-as-taggable-on"
  s.add_dependency "select2-rails"
  s.add_dependency "pygments.rb"
  s.add_dependency "redcarpet"
  s.add_dependency "sunspot_rails"
  s.add_dependency "sunspot_solr"
  s.add_dependency "progress_bar"
  s.add_dependency "will_paginate", "~> 3.0"
  s.add_dependency "friendly_id"
  s.add_dependency "rails-i18n"

  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "sqlite3"
end