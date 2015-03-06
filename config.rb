set :css_dir, "assets/stylesheets"
set :fonts_dir, "assets/fonts"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"
# set :markdown_engine, :redcarpet
# set :markdown, :smartypants => true
set :relative_links, true

data_files = Dir.glob("./data/*.json")
AVAILABLE_VERSIONS = data_files.map { |f| /\d_\d_\d/.match(f).to_s }

AVAILABLE_VERSIONS.each do |version|
  proxy "/docs/#{version}.html", "/docs/index.html", :ignore => true
end

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
  deploy.build_before = true
  deploy.method = :git
end
