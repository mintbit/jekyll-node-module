Jekyll::Hooks.register :site, :post_write do |site|
  assets = site.config.dig('node_modules', 'copy') || []
  assets.each do |asset|
    source = site.in_source_dir('node_modules', asset['source'])
    target = site.in_dest_dir(asset['target'])

    Jekyll.logger.info 'Copying:', %(#{source} => #{target})

    FileUtils.mkdir_p(target)
    FileUtils.cp_r(File.join(source, '.'), target)
  end
end
