require 'fileutils'
require 'jekyll'

require 'jekyll-node-module/version'
require 'jekyll-node-module/asset'
require 'jekyll-node-module/hook'
require 'jekyll-node-module/filters'

Liquid::Template.register_filter(Jekyll::NodeModule::Filters)
