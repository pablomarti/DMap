module Dmap
  module Generators
    class GenerateViewsGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../../../../app/views", __FILE__)
      desc "Generate Views of Dmap"

      def copy_views
        directory "dmap", "app/views/dmap"
      end      
    end
  end
end