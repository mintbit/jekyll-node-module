module Jekyll
  module NodeModule
    module Filters
      def node_module_url(input)
        site = @context.registers[:site]
        base = site.config.dig('node_modules', 'modules_dir') || site.in_source_dir('node_modules')
        file = Jekyll::NodeModule::Asset.new(site, File.expand_path(base), File.dirname(input), File.basename(input))

        unless site.static_files.map(&:path).include?(file.path)
          site.static_files << file
        end

        file.url
      end
    end
  end
end
