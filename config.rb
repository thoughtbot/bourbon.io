set :css_dir, "assets/stylesheets"
set :fonts_dir, "assets/fonts"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"
set :markdown_engine, :redcarpet
set :markdown, :smartypants => true
set :relative_links, true

activate :autoprefixer do |config|
  config.browsers = ["> 1%", "last 5 versions", "Explorer >= 9"]
end
activate :directory_indexes

configure :development do
  activate :livereload
  set :debug_assets, true
end

configure :build do
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
end

configure :deploy do
  # deploy.method = :git
end
