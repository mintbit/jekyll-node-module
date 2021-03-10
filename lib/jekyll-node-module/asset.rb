module Jekyll
  module NodeModule
    class Asset < StaticFile
      def initialize(site, base, dir, name)
        super
        @relative_path = File.join(destination_rel_dir, @name)
      end

      def destination(dest)
        @site.in_dest_dir(dest, destination_rel_dir, @name)
      end

      def destination_rel_dir
        dest = @site.config.dig('node_modules', 'assets', file_type)
        File.join('/', dest || file_type)
      end

      def file_type
        extname[1..-1]
      end
    end
  end
end
