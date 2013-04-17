module Dmap
  module Generators

    class BasicInstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Basic Install Dmap"

      def copy_config_file
        copy_file "dmap_config.yml", "config/dmap_config.yml"
      end

      def copy_migrations
      	rake "dmap:install:migrations"
        Dmap::Engine.load_seed
      end  
    end
    
  end
end