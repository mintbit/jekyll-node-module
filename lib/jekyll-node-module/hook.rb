Jekyll::Hooks.register :site, :post_write do |site|
  assets = site.config.dig('node_modules', 'copy') || []
  base = site.config.dig('node_modules', 'modules_dir') || site.in_source_dir('node_modules')

  assets.each do |asset|
    source = File.expand_path(asset['source'], base)
    target = site.in_dest_dir(asset['target'])

    Jekyll.logger.info 'Copying:', %(#{source} => #{target})

    FileUtils.mkdir_p(target)
    FileUtils.cp_r(File.join(source, '.'), target)
  end
end
