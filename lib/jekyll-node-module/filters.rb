module Jekyll
  module NodeModule
    module Filters
      def node_module_url(input)
        site = @context.registers[:site]
        path = File.join('node_modules', input)
        file = Jekyll::NodeModule::Asset.new(site, site.source, File.dirname(path), File.basename(path))

        unless site.static_files.map(&:path).include?(file.path)
          site.static_files << file
        end

        file.url
      end
    end
  end
end
