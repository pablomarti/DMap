module Dmap
  
  require 'rubygems'
  require 'sass-rails'
  require 'simple_user'
  require 'ckeditor'
  require 'acts-as-taggable-on'
  require 'select2-rails'
  require 'pygments.rb'
  require 'redcarpet'
  require 'sunspot_rails'
  require 'sunspot_solr'
  require 'progress_bar'
  require 'will_paginate'
  require 'friendly_id'
  require 'rails-i18n'

  class Engine < ::Rails::Engine
    isolate_namespace Dmap

    config.generators.load_generators

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'dmap_config.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value.to_s
      end if File.exists?(env_file)
  	end
  end

end