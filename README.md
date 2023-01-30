# jekyll-node-module

This plugin copies assets from `node_modules` to your `_site` folder. By default, files are copied to folders named after the file's extension.

**Example:** `node_modules/jquery/dist/jquery.js` would be copied to `_site/js/jquery.js`. Likewise, `node_modules/font-awesome/css/font-awesome.css` would be copied to `_site/css/font-awesome.css`.

## Installation

This goes in your Gemfile:

```ruby
gem 'jekyll-node-module'
```

Next, run this:

    $ bundle

Then, add the plugin to your `_config.yml`:

```yaml
plugins:
- jekyll-node-module
```

Optional configuration:

```yaml
node_modules:
  modules_dir: node_modules
  assets:
    js: assets/scripts
    css: assets/styles
  copy:
  - source: font-awesome/fonts/
    target: assets/fonts
```

## Usage

```html
<link rel="stylesheet" href="{{ 'font-awesome/css/font-awesome.css' | node_module_url }}" />
<script src="{{ 'jquery/dist/jquery.js' | node_module_url }}"></script>
```

## Issues

Need help? Please create a [GitHub Issue](https://github.com/mintbit/jekyll-node-module/issues) and provide as much useful information as possible.

## License

This gem is free software, and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: LICENSE

## About

[![mintbit][mintbit-logo]][mintbit]

This gem was developed by [Mintbit], a Rails consultancy in Knoxville, Tennessee.  
If you'd like to [work with us][mintbit], don't hesitate to reach out.

[mintbit]: https://www.mintbit.com?utm_source=github
[mintbit-logo]: https://www.mintbit.com/uploads/logo-github.svg
