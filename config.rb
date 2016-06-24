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

latest_version = versions.max { |a, b| a.to_s <=> b.to_s }

versions.each do |version|
  proxy(
    "/docs/#{version}/index.html",
    "/docs/version/index.html",
    locals: {
      version: version,
      versions: versions,
    },
    ignore: true,
  )
end

proxy(
  "/docs/latest/index.html",
  "/docs/version/index.html",
  locals: {
    version: latest_version,
    versions: versions,
  },
  ignore: true,
)

proxy("_redirects", "redirects", ignore: true)

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
