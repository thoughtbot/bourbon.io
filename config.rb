require "lib/version"

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :directory_indexes
activate :syntax do |syntax|
  syntax.css_class = "syntax-highlight"
end

set :css_dir, "assets/stylesheets"
set :markdown_engine, :redcarpet
set :markdown do |markdown|
  markdown.fenced_code_blocks = true
  markdown.smartypants = true
  markdown.with_toc_data = true
end

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

versions = Dir.glob("./data/*.json").map { |version| Version.new(version) }

versions.each do |version|
  proxy(
    "/docs/#{version}.html",
    "/docs/index.html",
    locals: {
      version: version,
      versions: versions,
    },
    ignore: true,
  )
end

configure :development do
  activate :livereload do |reload|
    reload.no_swf = true
  end
end

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_html
end
